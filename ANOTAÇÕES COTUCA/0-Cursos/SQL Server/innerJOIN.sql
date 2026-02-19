create table FAMILIA (
    Id int identity,
    Nome Varchar(10) not null,
    Idade int

    CONSTRAINT pk_FAMILIA_Id PRIMARY KEY (Id)
)

INSERT FAMILIA (Nome, Idade, )
VALUES ('Felipe','15'),
       ('Manoela','14'),
       ('Ellen', '43'),
       ('Tomaz', '80'),
       ('Silveira','16')


create table AMIGOS (
    Id int identity,
    id_AMIGOS FOREIGN KEY
    Nome Varchar(10) not null,
    Idade int

    CONSTRAINT pk_AMIGOS_Id PRIMARY KEY (Id)
)

create table ADA (
    Id int identity,
    MeuAmigo varchar(500) not null,
    id_AMIGOS VarChar(100) not null,
    Nome Varchar(10) not null,
    Idade int

    CONSTRAINT pk_AMIGOS_Id PRIMARY KEY (Id)
    CONSTRAINT fk_ADA_AMIGOS FOREIGN KEY AMIGOS REFERENCES (Id)
    CONSTRAINT fk
)

INSERT AMIGOS (Nome, Idade)
VALUES ('Diogo','16'),
       ('Joãozin','15'),
       ('João Pedro', '16'),
       ('João Vini', '16'),
       ('João Vini', '20'),
       ('Thiaguinho','19')


SELECT * FROM FAMILIA
SELECT * FROM AMIGOS


SELECT A.id_AMIGOS, 
       Count(F.Id)
  FROM FAMILIA F
    INNER JOIN AMIGOS A 
            ON A.id_AMIGOS = F.id
GROUP BY F.Nome
ORDER BY A.Id 


SELECT A.id_AMIGOS as "", 
       Count(F.Id)
  FROM FAMILIA F
    INNER JOIN AMIGOS A 
            ON A.id_AMIGOS = F.id
    INNER JOIN amigos_de_amigos ADA
            ON ADA.Meuamigo = A.Id



/* 
COUNT() serve para contar
GROUP BY serve como se fosse um WHERE, ou armazenar um elemento repetido
*/