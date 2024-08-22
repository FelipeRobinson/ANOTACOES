-- 1) --
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


-- 2) --
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


-- 3) --
CREATE FUNCTION ObterValorCreditádoNaData (
    -- Obtendo os parâmetros --
    @nrConta INT,
    @idAgencia INT,
    @dataFutura SMALLDATETIME
)
RETURNS MONEY
AS
BEGIN
    -- DECLARANDO as VARIÁVEIS --
    DECLARE @saldoAtual MONEY;
    DECLARE @saldoPrevisto MONEY;
    DECLARE @creditosFuturos MONEY;
    DECLARE @debitosFuturos MONEY;

    

    -- Pegando o saldo atual da CONTA --
    SELECT @saldoAtual = saldo
      FROM trCONTA
     WHERE nrConta = @nrConta AND idAgencia = @idAgencia;

    -- Calculando o total de crédito até a data de referencia --
    SELECT @creditosFuturos = ISNULL(SUM(valor), 0)
      FROM trMOVIMENTACAO
     WHERE nrConta = @nrConta AND idAgencia = @idAgencia
           AND data > GETDATE()
           AND data > @dataFutura
           AND credito = 1;

    -- Calculando o total de débito até a data de referência --
    SELECT @debitosFuturos = ISNULL(SUM(valor), 0)
      FROM trMOVIMENTACAO
     WHERE nrConta = @nrConta AND idAgencia = @idAgencia
           AND data > GETDATE() <= @dataFutura
           AND credito = 0;

    -- Calculando o valor final, sendo ele a soma do saldo inicial e do crédito, e a subtração do débito pelo crédito --
    SET @saldoPrevisto = @saldoAtual + @creditosFuturos - @debitosFuturos;

    -- RETORNANDO O SALDO FINAL --
    RETURN @saldoPrevisto;
END;