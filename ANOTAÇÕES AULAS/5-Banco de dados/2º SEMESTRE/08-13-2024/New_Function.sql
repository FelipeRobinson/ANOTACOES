CREATE FUNCTION ModDois (@NUMERO INT)
    RETURNS INT
AS
BEGIN
    DECLARE @res int

    -- RESTO = 0 -> PAR
    SET @RES = @NUMERO % 2

    RETURN @RES

END

-- Testando ...
DECLARE @r int
exec @r= ModDois 11
SELECT @r

PRINT CASE dbo.ModDois(10)
    WHEN 0 THEN 'PAR'
    ELSE 'IMPAR' 
END