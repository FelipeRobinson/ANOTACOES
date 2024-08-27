-- 1)
CREATE FUNCTION CalcularDigitoVerificador (@nrConta INT)
RETURNS INT
AS
BEGIN
    -- o DECLARE pode ser um valor (seja INT, CHAR, VARCHAR) e adicionamos um nome para poder 'seta-lo'
    DECLARE @metadeDaConta INT;
    DECLARE @digitoVerificado INT;

    -- Aqui pegamos a declaração da metade do número da CONTA
    SET @metadeDaConta = @nrConta / 2;

    -- Aqui verificamos qual é o último número apos a metade ter sido definido
    SET @digitoVerificado = @metadeDaConta % 10;

    RETURN @digitoVerificado;
END;



-- 2)
CREATE FUNCTION ObterSaldoNaData (
    -- Obtendo os parâmetros --
    @nrConta INT,
    @idAgencia INT,
    @data SMALLDATETIME
)
RETURNS MONEY
AS
BEGIN
    -- DECLARANDO as VARIÁVEIS --
    DECLARE @saldoInicial MONEY;
    DECLARE @saldoFinal MONEY;
    DECLARE @creditos MONEY;
    DECLARE @debitos MONEY;

    -- Pegando o saldo inicial da CONTA --
    SELECT @saldoInicial = saldo
      FROM trCONTA
     WHERE nrConta = @nrConta AND idAgencia = @idAgencia;

    -- Calculando o total de crédito até a data de referencia --
    SELECT @creditos = ISNULL(SUM(valor), 0)
      FROM trMOVIMENTACAO
     WHERE nrConta = @nrConta AND idAgencia = @idAgencia
           AND data <= @data
           AND credito = 1;

    -- Calculando o total de débito até a data de referência --
    SELECT @debitos = ISNULL(SUM(valor), 0)
      FROM trMOVIMENTACAO
     WHERE nrConta = @nrConta AND idAgencia = @idAgencia
           AND data <= @data
           AND credito = 0;

    -- Calculando o valor final, sendo ele a soma do saldo inicial e do crédito, e a subtração do débito pelo crédito --
    SET @saldoFinal = @saldoInicial + @creditos - @debitos;

    -- RETORNANDO O SALDO FINAL --
    RETURN @saldoFinal;
END;



-- 3)
CREATE FUNCTION ObterValorPrevistoNaData (
    @nrConta INT,
    @idAgencia INT,
    @dataFutura SMALLDATETIME
)
RETURNS MONEY
AS
BEGIN
    DECLARE @saldoAtual MONEY;
    DECLARE @creditosFuturos MONEY;
    DECLARE @debitosFuturos MONEY;

    SELECT @saldoAtual = saldo
      FROM trCONTA
     WHERE nrConta = @nrConta AND idAgencia = @idAgencia;

    SELECT @creditosFuturos = ISNULL(SUM(valor), 0)
      FROM trMOVIMENTACAO
     WHERE nrConta = @nrConta AND idAgencia = @idAgencia
           AND data <= @dataFutura
           AND credito = 1;

    SELECT @debitosFuturos = ISNULL(SUM(valor), 0)
      FROM trMOVIMENTACAO
     WHERE nrConta = @nrConta AND idAgencia = @idAgencia
           AND data <= @dataFutura
           AND credito = 0;

    SELECT @creditosFuturos = @creditosFuturos + ISNULL(SUM(valor), 0)
      FROM trAGENDAMENTO
     WHERE nrConta = @nrConta AND idAgencia = @idAgencia
           AND data <= @dataFutura
           AND credito = 1;

    SELECT @debitosFuturos = @debitosFuturos + ISNULL(SUM(valor), 0)
      FROM trAGENDAMENTO
     WHERE nrConta = @nrConta AND idAgencia = @idAgencia
           AND data <= @dataFutura
           AND credito = 0;

    RETURN @saldoAtual + @creditosFuturos - @debitosFuturos;
END;



-- 4)
CREATE PROCEDURE TransferirValores
    @nrContaOrigem INT,
    @idAgenciaOrigem INT,
    @nrContaDestino INT,
    @idAgenciaDestino INT,
    @valor MONEY
AS
BEGIN
    -- Verifica se o valor de transferência é positivo
    IF @valor <= 0
    BEGIN
        RAISERROR('O valor da transferência deve ser maior que zero.', 16, 1);
        RETURN;
    END

    -- Inicia uma transação
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Verifica se a conta de origem tem saldo suficiente
        DECLARE @saldoOrigem MONEY;
        SELECT @saldoOrigem = saldo
          FROM trCONTA
         WHERE nrConta = @nrContaOrigem AND idAgencia = @idAgenciaOrigem;

        IF @saldoOrigem IS NULL
        BEGIN
            RAISERROR('Conta de origem não encontrada.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        IF @saldoOrigem < @valor
        BEGIN
            RAISERROR('Saldo insuficiente na conta de origem.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Atualiza o saldo da conta de origem
        UPDATE trCONTA
           SET saldo = saldo - @valor
         WHERE nrConta = @nrContaOrigem AND idAgencia = @idAgenciaOrigem;

        -- Atualiza o saldo da conta de destino
        UPDATE trCONTA
           SET saldo = saldo + @valor
         WHERE nrConta = @nrContaDestino AND idAgencia = @idAgenciaDestino;

        -- Registra a movimentação na conta de origem (débito)
        INSERT INTO trMOVIMENTACAO (idAgencia, nrConta, data, descricao, valor, credito)
        VALUES (@idAgenciaOrigem, @nrContaOrigem, GETDATE(), 'Transferência para conta ' + CAST(@nrContaDestino AS VARCHAR), @valor, 0);

        -- Registra a movimentação na conta de destino (crédito)
        INSERT INTO trMOVIMENTACAO (idAgencia, nrConta, data, descricao, valor, credito)
        VALUES (@idAgenciaDestino, @nrContaDestino, GETDATE(), 'Transferência recebida de conta ' + CAST(@nrContaOrigem AS VARCHAR), @valor, 1);

        -- Se tudo estiver correto, faz o commit
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Em caso de erro, faz o rollback da transação
        ROLLBACK TRANSACTION;
        -- Lança o erro novamente para ser capturado pela aplicação ou ambiente de execução
        THROW;
    END CATCH
END;



-- 5)
CREATE PROCEDURE ExecutarAgendamentos
    @data SMALLDATETIME
AS
BEGIN
    -- Inicia uma transação
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Declara variáveis para armazenar dados dos agendamentos
        DECLARE @idAgencia INT;
        DECLARE @nrConta INT;
        DECLARE @valor MONEY;
        DECLARE @descricao VARCHAR(50);
        DECLARE @credito BIT;

        -- Cursor para iterar sobre os agendamentos na data fornecida
        DECLARE agendamento_cursor CURSOR FOR
        SELECT idAgencia, nrConta, valor, descricao, credito
          FROM trAGENDAMENTO
         WHERE data = @data;

        OPEN agendamento_cursor;

        FETCH NEXT FROM agendamento_cursor INTO @idAgencia, @nrConta, @valor, @descricao, @credito;

        WHILE @@FETCH_STATUS = 0
        BEGIN
            -- Verifica se a operação é de crédito ou débito
            IF @credito = 1
            BEGIN
                -- Atualiza o saldo da conta de destino (crédito)
                UPDATE trCONTA
                   SET saldo = saldo + @valor
                 WHERE nrConta = @nrConta AND idAgencia = @idAgencia;
                
                -- Registra a movimentação na conta de destino (crédito)
                INSERT INTO trMOVIMENTACAO (idAgencia, nrConta, data, descricao, valor, credito)
                VALUES (@idAgencia, @nrConta, @data, @descricao, @valor, 1);
            END
            ELSE
            BEGIN
                -- Atualiza o saldo da conta de origem (débito)
                UPDATE trCONTA
                   SET saldo = saldo - @valor
                 WHERE nrConta = @nrConta AND idAgencia = @idAgencia;
                
                -- Registra a movimentação na conta de origem (débito)
                INSERT INTO trMOVIMENTACAO (idAgencia, nrConta, data, descricao, valor, credito)
                VALUES (@idAgencia, @nrConta, @data, @descricao, @valor, 0);
            END

            -- Obtém o próximo agendamento
            FETCH NEXT FROM agendamento_cursor INTO @idAgencia, @nrConta, @valor, @descricao, @credito;
        END

        CLOSE agendamento_cursor;
        DEALLOCATE agendamento_cursor;

        -- Remove os agendamentos executados
        DELETE FROM trAGENDAMENTO
         WHERE data = @data;

        -- Se tudo estiver correto, faz o commit
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Em caso de erro, faz o rollback da transação
        ROLLBACK TRANSACTION;
        -- Lança o erro novamente para ser capturado pela aplicação ou ambiente de execução
        THROW;
    END CATCH
END;



-- 6)
