-- PARA VISUALIZAR A TABELA -- 
   SELECT * FROM ct_CIDADE
   SELECT * FROM ct_ESTADO


-- SELECT QUE PEGA INFORMAÇÃO DE DUAS TABELAS (COMBINAÇÃO DE ELEMENTOS, QUANDO NÃO USAMOS WHERE) --
SELECT *
FROM ct_ESTADO,ct_CIDADE;


-- SELECT PARA PEGAR INFORMAÇÕES DE DUAS/OU MAIS TABELAS--
SELECT ct_ESTADO.nome, ct_CIDADE.nome
FROM ct_ESTADO,ct_CIDADE;
WHERE ct_ESTADO.uf = ct_ESTADO.sigla
  --referenciar os campos das tabelas ('dbo.table' + .'column')-- 

-- SELECT PARA PEGAR INFORMAÇÕES DE DUAS/OU MAIS TABELAS --
  --o 'as' dá um nome pra coluna daquela tabela mencionada--
SELECT ct_ESTADO.nome as Nome do Estado, ct_CIDADE.nome as Nome da Cidade
FROM ct_ESTADO,ct_CIDADE;
WHERE ct_ESTADO.uf = ct_ESTADO.sigla


-- SELECT 
SELECT ct_CIDADE.