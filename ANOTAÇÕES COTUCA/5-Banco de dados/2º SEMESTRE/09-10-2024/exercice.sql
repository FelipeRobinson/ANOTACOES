SELECT * FROM curClientes
SELECT * FROM curProdutos
SELECT * FROM curVendas
SELECT * FROM curItens

INSERT INTO curItens
VALUES (1, 1, 80, 800),
       (1, 2, 10, 100),
       (2, 3, 20, 240)

-- PROCEDURE p/concluir a venda --
CREATE PROCEDURE sp_finaliza_venda (@VenCod INTEGER) AS
    DECLARE CurItens
    CURSOR FOR
        SELECT idProd, quantidade
          FROM Itens 
         WHERE idVenda = @VenCod

    DECLARE @ProdCod INTEGER, @Qtd MONEY

    -- INICIANDO a transação
    BEGIN TRANSACTION
    OPEN CurItens

    FETCH NEXT FROM CurItens
               INTO @ProdCod, @Qtd

    -- INICIANDO O LAÇO
    WHILE @@FETCH_STATUS = 0
    BEGIN
        if (SELECT estoque - @Qtd FROM curProdutos WHERE id = @ProdCod) >= 0
            UPDATE curProdutos
               SET estoque = estoque - @Qtd
             WHERE id = @ProdCod
        else
            BEGIN

            -- DESFAZENDO CASO ERRO --
            ROLLBACK TRANSACTION

            -- MOSTARNDO O ERRO --
            RAISERROR('Estoque insuficiente!', 15, 1)

            -- FECHANDO O CURSOR --
            CLOSE CurItens
            DEALLOCATE CurItens

            -- SAINDO DO PROCEDIMENTO --
            RETURN

        -- Fechando o ELSE --
        END

    -- Linha de baixo do CURSOR --
    FETCH NEXT FROM CurItens
               INTO @ProdCod, @Qtd
    
    -- Fechando o WHILE --
    END

    -- Fim do deslocamento do cursor --
    CLOSE CurItens
    DEALLOCATE CurItens


    -- Caso tudo tenha dado certo --
    UPDATE Vendas
       SET situacao = 1
     WHERE id = @VenCod

    -- Confirmando a transação --
    COMMIT TRANSACTION