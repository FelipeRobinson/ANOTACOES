CREATE TABLE dbo.join_Fornecedor(
    Id int identity(1,1) not null,
    Nome varchar(40) not null,

    CONSTRAINT pk_jFornecedor  PRIMARY  KEY (id)
)

CREATE TABLE dbo.join_Produto(
    Id int identity(1,1) not null,
    Nome varchar(50) not null,

    CONSTRAINT pk_JProduto  PRIMARY  KEY (id)
)

CREATE TABLE dbo.join_Fornecimento(
    IdProduto int not null,
    idFornecedor int not null,
    preco money not null,

    CONSTRAINT pk_JFornecimento  PRIMARY KEY (idProduto, idFornecedor),
    CONSTRAINT fk_JFornecimento_produto  FOREIGN KEY (idProduto) REFERENCES join_Produto (id),
    CONSTRAINT fk_JFornecimento_fornecedor  FOREIGN KEY  (idFornecedor) REFERENCES join_Fornecedor(id)
)

/**************
    INSERTS
***************/

INSERT INTO join_Fornecedor (Nome) 
VALUES ('Queijos e Outros Frios Ltda.'),
    ('Refrigerantes Total Soda Ltda.'),
    ('Casa de Pães Alice S.A.'),
    ('Sempre Pronto'),
    ('Fornecedor sem Produto')

INSERT INTO join_Produto (Nome) 
VALUES ('Pão de Ervas'),
      ('Pão de Cebola'),
      ('Pão de Leite'),
      ('Pão Frances'),
      ('Coca-Cola'),
      ('Guaraná'),
      ('Presunto'),
      ('Queijo Fresco'),
      ('Hamburger'),
      ('Bacon')

INSERT INTO join_Fornecimento (idProduto, idFornecedor, Preco) 
VALUES (1,3,1.0),
      (2,4,0.8),
      (3,3,0.8),
      (4,3,0.6),
      (5,2,2.0),
      (6,2,2.1),
      (7,1,5.0),
      (8,1,8.3),
      (9,4,2.4),
      (10,4,4.5)

/**************
    SELECTS
***************/

SELECT * FROM dbo.join_Fornecedor
SELECT * FROM dbo.join_Produto


SELECT FO.Nome as 'Fonecedor', P.Nome as 'Produto', Preco
FROM join_Fornecimento F
     RIGHT JOIN join_Fornecedor FO ON F.idFornecedor = FO.Id
     RIGHT JOIN join_Produto P ON F.IdProduto = P.Id