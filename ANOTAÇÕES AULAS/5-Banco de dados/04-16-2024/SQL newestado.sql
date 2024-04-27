create table ct_newestado (
	id char(2) not null,
	nome varchar(30)
)
-- Esse comando cria a table e os elementos das colunas --

SELECT *
FROM ct_newestado
-- Esse comando faz com que o 'prompt' nos mostre como está a tabela --

INSERT INTO ct_newestado (id,nome)
VALUES('SP','São Paulo')
-- 
INSERT INTO ct_newestado(id,nome) VALUES('SP','São Paulo')
INSERT INTO ct_newestado(id,nome) VALUES('MG','Minerinho')
-- Esse comando altera a 

UPDATE ct_newestado SET nome='Minas Gerais'
UPDATE ct_newestado SET nome='São Paulo'
	WHERE ID='SP'

DELETE FROM ct_newestado WHERE ID='SP'
-- Tinha duas linhas com SP, São paulo, ai deletei uma delas, porém o comando deleta tudo com as syntax --

INSERT INTO ct_newestado(id,nome) VALUES ('SP','São Paulo')
-- inseri uma nova linha com o id SP e o nome São Paulo

--------------------------------------------------------------------

-- CRIANDO UMA NOVA TABELA --
create table ct_autor (
	id int identity not null,
	nome varchar(30),

	constraint p_ct_autor PRIMARY KEY (id)
)

SELECT * FROM ct_autor

INSERT INTO ct_autor(nome)
	VALUES('Andréia')
INSERT INTO ct_autor(nome)
	VALUES('Felipe')
-- inserindo nomes e o prórpio BD cria um id, ele toma conta, por causa da PK/IDENTITY --

---------------------------------------------------------------------------------------------

create table ct_editora (
	id int not null,
	nome varchar(30),

	constraint p_ct_editora PRIMARY KEY (id)
)

SELECT * FROM ct_editora

INSERT INTO ct_editora(id,nome)
	VALUES('15','Andréia')
INSERT INTO ct_editora(id,nome)
	VALUES('16','Felipe')