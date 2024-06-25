-- 1. Todos os pedidos de cada cliente. --
SELECT c.Nome as CLIENTE, p.Num_Pedido as PEDIDO
  FROM joinCLIENTE c
       INNER JOIN joinPEDIDO p ON c.Codigo = p.Cod_Cliente

-- 2. Nomes dos clientes do estado 'MG' --
SELECT c.Nome as CLIENTE
  FROM joinCLIENTE c
 WHERE c.uf='MG'

-- 3. Todos os clientes da cidade de 'Campinas' --
SELECT c.Nome as CLIENTE
  FROM joinCLIENTE c
       INNER JOIN joinCIDADE city ON c.idCidade = city.Codigo
 WHERE city.Codigo = 'Campinas'

-- 4. Todos os clientes que compraram 'pão de queijo' --
SELECT c.Nome as CLIENTE
  FROM joinCLIENTE c
	   INNER JOIN 
	   INNER JOIN 
	   INNER JOIN joinPRODUTO prod ON prod.Codigo = 
 WHERE prod.Codigo = 'Pão de Queijo'