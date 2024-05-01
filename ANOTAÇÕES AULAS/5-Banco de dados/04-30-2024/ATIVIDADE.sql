-- 1) Nessa tabela não é preciso ter uma ordem, pois só exige uma ordem quando temos Foreing Keys, e nessa tabela não temos nenhuma. --
-- 2) Crie as tabelas a seguir: --
create table ct_TIME (
	id INT IDENTITY not null,
	Nome VarChar(20) not null,
	Cidade Char(40) not null,
	Estado Char(2) not null,
	Data smalldatetime not null,

	CONSTRAINT pk_ct_TIME PRIMARY KEY (id)
)

create table ct_JOGADOR (
	id INT IDENTITY not null,
	Nome VarChar(20) not null,

	CONSTRAINT pk_ct_JOGADOR PRIMARY KEY (id)
)

create table ct_CIDADES (
	id INT IDENTITY not null,
	Nome VarChar(20) not null,

	CONSTRAINT pk_ct_CIDADE PRIMARY KEY (id)
)

create table ct_TECNICO (
	id INT IDENTITY not null,
	Nome VarChar(20) not null,

	CONSTRAINT pk_ct_TECNICO PRIMARY KEY (id)
)
-- 3) Adicionar o campo NUMERO (INT) na tabela JOGADOR --
alter table ct_JOGADOR
	add numero int not null

-- 4) Altere o campo 'nome' na tabela TECNICO para varchar(40) --
alter table ct_TECNICO
	alter column Nome Varchar (40) Not null

-- 5) Criar uma tabela com nome ESTADO (parecido com a tabela TECNICO), e apague o campo estado da tabela TIME, e inclua o campo chave da nova tabela criada --
create table ct_ESTADO (
	id INT IDENTITY not null,
	Nome VarChar(20) not null

	CONSTRAINT pk_ct_ESTADO PRIMARY KEY (id)
)

alter table ct_TIME
	drop column estado

alter table ct_TIME
	add 