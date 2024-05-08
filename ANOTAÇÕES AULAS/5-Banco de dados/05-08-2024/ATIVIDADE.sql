--============================================================ EXERCÍCIO 1 ============================================================================--
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

--============================================================ EXERCÍCIO 2 ============================================================================--
-- 1) Inserir uns valores na tabela ESTADO
INSERT INTO ct_ESTADO (Nome)
VALUES ('São Pedro'),
	   ('Minas Gerais'),
	   ('Rio de Janeiro'),
	   ('Espirito Santo'),
	   ('Acre'),
	   ('Alagoas'),
	   ('Amapá'),
	   ('Amazonas'),
	   ('Bahia'),
	   ('Ceará'),
	   ('Distrito Federal'),
	   ('Goiás'),
	   ('Maranhã'),
	   ('Mato Grosso'),
	   ('Mato Grosso do Sul'),
	   ('Paraná'),
	   ('Paraíba'),
	   ('Pará'),
	   ('Pernambuco'),
	   ('Piauí'),
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


-- 3)Insira as cidades relacionando os idEstado com o estado da tabela ESTADO
INSERT INTO ct_CIDADES (Nome,idEstado)
VALUES ('Campinas',1),
	   ('Valinhos',1),
	   ('Indaiatuba',1),
	   ('Belo Horizonte',2),
	   ('Niterói',3),
	   ('Petropolis',3),
	   ('Vitoria',4),
	   ('Vila Velha',4),
	   ('Recife',19),
	   ('Belém',18),
	   ('Curitiba',16),
	   ('Cuibá',14),
	   ('Aracajú',26),
	   ('Palmas',27)

SELECT * FROM ct_CIDADES
SELECT * FROM ct_ESTADO

-- 4) Selecione o nome da Cidade e o nome do Estado de todos os registro
SELECT ct_CIDADES.Nome as CIDADE, ct_ESTADO.Nome as ESTADO
FROM ct_CIDADES, ct_ESTADO
WHERE ct_CIDADES.idEstado = ct_ESTADO.id;


-- 5) Select all in table CIDADE
SELECT * FROM ct_CIDADES


-- 6) Select every camps with 'registro' in SÃO PEDRO
SELECT *
FROM
WHERE