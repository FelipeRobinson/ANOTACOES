--========================================== PROVA 1 ==========================================--
-- 1)
create table FUNCIONARIO (
	Id int identity not null,
	Nome Varchar(20) not null,
	DataNasc smalldatetime,

	CONSTRAINT pk_funcionario PRIMARY KEY (Id)
)

-- 2)
alter table FUNCIONARIO
	alter column Nome Varchar(40) not null

-- 3)
alter table FUNCIONARIO
	add NrFilhos int not null

-- 4)
INSERT INTO FUNCIONARIO (Nome, NrFilhos)
VALUES ('Felbs', 2)

-- 5)
create table DEPENDENTE (
	Id int identity not null,
	Nome Char(24) not null,
	idResponsavel int not null,

	CONSTRAINT pk_dependente PRIMARY KEY (Id),
	CONSTRAINT fk_dependente_funcionario FOREIGN KEY (idResponsavel) REFERENCES FUNCIONARIO (Id)
)

-- 6)
alter table FUNCIONARIO
	drop column NrFilhos

-- 7)
INSERT INTO DEPENDENTE (Nome, idResponsavel)
VALUES ('Pedro Alexandre',1)

-- 8)
UPDATE DEPENDENTE
SET Nome = 'Pedro Alberto'
WHERE Nome = 'Pedro Alexandre'

-- 9)
DELETE FROM FUNCIONARIO
WHERE Nome = 'Felbs'

-- 10)
alter table DEPENDENTE
	drop constraint fk_dependente_funcionario

drop table FUNCIONARIO