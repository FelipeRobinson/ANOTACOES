--============================================================ EXERC�CIO 1 ============================================================================--
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

alter table ct_JOGADOR
	add numero INT not null

alter table ct_TECNICO
	alter column Nome Varchar (40) Not null

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

alter table ct_CIDADES
	add idEstado INT not null
	
alter table ct_CIDADES
	add constraint fk_ct_CIDADES_ct_ESTADO FOREIGN KEY (idEstado) REFERENCES ct_ESTADO (id)

alter table ct_TIME
	drop constraint fk_ct_TIME_ct_ESTADO

alter table ct_TIME
	drop column Estado
	
alter table ct_TIME
	drop column Cidade

alter table ct_TIME
	add Cidade INT not null

alter table ct_TIME
	add constraint fk_ct_TIME_ct_CIDADES FOREIGN KEY (Cidade) REFERENCES ct_CIDADES

create table ct_CAMPEONATO (
	id INT IDENTITY not null,
	Nome VarChar(20) not null,
	DataInicio Char(40) not null,
	DataFim Char(2) not null,

	CONSTRAINT pk_ct_CAMPEONATO PRIMARY KEY	(id)
)

alter table ct_CAMPEONATO
	drop column DataInicio,
				DataFim

alter table ct_CAMPEONATO
	add DataInicio smalldatetime not null,
		DataFim smalldatetime not null

create table ct_CAMPEONATO_JOGADOR (
	idCampeonato INT not null,
	idJogador INT not null

	PRIMARY KEY (idCampeonato, idJogador)
	CONSTRAINT fk_ct_CAMPEONATO_JOGADOR_ct_CAMPEONATO FOREIGN KEY (idCampeonato) REFERENCES ct_CAMPEONATO (id),
	CONSTRAINT fk_ct_CAMPEONATO_JOGADOR_ct_JOGADOR FOREIGN KEY (idJogador) REFERENCES ct_JOGADOR (id)
)

create table ct_TIME_JOGADOR (
	idTime INT not null,
	idJogador INT not null

	PRIMARY KEY (idTime, idJogador),
	CONSTRAINT fk_ct_TIME_JOGADOR_ct_TIME FOREIGN KEY (idTime) REFERENCES ct_TIME (id),
	CONSTRAINT fk_ct_TIME_JOGADOR_ct_JOGADOR FOREIGN KEY (idJogador) REFERENCES ct_JOGADOR (id),
);

create table ct_CAMPEONATO_TIME (
	idCampeonato INT not null,
	idTime INT not null

	PRIMARY KEY (idCampeonato, idTime)
	CONSTRAINT fk_ct_CAMPEONATO_TIME_ct_CAMPEONATO FOREIGN KEY (idCampeonato) REFERENCES ct_CAMPEONATO (id),
	CONSTRAINT fk_ct_CAMPEONATO_TIME_ct_TIME FOREIGN KEY (idTime) REFERENCES ct_TIME (id),
);

alter table ct_TIME
	add idTecnico INT IDENTITY not null

SELECT * FROM ct_ESTADO

--============================================================ EXERC�CIO 2 ============================================================================--
-- 1) Inserir uns valores na tabela ESTADO
INSERT INTO ct_ESTADO (id,Nome)
VALUES ('SP','S�o Pedro'),
	   ('MG','Minas Gerais'),
	   ('RJ','Rio de Janeiro'),
	   ('ES','Espirito Santo'),
	   ('AC','Acre'),
	   ('AL','Alagoas'),
	   ('AP','Amap�'),
	   ('AM','Amazonas'),
	   ('BA','Bahia'),
	   ('CE','Cear�'),
	   ('DF','Distrito Federal'),
	   ('GO','Goi�s'),
	   ('Maranh�'),
	   ('Mato Grosso'),
	   ('Mato Grosso do Sul'),
	   ('Paran�'),
	   ('Para�ba'),
	   ('Par�'),
	   ('Pernambuco'),
	   ('Piau�'),
	   ('Rio Grande do Norte'),
	   ('Rio Grande do Sul'),
	   ('Rondonia'),
	   ('Roraima'),
	   ('Santa Catarina'),
	   ('Sergipe'),
	   ('Tocantins')

-- 2) Selecione todos os campos dos registros da tabela ESTADO

SELECT * 
FROM ct_ESTADO

-- 3)

INSERT INTO ct_CIDADES (Nome)
VALUES ('Campinas'),
	   ('Valinhos'),
	   ('Indaiatuba'),
	   ('Belo Horizonte'),
	   ('Niter�i'),
	   ('Petropolis'),
	   ('Vitoria'),
	   ('Vila Velha'),
	   ('Recife'),
	   ('Bel�m'),
	   ('Curitiba'),
	   ('Mato Grosso'),
	   ('Sergibe'),
	   ('Tocantins')