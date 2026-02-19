--================================================= PARTE 1 ======================================================--

-- 1 EXERCÍCIO --
CREATE TABLE ct_ESTADO (
    Id CHAR(2) NOT NULL,
    Nome VARCHAR(30) NOT NULL,
    CONSTRAINT pk_ct_ESTADO PRIMARY KEY (Id)
);
-- SELECT * FROM ct_ESTADO --

create table ct_CIDADE(
	Id INT identity not null,
	Nome varchar(30) not null,
	UF Char(2) not null,

	CONSTRAINT pk_ct_CIDADE PRIMARY KEY (Id),
	CONSTRAINT fk_ct_CIDADE_ct_ESTADO FOREIGN KEY (UF) REFERENCES ct_ESTADO (Id) 
);
-- SELECT * FROM ct_CIDADE --

create table ct_AUTOR(
	Id INT Identity not null,
	Nome VarChar(30) not null

	CONSTRAINT pk_ct_AUTOR PRIMARY KEY (Id)
);
-- SELECT * FROM ct_AUTOR --

create table ct_EDITORA (
	Id INT Identity not null,
	Nome VarChar(30) not null

	CONSTRAINT pk_ct_EDITORA PRIMARY KEY (Id)
);
-- SELECT * FROM ct_EDITORA --

create table ct_CLIENTE(
	Id INT Identity not null,
	Nome VarChar(30) not null,
	Endereco VarChar(50) not null,
	idCidade INT not null,
	idEstado Char(2) not null

	CONSTRAINT pk_ct_CLIENTE PRIMARY KEY (Id)
	CONSTRAINT fk_ct_CLIENTE_ct_CIDADE FOREIGN KEY (idCidade) REFERENCES ct_CIDADE,
	CONSTRAINT fk_ct_CLIENTE_ct_ESTADO FOREIGN KEY (idEstado) REFERENCES ct_ESTADO (Id)
);
-- SELECT * FROM ct_CLIENTE --

create table ct_LIVRO(
	NrTombo INT not null,
	Nome VarChar(30) not null,
	IdAutor INT not null,
	IdEditora INT not null

	CONSTRAINT pk_ct_LIVRO PRIMARY KEY (NrTombo)
	CONSTRAINT fk_ct_LIVRO_ct_AUTOR FOREIGN KEY (IdAutor) REFERENCES ct_AUTOR,
	CONSTRAINT fk_ct_LIVRO_ct_EDITORA FOREIGN KEY (IdEditora) REFERENCES ct_EDITORA
);
-- SELECT * FROM ct_LIVRO --

-- 2 EXERCÍCIO --
alter table ct_LIVRO
	 drop constraint fk_ct_LIVRO_ct_AUTOR,
	      column IdAutor
	-- SELECT * FROM ct_LIVRO --

-- 3 EXERCÍCIO --
alter table ct_CIDADE
	drop  constraint fk_ct_CIDADE_ct_ESTADO
alter table ct_CLIENTE
	drop  constraint fk_ct_CLIENTE_ct_ESTADO
alter table ct_ESTADO
	drop  constraint pk_ct_ESTADO,
	      column Id

alter table ct_ESTADO
	add Sigla CHAR(2),
		constraint pk_ct_ESTADO  PRIMARY KEY (Sigla)

alter table ct_CIDADE
	add constraint fk_ct_CIDADE_ct_ESTADO FOREIGN KEY (UF) REFERENCES ct_ESTADO (Sigla)
alter table ct_CLIENTE
	add constraint fk_ct_CLIENTE_ct_ESTADO FOREIGN KEY (idEstado) REFERENCES ct_ESTADO (Sigla)

-- 4 EXERCÍCIO --
create table ct_AutoresDoLivro(
	NrTombo INT not null,
	IdAutor INT not null

	CONSTRAINT fk_ct_AutoresDoLivro_ct_LIVRO FOREIGN KEY (NrTombo) REFERENCES ct_LIVRO (NrTombo),
	CONSTRAINT fk_ct_AutoresDoLivro_ct_AUTOR FOREIGN KEY (IdAutor) REFERENCES ct_AUTOR (Id)
);

-- 5 EXERCÍCIO --
alter table dbo.ct_LIVRO
	alter column Nome Varchar (40) Not null

-- 6 EXERCÍCIO --
alter table ct_CLIENTE
	add email varchar (40) not null

-- 7 EXERCÍCIO -- 
create table ct_LIVROSLOCADOS(
	NrTombo INT not null,
	IdCliente INT not null,
	DataLocacao DATETIME not null,
	DataDevolucaoPrevista DATETIME not null,
	DataDevolucaoReal DATETIME not null

	CONSTRAINT fk_ct_LIVROSLOCADOS_ct_LIVRO FOREIGN KEY (NrTombo) REFERENCES ct_LIVRO (NrTombo),
	CONSTRAINT fk_ct_LIVROSLOCADOS_ct_CLIENTE FOREIGN KEY (IdCliente) REFERENCES ct_CLIENTE (Id)
);

--================================================================================================================--
--================================================= PARTE 2 ======================================================--
--================================================================================================================--

-- 1 EXERCÍCIO --
INSERT INTO ct_ESTADO (Id,Nome) 
	VALUES ('SP','São Paulo'),
		   ('MG','Minhas Gerais'),
		   ('RJ','Rio de Jambeiro'),
		   ('ES','Espírito Santo');

INSERT INTO ct_CIDADE (Nome,UF) 
	VALUES ('Campinas','SP'),
		   ('Jundiaí','SP'),
		   ('Americanos','SP'),
		   ('Sumaré','SP'),
		   ('Rio de Janeiro','RJ'),
		   ('Niteroense','RJ'),
		   ('Vitória','ES'),
		   ('Cidade do Chocolate','ES'),
		   ('Belzonte','MG');

UPDATE ct_ESTADO 
	SET Id='Minas Gerais'
	WHERE Id='Minhas Gerais'

UPDATE ct_CIDADE
	SET Nome='Americanos'
	WHERE Nome='Americana'

UPDATE ct_CIDADE
	SET Nome='Niteroense'
	WHERE Nome='Niteroe'

UPDATE ct_CIDADE
	SET Nome='Cidade do Chocolate'
	WHERE Nome='Vila Velha'

UPDATE ct_CIDADE
	SET Nome='Belzonte'
	WHERE Nome='Belo Horizonte'

-- 2 EXERCÍCIO --
SELECT 
-- 3 EXERCÍCIO --
-- 4 EXERCÍCIO --
INSERT INTO ct_CLIENTE (Nome,Endereco,idCidade,idEstado)
	VALUES ('Felix Aureliano', 'Rua das Flores 124', 'Campinas', 'SP'),
		   ('Tâmara Aureliana', 'Rua 13 de Outubro', 'Campinas', 'SP'),
		   ('Duane Litus', 'Av dos Alecrins 43', 'Americana', 'SP'),
		   ('Salvio Almeida', 'Rua de Baixo 5124', 'Niterói', 'RJ'),
		   ('Austero Prado', 'Av Lindemberg 65', 'Belo Horizonte', 'MG'),
		   ('Falister Duarte', 'Rua Alves Lima 644', 'Belo Horizonte', 'MG')
-- 5 EXERCÍCIO --
SELECT Nome 
	FROM ct_ESTADO