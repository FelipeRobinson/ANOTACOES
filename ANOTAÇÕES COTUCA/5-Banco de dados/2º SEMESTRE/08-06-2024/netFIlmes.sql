/***********************************************
    Banco de Dados :: NetFilmes
    Desenvolvimento de Sistemas Noturno 2024
***********************************************/

-- Criação da Tabela de Ator
CREATE TABLE netFilmes_Ator(
    id        int identity(1,1) not null,
    nome      varchar(40) not null

    CONSTRAINT pk_netFilmes_Ator PRIMARY KEY (id)
)

-- Criação da Tabela de Diretor
CREATE TABLE netFilmes_Diretor(
    id        int identity(1,1) not null,
    nome      varchar(40) not null

    CONSTRAINT pk_netFilmes_Diretor PRIMARY KEY (id)
)

-- Crialção da Tabela de Gênero
CREATE TABLE netFilmes_Genero(
    id         int identity(1,1)   not null,
	descricao  varchar(50)    not null

	CONSTRAINT pk_netFilmes_Genero PRIMARY KEY (id)
)

-- Criação da Tabela de Filme
CREATE TABLE netFilmes_Filme(
    id        int identity(1,1) not null,
    nome      varchar(40) not null,
    idGenero  int         not null 

    CONSTRAINT pk_netFilmes_Filme PRIMARY KEY (id)
    CONSTRAINT fk_netFilmes_Filme_Genero FOREIGN KEY (idGenero) REFERENCES netFilmes_Genero (id)
)

-- Criação da Tabela de RELACIONAMENTO AtoresDoFilme
CREATE TABLE netFilmes_AtoresDoFilme(
    idAtor   int not null,
	idFilme  int not null

	CONSTRAINT pk_netFilmes_AtoresDoFilme PRIMARY KEY (idAtor,idFilme),
	CONSTRAINT fk_netFilmes_AFilme_Ator FOREIGN KEY (idAtor) REFERENCES netFilmes_Ator (id),
    CONSTRAINT fk_netFilmes_AFilme_Filme FOREIGN KEY (idFilme) REFERENCES netFilmes_Filme (id)
)

-- Criação da Tabela de RELACIONAMENTO DiretoresDoFilme
CREATE TABLE netFilmes_DiretoresDoFilme(
    idDiretor   int not null,
	idFilme  int not null

	CONSTRAINT pk_netFilmes_DiretoresDoFilme PRIMARY KEY (idDiretor,idFilme),
    CONSTRAINT fk_netFilmes_DFilme_Ator FOREIGN KEY (idDiretor) REFERENCES netFilmes_Diretor (id),
	CONSTRAINT fk_netFilmes_DFilme_Filme FOREIGN KEY (idFilme) REFERENCES netFilmes_Filme (id)
)

CREATE TABLE netFilmes_Cliente(
    id        int identity(1,1) not null,
    nome      varchar(40) not null

    CONSTRAINT pk_netFilmes_Cliente PRIMARY KEY (id)
)

CREATE TABLE netFilmes_ClienteFilme(
    idCliente int not null,
    idFilme int not null,
    data smalldatetime not null,

    CONSTRAINT pk_netFilmes_ClienteFilme PRIMARY KEY (idCliente, idFilme, data), 
	CONSTRAINT fk_netFilmes_CFilme_Cliente FOREIGN KEY (idCliente) REFERENCES netFilmes_Cliente (id),
	CONSTRAINT fk_netFilmes_CFilme_Filme FOREIGN KEY (idFilme) REFERENCES netFilmes_Filme (id)
)

/******************************************************************************************************
CREATE TABLE netFilmes_ClienteFilme(   
    idCliente int not null, 
    idFilme int not null, 
    data smalldatetime not null,  
    
    CONSTRAINT pk_netFilmes_ClienteFilme PRIMARY KEY (idCliente, idFilme, data) 
)
******************************************************************************************************/



/*************************************** 
   Dados para as tabela de BASE
***************************************/

INSERT INTO netFilmes_Ator (nome)
VALUES ('Amy Poehler'),         -- Divertida Mente 2
       ('Cillian Murphy'),      -- Oppenheimer
       ('Emily Blunt'),         -- Um Lugar Silencioso 3
       ('Ansel Elgort'),        -- Amor, Sublime Amor
       ('Tom Cruise'),          -- Missão: Impossível 7
       ('Patrick Wilson'),      -- Invocação do Mal 3
       ('Timothée Chalamet'),   -- Duna
       ('Tristan Harris'),      -- O Dilema das Redes
       ('Emma Stone'),          -- La La Land
       ('Daniel Radcliffe'),    -- Harry Potter e a Pedra Filosofal
       ('Bradley Cooper'),      -- Se Beber, Não Case!
       ('Sally Hawkins'),       -- A Forma da Água
       ('Kristen Connolly'),    -- O Segredo da Cabana
       ('Ryan Gosling'),        -- Diário de uma Paixão
       ('Vin Diesel'),          -- Velozes e Furiosos 9
       ('Taissa Farmiga'),      -- A Freira
       ('Daisy Ridley'),        -- Star Wars: O Despertar da Força
       ('Tilikum'),             -- Blackfish (documentário)
       ('Hugh Jackman'),        -- Os Miseráveis
       ('Elijah Wood'),         -- O Senhor dos Anéis: A Sociedade do Anel
       ('Antonio Calloni'),     -- Polícia Federal: A Lei é para Todos
       ('Roman Griffin Davis'), -- Jojo Rabbit
       ('Song Kang-ho'),        -- Parasita
       ('Daniel Kaluuya'),      -- Corra!
       ('Leonardo DiCaprio'),   -- Titanic
       ('Keanu Reeves'),        -- John Wick 4
       ('Vera Farmiga'),        -- Annabelle 3
       ('Ryan Gosling'),        -- Blade Runner 2049
       ('David Attenborough'),  -- Planeta Terra II (documentário)
       ('Hugh Jackman'),        -- Os Miseráveis (repetido)
       ('Emma Watson'),         -- A Bela e a Fera
       ('Alexandre Rodrigues'), -- Cidade de Deus
       ('Mark Wahlberg'),       -- Ted 2
       ('Viola Davis'),         -- Histórias Cruzadas
       ('Kevin Costner'),       -- O Mistério da Libélula
       ('Keira Knightley'),     -- Orgulho e Preconceito
       ('Tom Holland'),         -- Homem-Aranha: Sem Volta para Casa
       ('Bill Skarsgård'),      -- It: A Coisa
       ('Matthew McConaughey'), -- Interestelar
       ('Steven Avery'),        -- Making a Murderer (documentário)
       ('Zac Efron'),           -- O Rei do Show
       ('Mia Wasikowska'),      -- Alice no País das Maravilhas
       ('Wagner Moura'),        -- Tropa de Elite
       ('Amanda Seyfried'),     -- Mamma Mia! Lá Vamos Nós de Novo
       ('George MacKay'),       -- 1917
       ('James McAvoy'),        -- Fragmentado
       ('Shailene Woodley'),    -- A Culpa é das Estrelas
       ('Robert Downey Jr.'),   -- Vingadores: Ultimato
       ('Will Smith'), ('Leonardo DiCaprio'),('Scarlett Johansson'),
       ('Chris Hemsworth'),('Robert Downey Jr.'),('Jennifer Lawrence'),
       ('Tom Holland'),('Gal Gadot'),('Chris Evans'),
       ('Zendaya'),('Dwayne Johnson'),('Margot Robbie'),
       ('Ryan Reynolds'),('Emma Stone'),('Chris Pratt'),
       ('Natalie Portman'),('Benedict Cumberbatch'),('Millie Bobby Brown'),
       ('Jason Momoa'),('Brie Larson'),('Tom Hiddleston'),
       ('Florence Pugh'),('Michael B. Jordan'),('Ana de Armas'),
       ('Keanu Reeves'),('Elizabeth Olsen'),('Tessa Thompson'),
       ('Daniel Craig'),('Paul Rudd')

INSERT INTO netFilmes_Diretor (nome)
VALUES ('Steven Spielberg'), ('Christopher Nolan'), ('Quentin Tarantino'),('Martin Scorsese'),
       ('James Cameron'),('Denis Villeneuve'),('Taika Waititi'),('Patty Jenkins'),
       ('Ryan Coogler'),('David Fincher');

INSERT INTO netFilmes_Genero (descricao)
VALUES ('Comédia'), ('Drama'), ('Suspense'), 
       ('Romance'), ('Ação'), ('Terror'),
       ('Ficção'),('Documentário'),('Musical'), 
       ('Fantasia'), ('Policial')

INSERT INTO netFilmes_Cliente (nome)
VALUES ('Ana Silva'),('Bruno Oliveira'),('Carlos Souza'),('Daniela Ferreira'),
       ('Eduardo Pereira'),('Fernanda Costa'),('Gustavo Alves'),('Helena Lima'),
       ('Igor Rocha'),('Julia Martins'),('Karen Araújo'),('Leonardo Ribeiro'),
       ('Mariana Mendes'),('Nicolas Carvalho'),('Olivia Castro'),('Paulo Nunes'),
       ('Renata Santos'),('Sérgio Rodrigues'),('Tatiana Almeida'),('Vinícius Barros')
       
/**************************************************** 
   Dados para as tabela de BASE com relacionamento 1 para 1
*/
INSERT INTO netFilmes_Filme (nome, idGenero)
VALUES ('Divertida Mente 2', 1),    -- Comédia
       ('Oppenheimer', 2),          -- Drama
       ('Um Lugar Silencioso 3', 3),-- Suspense
       ('Amor, Sublime Amor', 4),   -- Romance
       ('Missão: Impossível 7', 5), -- Ação
       ('Invocação do Mal 3', 6),   -- Terror
       ('Duna', 7),                 -- Ficção
       ('O Dilema das Redes', 8),   -- Documentário
       ('La La Land', 9),           -- Musical
       ('Harry Potter e a Pedra Filosofal', 10), -- Fantasia
       ('Se Beber, Não Case!', 1),  -- Comédia
       ('A Forma da Água', 2),      -- Drama
       ('O Segredo da Cabana', 3),  -- Suspense
       ('Diário de uma Paixão', 4), -- Romance
       ('Velozes e Furiosos 9', 5), -- Ação
       ('A Freira', 6),             -- Terror
       ('Star Wars: O Despertar da Força', 7), -- Ficção
       ('Blackfish', 8),            -- Documentário
       ('Os Miseráveis', 9),        -- Musical
       ('O Senhor dos Anéis: A Sociedade do Anel', 10), -- Fantasia
       ('Polícia Federal: A Lei é para Todos', 11), -- Policial
       ('Jojo Rabbit', 1),          -- Comédia
       ('Parasita', 2),             -- Drama
       ('Corra!', 3),               -- Suspense
       ('Titanic', 4),              -- Romance
       ('John Wick 4', 5),          -- Ação
       ('Annabelle 3', 6),          -- Terror
       ('Blade Runner 2049', 7),    -- Ficção
       ('Planeta Terra II', 8),     -- Documentário
       ('Os Miseráveis', 9),        -- Musical
       ('A Bela e a Fera', 10),     -- Fantasia
       ('Cidade de Deus', 11),      -- Policial
       ('Ted 2', 1),                -- Comédia
       ('Histórias Cruzadas', 2),   -- Drama
       ('O Mistério da Libélula', 3), -- Suspense
       ('Orgulho e Preconceito', 4), -- Romance
       ('Homem-Aranha: Sem Volta para Casa', 5), -- Ação
       ('It: A Coisa', 6),          -- Terror
       ('Interestelar', 7),         -- Ficção
       ('Making a Murderer', 8),    -- Documentário
       ('O Rei do Show', 9),        -- Musical
       ('Alice no País das Maravilhas', 10), -- Fantasia
       ('Tropa de Elite', 11),      -- Policial
       ('Mamma Mia! Lá Vamos Nós de Novo', 1), -- Comédia
       ('1917', 2),                 -- Drama
       ('Fragmentado', 3),          -- Suspense
       ('A Culpa é das Estrelas', 4), -- Romance
       ('Vingadores: Ultimato', 5) -- Ação


/*******************************************************************
   Dados para as tabela de relacionamento N para N ou 1 para N
*******************************************************************/

SELECT * from netFilmes_Ator
SELECT * from netFilmes_Filme

INSERT INTO netFilmes_AtoresDoFilme (idAtor, idFilme)
VALUES (1, 1),   (2, 2),   (3, 3),  (4, 4),  (5, 5),  (6, 6),   (7, 7),   (8, 8),   
(9, 9),   (10, 10),(11, 11), (12, 12), (13, 13), (14, 14), (15, 15), (16, 16), 
(17, 17), (18, 18), (19, 19), (20, 20), (21, 21), (22, 22), (23, 23), (24, 24), 
(25, 25), (26, 26), (27, 27), (28, 28), (29, 29), (30, 30), (31, 31),(32, 32), 
(33, 33), (34, 34), (35, 35), (36, 36), (37, 37), (38, 38), (39, 39), (40, 40), 
(41, 41), (42, 42), (43, 43), (44, 44), (45, 45), (46, 46), (47, 47), (48, 48)


SELECT * from netFilmes_Diretor
SELECT * from netFilmes_Filme
INSERT INTO netFilmes_DiretoresDoFilme (idDiretor, idFilme)
VALUES (1, 1),  (2, 2),  (3, 3),  (4, 4),  (5, 5),  (6, 6),  (7, 7),  (8, 8),  (9, 9),  (10, 10), 
       (1, 11), (2, 12), (3, 13), (4, 14), (5, 15), (6, 16), (7, 17), (8, 18), (9, 19), (10, 20), 
       (1, 21), (2, 22), (3, 23), (4, 24), (5, 25), (6, 26), (7, 27), (8, 28), (9, 29), (10, 30), 
       (1, 31), (2, 32), (3, 33), (4, 34), (5, 35), (6, 36), (7, 37), (8, 38), (9, 39), (10, 40), 
       (1, 41), (2, 42), (3, 43), (4, 44), (5, 45), (6, 46), (7, 47), (8, 48)  


INSERT INTO netFilmes_ClienteFilme(idCliente, idFilme, data) 
VALUES  (1, 1, 01/10/2024), (1, 5, 02/15/2024),
        (2, 2, 03/20/2024),(2, 6, 04/25/2024),(2, 8, 05/30/2024),
        (3, 3, 01/15/2024),(3, 7, 02/18/2024),(3, 10, 03/22/2024),
        (4, 4, 04/05/2024),(4, 11, 05/10/2024),(4, 14, 06/15/2024),
        (5, 12, 01/25/2024),(5, 13, 02/28/2024),(5, 1, 23/10/2024),(5, 7, 05/25/2024),(5, 20, 06/28/2024),
        (6, 15, 03/10/2024),(6, 18, 04/20/2024),(6, 20, 05/25/2024),
        (7, 17, 02/12/2024),(7, 19, 03/18/2024),(7, 22, 04/22/2024),
        (8, 23, 01/30/2024),
        (9, 25, 03/15/2024),(9, 26, 04/10/2024), (9, 27, 05/05/2024),(9, 13, 02/15/2024),
        (10, 28, 01/20/2024),(10, 29, 02/25/2024), (10, 30, 03/30/2024);


/*************************************
    PREPARANDO OS SELECTS DE
          TUUUUDOOOOO
*************************************/

SELECT C.nome, count(CeF.data)
  FROM netFilmes_ClienteFilme CeF
       JOIN netFilmes_Cliente C ON C.id = CeF.idCliente
GROUP BY C.nome
HAVING count(CeF.data) = 0


SELECT *
  FROM netFilmes_Ator ATOR
       LEFT JOIN netFilmes_AtoresDoFilme ATORdoFILME ON ATORdoFILME.idAtor = ATOR.id
WHERE idFilme IS NULL
ORDER BY nome


SELECT nome
  FROM netFilmes_DiretoresDoFilme DIRdoFIL
       RIGHT JOIN netFilmes_Diretor DIR ON DIRdoFIL.idDiretor = DIR.id
WHERE idFilme IS NULL
ORDER BY nome



-- 1)
SELECT ATOR.nome
  FROM netFilmes_Ator ATOR 
       INNER JOIN netFilmes_AtoresDoFilme ATORESdoFILME ON ATORESdoFILME.idAtor = ATOR.id
       INNER JOIN netFilmes_Filme FILME ON FILME.id = ATORESdoFILME.idFilme
 WHERE FILME.nome = 'Divertida Mente 2'

-- 2)
SELECT DIR.nome
  FROM netFilmes_Diretor DIR
       INNER JOIN netFilmes_DiretoresDoFilme DIRdoFIL ON DIRdoFIL.idDiretor = DIR.id
       INNER JOIN netFilmes_AtoresDoFilme ATORdoFIL ON ATORdoFIL.idFilme = DIRdoFIL.idFilme
       INNER JOIN netFilmes_Ator ATOR ON ATOR.id = ATORdoFIL.idAtor
 WHERE ATOR.nome = 'Will Smith'

-- 3)
SELECT 
  FROM 
       INNER JOIN
       INNER JOIN
 WHERE 

-- 4) 
SELECT 
  FROM
       INNER JOIN
       INNER JOIN
 WHERE 


-- TERMINAR OS EXERCICIOS QUE ESTÃO NO 