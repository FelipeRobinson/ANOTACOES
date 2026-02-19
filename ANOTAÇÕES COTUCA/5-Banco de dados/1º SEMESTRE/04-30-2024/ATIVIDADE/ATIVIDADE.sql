-- 1) Nessa tabela não é preciso ter uma ordem, pois só exige uma ordem quando temos Foreing Keys, e nessa tabela não temos nenhuma.
-- 2) Crie as tabelas a seguir:
create table ct_TIME (
	id INT not null,
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
-- 3) Adicionar o campo NUMERO (INT) na tabela JOGADOR 
alter table ct_JOGADOR
	add numero INT not null

-- 4) Altere o campo 'nome' na tabela TECNICO para varchar(40)
alter table ct_TECNICO
	alter column Nome Varchar (40) Not null 

-- 5) Criar uma tabela com nome ESTADO (parecido com a tabela TECNICO), e apague o campo estado da tabela TIME, e inclua o campo chave da nova tabela criada
create table ct_ESTADO (
	id INT IDENTITY not null,
	Nome VarChar(20) not null

	CONSTRAINT pk_ct_ESTADO PRIMARY KEY (id)
)

alter table ct_TIME
	drop column Estado

alter table ct_TIME
	add Estado INT not null

alter table ct_TIME
	add CONSTRAINT fk_ct_TIME_ct_ESTADO FOREIGN KEY (Estado) REFERENCES ct_ESTADO(id)

-- 6) Crie um campo idEstado na tabela CIDADE com uma FK a tabela ESTADO. Apague a referencia da tabela TIME na tabela ESTADO
alter table ct_CIDADES
	add idEstado INT not null,
	    constraint fk_ct_CIDADES_ct_ESTADO FOREIGN KEY (idEstado) REFERENCES ct_ESTADO (id)

alter table ct_TIME
	drop constraint fk_ct_TIME_ct_ESTADO

alter table ct_TIME
	drop column Estado
	
-- 7) Altere o campo Cidade da tabela TIME para INT e o faça chave estrangeira da tabela CIDADE
alter table ct_TIME
	drop column Cidade

alter table ct_TIME
	add Cidade INT not null
	    constraint fk_ct_TIME_ct_CIDADES FOREIGN KEY (Cidade) REFERENCES ct_CIDADES


-- 8) Crie uma tabela com o nome de CAMPEONATO
create table ct_CAMPEONATO (
	id INT IDENTITY not null,
	Nome VarChar(20) not null,
	DataInicio Char(40) not null,
	DataFim Char(2) not null,

	CONSTRAINT pk_ct_CAMPEONATO PRIMARY KEY	(id)
)

-- 9) Altere o campo DataInicio e DataFim da tabela CAMPEONATO para smalldatetime
alter table ct_CAMPEONATO
	drop column DataInicio,
				DataFim

alter table ct_CAMPEONATO
	add DataInicio smalldatetime not null,
		DataFim smalldatetime

-- 10) Crie uma tabela com o nome de CAMPEONATO_JOGADOR
create table ct_CAMPEONATO_JOGADOR (
	idCampeonato INT not null,
	idJogador INT not null

	PRIMARY KEY (idCampeonato, idJogador)
	CONSTRAINT fk_ct_CAMPEONATO_JOGADOR_ct_CAMPEONATO FOREIGN KEY (idCampeonato) REFERENCES ct_CAMPEONATO (id),
	CONSTRAINT fk_ct_CAMPEONATO_JOGADOR_ct_JOGADOR FOREIGN KEY (idJogador) REFERENCES ct_JOGADOR (id)
)

-- 11) Exclua a tabela CAMPEONATO_JOGADOR
alter table ct_CAMPEONATO_JOGADOR
	drop constraint fk_ct_CAMPEONATO_JOGADOR_ct_CAMPEONATO,
					fk_ct_CAMPEONATO_JOGADOR_ct_JOGADOR

drop table ct_CAMPEONATO_JOGADOR

-- 12) Crie uma tabela com o nome TIME_JOGADOR
create table ct_TIME_JOGADOR (
	idTime INT not null,
	idJogador INT not null

	PRIMARY KEY (idTime, idJogador),
	CONSTRAINT fk_ct_TIME_JOGADOR_ct_TIME FOREIGN KEY (idTime) REFERENCES ct_TIME (id),
	CONSTRAINT fk_ct_TIME_JOGADOR_ct_JOGADOR FOREIGN KEY (idJogador) REFERENCES ct_JOGADOR (id),
);

-- 13) Crie uma tabela com o nome CAMPENATO_TIME
create table ct_CAMPEONATO_TIME (
	idCampeonato INT not null,
	idTime INT not null

	PRIMARY KEY (idCampeonato, idTime)
	CONSTRAINT fk_ct_CAMPEONATO_TIME_ct_CAMPEONATO FOREIGN KEY (idCampeonato) REFERENCES ct_CAMPEONATO (id),
	CONSTRAINT fk_ct_CAMPEONATO_TIME_ct_TIME FOREIGN KEY (idTime) REFERENCES ct_TIME (id),
);

-- 14) (Não entendi se foi uma pergunta retórica kkkkkk) Apague o campo data da tabela TIME
alter table ct_TIME
	drop column Data

-- 15) Apague a tabela ESTADO
alter table ct_CIDADES
	drop CONSTRAINT fk_ct_CIDADES_ct_ESTADO

drop table ct_ESTADO			

-- 16) Insira o campo idTecnico na tabela TIME
alter table ct_TIME
	add idTecnico INT IDENTITY not null

-- 17) Apague a tabela CAMPEONATO
alter table ct_CAMPEONATO_TIME
	drop CONSTRAINT fk_ct_CAMPEONATO_TIME_ct_CAMPEONATO

drop table ct_CAMPEONATO

-- 18) Apague tudo
alter table ct_TIME
	drop constraint fk_ct_TIME_ct_CIDADES

alter table ct_TIME_JOGADOR
	drop constraint fk_ct_TIME_JOGADOR_ct_JOGADOR


drop table ct_CAMPEONATO_TIME

drop table ct_CIDADES

drop table ct_JOGADOR

drop table ct_TECNICO

drop table ct_TIME_JOGADOR

drop table ct_TIME