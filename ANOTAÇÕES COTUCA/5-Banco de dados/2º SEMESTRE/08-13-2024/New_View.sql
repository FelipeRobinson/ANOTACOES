/*LEARN ABOUT VIEW*/

CREATE TABLE exv_pessoa(  
    id int identity not null,  
    nome varchar(15) not null,  
    sobrenome varchar(40) not null,  
    data_nasc datetime not null,
    
    constraint pk_exv_pessoa PRIMARY KEY (id)
) 

INSERT INTO exv_pessoa(nome, sobrenome, data_nasc) 
VALUES ('Carlos','Silva', '30-05-1980'),  
       ('Pedro','Heiter', '15-05-1980'),  
       ('Adriana','Petrosca', '30-01-1970'),  
       ('Fred','Dantas', '26-08-1990'),  
       ('Kyte','Lascas', '03-02-2000')

DELETE exv_pessoa

SELECT * FROM  exv_pessoa


CREATE VIEW dbo.viewAniversario(
    nome, sobrenome, aniversario) 
AS
  SELECT nome, sobrenome,
    /*CONVERT datatime para Char para manipular mais fácil*/
     CONVERT(char(8), data_nasc, 3)
     FROM exv_pessoa
     WHERE month(data_nasc) = 1;

/*drop view viewAniversario*/
SELECT * FROM viewAniversario



/* 1) Tente  inserir  uma  informação  em  uma  view  com  INSERT.  Verifique  
    o  que  acontece  com  a  tabela original.
*/

INSERT INTO viewAniversario (nome, sobrenome, aniversario)
VALUES ('Peterson','Batista', 15-01-2010),
       ('Andreia','Souza', 10-01-2010)

/* 2) Tente alterar uma informação em uma view com UPDATE. Verifique o que acontece 
   com a tabela original.
*/