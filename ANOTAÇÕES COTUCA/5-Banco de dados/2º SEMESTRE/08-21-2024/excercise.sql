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

    -- Aqui verificamos qual é o último número apos a metade
    SET @digitoVerificado = @metadeDaConta % 10;

    RETURN @digitoVerificado;
END;



-- 2)
CREATE FUNCTION ObterSaldoNaData (
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

    SELECT @creditos = ISNULL(SUM(valor), 0)
      FROM trMOVIMENTACAO
     WHERE nrConta = @nrConta AND idAgencia = @idAgencia
           AND data <= @data
           AND credito = 1;

    SELECT @debitos = ISNULL(SUM(valor), 0)
      FROM trMOVIMENTACAO
     WHERE nrConta = @nrConta AND idAgencia = @idAgencia
           AND data <= @data
           AND credito = 0;

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
CREATE PROCEDURE SP_transf
    @agenciaOrigem int,
    @contaOrigem int,
    @agenciaDestino int,
    @contaDestino int,
    @valor as money
AS
    -- creditar o valor no Destino --
    INSERT INTO trMOVIMENTACAO (idAgencia, nrConta, data, descricao, valor, credito)
         VALUES (@agenciaDestino, @contaDestino, getdade(), 'Transferência para: ', @valor, 0)
    -- debitar o valor na Origem --
    INSERT INTO trMOVIMENTACAO (idAgencia, nrConta, data, descricao, valor, credito)
         VALUES (@agenciOrigem, @contaOrigem, getdade(), 'Transferência para: ', @valor, 0)
GO

SELECT * FROM trConta
SELECT * FROM trMOVIMENTACAO
-- EXECUTANDO: --
exec SP_transf
    @agenciaOrigem =, 
    @contaOrigem =, 
    @agenciaDestino =, 
    @contaDestino =, 
    @valor =



-- 5)
CREATE PROCEDURE 
    @
    @
    @
    @
    @
AS
    if @credito = 1
    else
        DECLARE @tipo as BIT
        SET @tipo = (SELECT tipo
                       FROM trCONTA
                      WHERE idAgencia= @agencia and
                            nrConta = @conta)






        DECLARE @saldoAnterior as Money
        SET @saldoAnterior = (SELECT saldo
                                FROM trCONTA
                               WHERE idAgencia = @agencia and
                                     nrConta = @conta) - valor
    if @saldo >= 0
    else 


    INSERT INTO trMOVIMENTACAO (idAgencia, nrConta, data, descricao, valor, credito)
         VALUES 