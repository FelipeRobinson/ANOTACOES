create table FAMILIA (
    Id int identity,
    Nome Varchar(10) not null,
    Idade int

    CONSTRAINT pk_FAMILIA_Id PRIMARY KEY (Id)
)

INSERT FAMILIA (Nome, Idade)
VALUES ('Felipe','15'),
       ('Manoela','14'),
       ('Ellen', '43'),
       ('Tomaz', '80'),
       ('Silveira','16')


create table AMIGOS (
    Id int identity,
    Nome Varchar(10) not null,
    Idade int

    CONSTRAINT pk_AMIGOS_Id PRIMARY KEY (Id)
)

INSERT AMIGOS (Nome, Idade)
VALUES ('Diogo','16'),
       ('Joãozin','15'),
       ('João Pedro', '16'),
       ('João Vini', '16')


SELECT * FROM FAMILIA
SELECT * FROM AMIGOS


SELECT FAMILIA.Idade = a, AMIGOS.Idade = b 
FROM 
WHERE Idade > 16


drop table FAMILIA
drop table AMIGOS