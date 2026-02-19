--============================================================ PARTE 1 ============================================================================--
create table ct_TIME (
	id INT,
	Nome VarChar(20),
	Cidade Char(40),
	Estado Char(2),
	Data smalldatetime,

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

SELECT * 
FROM ct_TIME

--============================================================ PARTE 2 ============================================================================--
-- 1)
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


-- 2)
SELECT * 
FROM ct_ESTADO


-- 3)
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

SELECT * 
FROM ct_CIDADES

SELECT * 
FROM ct_ESTADO

-- 4)
SELECT ct_CIDADES.Nome as CIDADE, ct_ESTADO.Nome as ESTADO
FROM ct_CIDADES, ct_ESTADO
WHERE ct_CIDADES.idEstado = ct_ESTADO.id;


-- 5)
SELECT * FROM ct_CIDADES


-- 6)
SELECT ct_CIDADES.Nome as CIDADE
FROM ct_CIDADES
INNER JOIN ct_ESTADO on ct_ESTADO.id = ct_CIDADES.idEstado
WHERE ct_ESTADO.Nome = 'São Pedro' 


-- 7) 
UPDATE ct_ESTADO
SET Nome = 'São Paulo'
WHERE Nome = 'São Pedro'


-- 8) 
SELECT ct_CIDADES.Nome as CIDADE, ct_ESTADO.Nome as ESTADO
FROM ct_CIDADES, ct_ESTADO
WHERE ct_CIDADES.idEstado = ct_ESTADO.id;


-- 9)  
DELETE
FROM ct_CIDADES
WHERE Nome = 'Belém'

DELETE
FROM ct_ESTADO
WHERE Nome = 'Pará'


-- 10)
DELETE
FROM ct_CIDADES
WHERE Nome IN ('Niterói','Petrópolis','Petropolis')

SELECT * FROM ct_CIDADES


-- 11)
UPDATE ct_ESTADO
SET Nome = 'Estados do Brasil'


-- 12)
SELECT ct_CIDADES.Nome as CIDADE, ct_ESTADO.Nome as ESTADO
FROM ct_CIDADES, ct_ESTADO
WHERE ct_CIDADES.idEstado = ct_ESTADO.id;


-- 13)
INSERT INTO ct_TECNICO (Nome)
VALUES ('Luis Zubeldía'),
	   ('Abel Ferreira'),
       ('António Oliveira'),
 	   ('Tite'),
	   ('Ramónn Diaz'),
	   ('Artur Jorge')
 

-- 14)
INSERT INTO ct_TIME (id, Nome,Cidade)
VALUES (1, 'São Paulo',26),
	   (2, 'Palneira',26),
	   (3, 'Corinthians',26),
	   (4, 'Botafogo',14),
	   (5, 'Vasco',14)
	  
	  SELECT * FROM ct_TIME
	  SELECT * FROM ct_JOGADOR

-- 15)
INSERT INTO ct_TIME (idTecnico)
VALUES (1),
	   (2),
	   (3),
	   (4),
	   (5),
	   (6)


-- 16)
INSERT INTO ct_JOGADOR (Nome)
VALUES ('Charles'),
	   ('Miguel'),
	   ('Luis'),
	   ('João'),
	   ('Raiva'),
	   ('Zangado'),
	   ('Zaralhado'),
	   ('Zoeiro'),
	   ('Jorge'),
	   ('Julio'),
	   ('Ygor'),
	   ('Richarlisson'),
	   ('Ed Sheeran'),
	   ('Rafael'),
	   ('Alysson'),
	   ('Vitor'),
	   ('Marcos'),
	   ('Sérgio'),
	   ('Rigoroso'),
	   ('Maligno'),
	   ('Guilherme'),
	   ('Gabriel'),
	   ('Felipe'),
	   ('Thiago'),
	   ('Ricardo'),
	   ('Patrício'),
	   ('Paulo'),
	   ('Aloysio')


-- 17) 
INSERT INTO ct_time_jogador(IdTime,IdJogador)
VALUES  (1,1),
		(1,2),
		(1,3),
		(1,4),
		(1,5),
		(1,6),
		(2,7),
		(2,8),
		(2,9),
		(2,10),
		(2,11),
		(2,12),
		(3,13),
		(3,14),
		(3,15),
		(3,16),
		(3,17),
		(3,18),
		(4,19),
		(4,20),
		(4,21),
		(4,22),
		(4,23),
		(4,24),
		(5,25),
		(5,26),
		(5,27),
		(5,28),
		(5,29),
		(5,30)


-- 18)
INSERT INTO ct_CAMPEONATO (Nome,DataInicio,DataFim)
VALUES ('Brasileiro 2024',10/05/2024,30/08/2024)


-- 19) 
INSERT INTO ct_CAMPEONATO_TIME(IdCampeonato,IdTime)
VALUES (1,2),
	   (1,3),
	   (1,1),
	   (2,1),
	   (2,4),
	   (2,5)


-- 20) 
SELECT ct_JOGADOR.Nome as 'jogadores do São Paulo' 
FROM ct_JOGADOR 
INNER JOIN ct_TIME_JOGADOR on ct_JOGADOR.Id = ct_TIME_JOGADOR.idJogador
WHERE idTime = (
	SELECT Id 
	FROM ct_TIME
	WHERE Nome = 'São Paulo'
)


-- 21)
SELECT ct_JOGADOR.Nome as 'Jogadores do Palneiras' 
FROM ct_JOGADOR 
INNER JOIN ct_TIME_JOGADOR on ct_JOGADOR.Id = ct_TIME_JOGADOR.idJogador
WHERE idTime = (
	SELECT Id 
	FROM ct_TIME 
	WHERE Nome = 'Palneiras'
)


-- 22)
SELECT ct_JOGADOR.Nome as 'jogadores do Botafogo' 
from ct_JOGADOR
INNER JOIN ct_TIME_JOGADOR on ct_JOGADOR.Id = ct_TIME_JOGADOR.idJogador
WHERE idTime = (
	SELECT Id 
	FROM ct_TIME 
	WHERE Nome = 'Botafogo'
)


-- 23) 
SELECT MIN (numero) as 'numero da camisa do jogador do time do Artur Jorge'
FROM ct_JOGADOR 
INNER JOIN ct_TIME_JOGADOR on ct_JOGADOR.Id = ct_TIME_JOGADOR.idJogador 
WHERE idTime = (
	select ct_TIME.Id 
	from ct_TIME 
	INNER JOIN ct_TECNICO on ct_TIME.idTecnico = ct_TECNICO.Id 
	WHERE ct_TECNICO.Nome = 'Artur Jorge'
)


-- 24)
SELECT ct_TIME.Nome as Nome_Time
FROM ct_TIME
INNER JOIN ct_CAMPEONATO_TIME on ct_TIME.Id = ct_CAMPEONATO_TIME.idTime
INNER JOIN ct_CAMPEONATO on ct_CAMPEONATO.Id = ct_CAMPEONATO_TIME.idCampeonato
WHERE ct_CAMPEONATO.Nome = 'Brasileiro 2024';


-- 25)
SELECT ct_JOGADOR.Nome as Nome_Jogador, ct_TIME.Nome as Nome_Time
FROM ct_JOGADOR
INNER JOIN ct_TIME_JOGADOR on ct_JOGADOR.Id = ct_TIME_JOGADOR.idJogador
INNER JOIN ct_TIME on ct_TIME.Id = ct_TIME_JOGADOR.idTime
INNER JOIN ct_CAMPEONATO_TIME on ct_TIME.Id = ct_CAMPEONATO_TIME.idTime
INNER JOIN ct_CAMPEONATO on ct_CAMPEONATO.Id = ct_CAMPEONATO_TIME.idCampeonato
WHERE ct_CAMPEONATO.Nome = 'Camp. Paulista 2024';


-- 26)
SELECT COUNT(*) as Quantidade_Jogadores
FROM ct_JOGADOR
INNER JOIN ct_TIME_JOGADOR on ct_JOGADOR.Id = ct_TIME_JOGADOR.idJogador
INNER JOIN ct_TIME on ct_TIME.Id = ct_TIME_JOGADOR.idTime
INNER JOIN ct_CIDADES on ct_TIME.Cidade = ct_CIDADES.Id
WHERE ct_CIDADES.Nome = 'São Paulo';
