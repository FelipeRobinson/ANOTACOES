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
	add chave INT IDENTITY not null,
		constraint pk_ct_TIME PRIMARY KEY (chave)

-- 6) Crie um campo estado na tabela CIDADE com uma FK a tabela ESTADO. Apague a referencia da tabela TIME na tabela ESTADO

-- 7) Altere o campo Cidade da tabela TIME para INT e o faça chave estrangeira da tabela CIDADE

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
	drop DataInicio,
		 DatFim

alter table ct_CAMPEONATO
	add DataInicio smalldatetime not null,
		DataFim smalldatetime not null

-- 10) Crie uma tabela com o nome de CAMPEONATO_JOGADOR
create table ct_CAMPEONATO_JOGADOR (
	idCampeonato INT IDENTITY not null,
	idJogador INT IDENTITY not null

	PRIMARY KEY (idCampeonato, idJogador),
	CONSTRAINT fk_ct_CAMPEONATO_JOGADOR_ct_CAMPEONATO FOREIGN KEY (idCampeonato) REFERENCES (id),
	CONSTRAINT fk_ct_CAMPEONATO_JOGADOR_ct_JOGADOR FOREIGN KEY (idJogador) REFERENCES (id),
);

-- 11) Exclua a tabela CAMPEONATO_JOGADOR
alter table ct_CAMPEONATO_JOGADOR
	drop constraint fk_ct_CAMPEONATO_JOGADOR_ct_CAMPEONATO,
					fk_ct_CAMPEONATO_JOGADOR_ct_JOGADOR
					pk_CAMPEONATO_JOGADOR

drop table ct_CAMPEONATO_JOGADOR

-- 12) Crie uma tabela com o nome TIME_JOGADOR
create table TIME_JOGADOR (
	idTime INT IDENTITY not null,
	idJogador INT IDENTITY not null

	PRIMARY KEY (idTime, idJogador),
	CONSTRAINT fk_ct_TIME_JOGADOR_ct_TIME FOREIGN KEY (idTime) REFERENCES (id),
	CONSTRAINT fk_ct_TIME_JOGADOR_ct_JOGADOR FOREIGN KEY (idJogador) REFERENCES (id),
);

-- 13) Crie uma tabela com o nome CAMPENATO_TIME
create table ct_CAMPEONATO_TIME (
	idCampeonato INT IDENTITY not null,
	idTime INT IDENTITY not null

	PRIMARY KEY (idCampeonato, idTime)
	CONSTRAINT fk_ct_CAMPEONATO_TIME_ct_CAMPEONATO FOREIGN KEY (idCampeonato) REFERENCES (id),
	CONSTRAINT fk_ct_CAMPEONATO_TIME_ct_TIME FOREIGN KEY (idTime) REFERENCES (id),
);

-- 14) (Não entendi se foi uma pergunta retórica kkkkkk) Apague o campo data da tabela TIME
alter table ct_TIME
	drop column Data

-- 15) Apague a tabela ESTADO

								-- POSSO APAGAR DIRETO 
								-- POIS NÃO TEM NEM UMA FOREING KEY  
drop table ct_ESTADO 


-- 16) Insira o campo idTecnico na tabela TIME
alter table ct_TIME
	add idTecnico INT IDENTITY not null,


-- 17) Apague a tabela CAMPEONATO
drop table ct_CAMPEONATO

-- 18) Apague tudo

drop table ct_TIME
drop table ct_CIDADE
drop table ct_JOGADOR
drop table ct_TECNICO
drop table ct_CAMPEONATO
drop table ct_CAMPEONATO_JOGADOR
drop table ct_TIME_JOGADOR
drop table ct_CAMPEONATO_TIME