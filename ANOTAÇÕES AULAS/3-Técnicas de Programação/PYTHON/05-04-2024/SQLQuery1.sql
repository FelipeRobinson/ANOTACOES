create table ALUNO (
	RA INT IDENTITY not null,

	CONSTRAINT pk_ALUNO PRIMARY KEY (RA)
);

alter table ALUNO
	add NOME VarChar(30)

SELECT * FROM ALUNO