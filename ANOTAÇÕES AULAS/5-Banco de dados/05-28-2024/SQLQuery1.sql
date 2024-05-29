create table dbo.ct_JOGOS (
	Id      int identity not null,
	Data    smalldatetime not null,
	timeA   int not null,
	timeB   int not null,
	idCidades int not null,
	PontosA int not null,
	PontosB int not null
	
	CONSTRAINT pk_ct_JOGOS PRIMARY KEY (Id),
	CONSTRAINT fk_ct_JOGOS_ct_TIMEA FOREIGN KEY (timeA) REFERENCES ct_TIME(id),
	CONSTRAINT fk_ct_JOGOS_ct_TIMEB FOREIGN KEY (timeB) REFERENCES ct_TIME(id),
	CONSTRAINT fk_ct_JOGOS_ct_CIDADES FOREIGN KEY (idCidades) REFERENCES ct_CIDADES(Id)
)

SELECT * FROM ct_TIME

SELECT * FROM ct_JOGOS

INSERT INTO ct_JOGOS (Data, timeA, timeB, idCidades, PontosA, PontosB)
VALUES (getdate()-1, 1, 2, 1, 2, 1),
	   (getdate()-5, 2, 4, 3, 3, 0),
	   (getdate()+2, 2, 3, 4, 0, 0)

SELECT Data, ta.Nome, PontosA, tb.Nome, timeB, c.Nome, PontosB
FROM ct_JOGOS j
	INNER JOIN ct_TIME ta   on j.timeA = ta.id
	INNER JOIN ct_TIME tb   on j.timeB = tb.id
	INNER JOIN ct_CIDADES c on j.idCidades = c.id
-- querendo saber os jogos desse mês --
WHERE month(Data) = 5

-- ou --

SELECT Data, count(*) as 'Jogo no dia'
FROM ct_JOGOS j
GROUP BY Data
HAVING count(*) > 1
-- = --
SELECT Data, count(*) as 'Jogo no dia'
FROM ct_JOGOS j
GROUP BY year(Data), month(Data), day(Data)
HAVING count(*) > 1
-- querendo saber os jogos do determinado dia

-- OU PIOR AINDA (saber os jogos do dia)--

SELECT count(*)
FROM ct_JOGOS j
WHERE day(Data)   = 27 
  and month(Data) = 5 
  and year(Data)  = 2024