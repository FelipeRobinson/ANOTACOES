create table FAMILIA (
    Id int identity,
    Nome int not null,
    Idade int

    CONSTRAINT pk_FAMILIA_Id PRIMARY KEY (Id)
)

create table AMIGOS (
    Id int identity,
    Nome int not null,
    Idade int not null

    CONSTRAINT pk_AMIGOS_Id PRIMARY KEY (Id)
)