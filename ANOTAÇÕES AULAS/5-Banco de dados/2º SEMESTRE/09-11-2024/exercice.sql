-- 1) Crie uma Stored Procedure que, fazendo uso de um cursor, 
-- realize os agendamentos para uma determinada data que será re-
-- cebida como parâmetro. A operação só poderá ser realizada caso 
-- a conta não fique com saldo negativo ou se a operação deixar o 
-- saldo negativo para uma conta do tipo 1 (especial)

DECLARE 


CREATE PROCEDURE Agendamento
    -- VARIÁVEIS --
    @valor MONEY
    @credito MONEY
    @debito MONEY
    @conta INT
    @

AS

    if (@debito - @valor < 0)
        ROLLBACK 