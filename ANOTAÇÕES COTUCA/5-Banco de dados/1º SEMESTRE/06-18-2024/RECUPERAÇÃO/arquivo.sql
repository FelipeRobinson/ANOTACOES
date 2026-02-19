/* REFAZENDO A PROVA */


-- 1)
SELECT DISTINCT ci.Nome
  FROM joinCIDADE ci
       INNER JOIN joinCLIENTE cl ON cl.idCidade = ci. codigo
       INNER JOIN joinESTADO es ON cl.UF = es.UF
 WHERE es.Nome = 'Espirito Santo'
/* 
   Ele relaciona a tabela CLIENTE (que não tem uma relação direta ao estado), usando o INNER
   JOIN, como se fosse uma analise de FK, até a tabela ESTADO, pois a tabela CIDADE não tem vinculo
   direto a tabela ESTADO.
*/

SELECT DISTINCT ci.Nome
  FROM joinCIDADE ci, joinCLIENTE cl, joinESTADO es
 WHERE es.Nome = 'Espirito Santo'
       AND es.UF = cl.UF
       AND cl.idCidade = ci.Codigo
/*
   Aqui a gente faz a mesma coisa lá de cima só que sem o INNER JOIN...
*/


-- 2)
SELECT cl.Nome
  FROM joinCLIENTE cl
       INNER JOIN joinCIDADE city ON cl.idCidade = city.Codigo
 WHERE city.Nome = 'Rio de Janeiro'
/*
   Executamos a mesma coisa, porém aqui a gente não precisa relacionar uma pra relacionar a
   outra, apenas relacionamos o CLIENTE com a CIDADE.
*/


-- 3)
SELECT city.Nome, count(*) as 'qtos pedidos'
  FROM joinCIDADE city
       INNER JOIN joinCLIENTE cl ON city.Codigo = cl.idCidade
       INNER JOIN joinPEDIDO pe ON cl.Codigo = pe.Cod_Cliente
GROUP BY city.Nome
ORDER BY city.Nome
/*
   Ordenamos a quantidade de pedidos feito em cada cidade da tabela...
*/


-- 4)
SELECT pr.Descricao, count(*) as 'Itens Pedidos'
  FROM joinPRODUTO pr
       INNER JOIN joinITEMPEDIDO itmPed ON itmPed.Cod_produto = pr.Codigo
GROUP BY pr.Descricao


-- 5)
SELECT DISTINCT ve.Nome as VENDEDOR
  FROM joinVENDEDOR ve
       INNER JOIN joinPEDIDO pe ON pe.Cod_Vendedor = ve.codigo
       INNER JOIN joinITEMPEDIDO ip ON ip.num_pedido = pe.Num_Pedido
       INNER JOIN joinPRODUTO pr ON pr.Codigo = ip.Cod_produto
 WHERE pr.Descricao = 'Lazanha'
-- OU --
SELECT DISTINCT ve.Nome
  FROM joinPRODUTO pr
       INNER JOIN joinITEMPEDIDO ip ON ip.Cod_produto = pr.Codigo
       INNER JOIN joinPEDIDO pe ON pe.Num_Pedido = ip.num_pedido
       INNER JOIN joinVENDEDOR ve ON ve.codigo = pe.Cod_Vendedor
 WHERE pr.Descricao = 'Lazanha'

/*
   Os dois códigos percorrem as três tabelas e procuram algo em comum para relacionar, em dois caminhos,
   os vendedores que venderam 'Lazanha'
*/

-- 6)
SELECT sum(ip.Quantidade * pr.Preco ) as SALÁRIO
  FROM joinITEMPEDIDO ip
       INNER JOIN joinPRODUTO pr ON ip.Cod_produto = pr.Codigo
/*
   A gente une a tabela que tem a quantidade de produtos vendidos a tabela dos preços dos produtos, e usando o 'sum()'
   a gente soma quantos produtos foram vendidos vezes o valor de cada produto.
*/


-- 7)
SELECT sum(ip.Quantidade * pr.Preco) as SALÁRIO
  FROM joinITEMPEDIDO ip
       INNER JOIN joinPRODUTO pr ON ip.Cod_produto = pr.Codigo
       INNER JOIN joinPEDIDO pe ON ip.num_pedido = pe.Num_Pedido
 WHERE pr.Descricao = 'Pizza'
      AND month(pe.Data) = 3
      AND year(pe.Data) = 2024 -- year(GEATDADE) --
/*
   Nesse último exercício, usamos um rascunho do exercício 6 e adicionamos a relação entre a tabela pedido, para pegar
   
*/