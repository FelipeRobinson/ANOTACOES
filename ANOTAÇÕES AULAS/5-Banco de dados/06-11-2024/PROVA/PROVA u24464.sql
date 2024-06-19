CREATE TABLE joinCIDADE (
   Codigo int identity(1,1) not null, 
   Nome varchar(50) not null

   CONSTRAINT pk_joincidade PRIMARY KEY (codigo)
)

CREATE TABLE joinESTADO (
    UF char(2) not null, 
    Nome varchar(50) not null

   CONSTRAINT pk_joinestado PRIMARY KEY (uf)
)

CREATE TABLE joinCLIENTE (
    Codigo int identity(1,1) not null, 
    Nome varchar(50) not null, 
    Endereço varchar(50), 
    idCidade int not null, 
    UF char(2) not null

   CONSTRAINT pk_joincliente PRIMARY KEY (codigo),
   CONSTRAINT fk_joincliente_cidade FOREIGN KEY (idcidade) REFERENCES joinCidade(codigo),
   CONSTRAINT fk_joincliente_estado FOREIGN KEY (uf) REFERENCES joinEstado(uf)
)

CREATE TABLE joinPRODUTO (
   Codigo int identity(1,1) not null, 
   Descricao varchar(50) not null , 
   Preco money not null

   CONSTRAINT pk_joinproduto PRIMARY KEY (codigo)
)

CREATE TABLE joinVENDEDOR (
   codigo int identity(1,1) not null, 
   Nome varchar(50) not null, 
   Comissao float not null,
   Salario money not null

   CONSTRAINT pk_joinvendedor PRIMARY KEY (codigo)
)

CREATE TABLE joinPEDIDO (
   Num_Pedido int identity(1,1) not null ,
   Prazo_Entrega int not null, 
   Cod_Cliente int not null, 
   Cod_Vendedor int not null,
   Data smalldatetime not null

   CONSTRAINT pk_joinpedido PRIMARY KEY (num_pedido),
   CONSTRAINT fk_joinpedido_cliente FOREIGN KEY (Cod_Cliente) REFERENCES joinCliente(codigo),
   CONSTRAINT fk_joinpedido_vendedor FOREIGN KEY (Cod_Vendedor) REFERENCES joinVendedor(codigo)
)

CREATE TABLE joinITEMPEDIDO (
   num_pedido int not null ,
   Cod_produto int not null, 
   Quantidade int not null,

   CONSTRAINT pk_joinitempedido PRIMARY KEY (num_pedido, Cod_produto),
   CONSTRAINT fk_joinitempedido_pedido FOREIGN KEY (num_pedido) REFERENCES joinpedido(num_pedido),
   CONSTRAINT fk_joinitempedido_produto FOREIGN KEY (Cod_Produto) REFERENCES joinProduto(codigo)
)

INSERT INTO joinCidade 
VALUES('Campinas'),
      ('São Paulo'),
      ('Hortolandia'),
      ('Rio de Janeiro'),
      ('Jundiai')

-- SELECT * from joinCidade
INSERT INTO joinESTADO 
VALUES ('SP','São Paulo'),
       ('RJ','Rio de Janeiro'),
       ('MG','Minas Gerais'),
       ('ES','Espirito Santo')
--SELECT * from joinEstado

INSERT INTO joinCLIENTE 
VALUES ('Pedro Junior','Rua 1',1,'SP'),
       ('Paulo Alexandre','Rua 2',1,'SP'),
       ('Renato Kleisson','Rua 3',2,'SP'),
       ('Beth Araujo','Rua 4',2,'SP'),
       ('Carmem Keyla','Rua 5',2,'SP'),
       ('Lucineide Tantrino','Rua 6',3,'SP'),
       ('Carlos Husten','Rua 7',3,'SP'),
       ('Joao Marcelo Pires','Rua 8',3,'SP'),
       ('Jondir Junior','Rua 9',3,'SP'),
       ('Karla Marcela','Rua 10',5,'SP'),
       ('Histela Nuvens Barros','Rua 11',5,'SP'),
       ('Breston Gruvers','Rua 12',4,'RJ'),
       ('Nilserdio Galdiense','Rua 13',4,'RJ'),
       ('Cersiliano Batosta','Rua 14',4,'RJ'),
       ('Tarlino Tubristen','Rua 14',4,'RJ')
--Select * from joinCliente

INSERT INTO joinPRODUTO 
VALUES ('Pão de Queijo',1.0),
       ('Pizza',17.6),
       ('Ravioli',9.5),
       ('Lazanha',7.6),
       ('O Prato',127.6)
-- Select * from joinproduto

INSERT INTO joinVENDEDOR 
VALUES ('Marcelo Ferdinandez',17,1400.00),
       ('João Pedro',15,1200.00),
       ('Pedro Marques',21,400.00),
       ('Julio Fraste',15,1600.00),
       ('Luiz D´Angelo',50,700.00)
--Select * from joinVendedor

INSERT INTO joinPEDIDO 
VALUES (15,1,1,05/20/2024),
       (15,1,1,11/21/2024),
       (20,2,1,01/15/2024),
       (20,2,1,01/24/2024),
       (15,3,1,03/30/2024),
       (30,3,1,02/01/2024),
       (15,4,2,02/05/2024),
       (30,4,2,01/14/2024),
       (15,5,2,01/19/2024),
       (15,6,2,02/08/2024),
       (25,6,3,03/09/2024),
       (25,7,3,03/07/2024),
       (15,7,3,01/04/2024),
       (15,8,3,01/15/2024),
       (15,8,4,02/21/2024),
       (15,9,4,06/10/2024),
       (40,9,4,06/13/2024),
       (15,10,4,04/04/2024),
       (40,10,4,01/08/2024),
       (15,11,4,02/06/2024),
       (15,11,5,01/15/2024),
       (40,11,5,01/10/2024),
       (15,12,5,02/02/2024),
       (15,12,5,04/10/2024),
       (40,12,5,03/15/2024),
       (30,5,2,02/12/2024)
--Select * from joinpedido

INSERT INTO joinITEMPEDIDO 
VALUES (1,1,12),
       (1,2,10),
       (2,1,567),
       (3,2,606),
       (3,3,80),
       (4,1,22),
       (4,3,33),
       (5,1,678),
       (5,3,25),
       (5,2,100),
       (5,5,23),
       (6,1,4),
       (6,2,300),
       (7,5,400),
       (7,3,787),
       (8,3,36),
       (9,4,66),
       (11,4,35),
       (11,3,23),
       (12,2,3),
       (13,1,78),
       (14,2,73),
       (14,3,46),
       (15,4,6),
       (16,5,456),
       (17,4,24),
       (18,3,21),
       (19,2,7),
       (20,2,34),
       (21,1,7),
       (22,2,56),
       (23,4,3),
       (24,5,5),
       (25,3,1),
       (26,2,4)

drop table joinITEMPEDIDO
drop table joinPEDIDO
drop table joinVENDEDOR
drop table joinPRODUTO
drop table joinCLIENTE
drop table joinESTADO
drop table joinCIDADE


/* 1) Indique o comando SQL para listar todas as Cidades 
do estado cujo nome é ‘Espirito Santo’. Escreva duas versões 
da sua solução, uma com INNER JOIN e outra sem. */
SELECT CITY.Nome
  FROM joinCIDADE CITY
    INNER JOIN joinCLIENTE CLIENT
                ON CITY.Codigo = CLIENT.idCidade
WHERE CITY.Nome = 'Espirito Santo'

-- ou --

SELECT CITY.Nome, ESTD.Nome
  FROM joinCIDADE CITY, joinESTADO ESTD
 WHERE CITY.Nome and ESTD.Nome = 'Esprito Santo'

/* 2)Indique o comando SQL para listar todos os CLIENTES 
da cidade cujo nome é ‘Rio de Janeiro’. */
SELECT CITY.Nome
  FROM joinCLIENTE CLIENT
    INNER JOIN joinCIDADE CITY
                ON CLIENT.Codigo = CITY.Nome
WHERE CITY.Nome = 'Rio de Janeiro'


/* 3)Indique o comando SQL para listar as CIDADES e 
quantidade de pedidos que foram realizados em cada uma delas. */
SELECT QNT.Quantidade
  FROM joinITEMPEDIDO QNT
    INNER JOIN joinCIDADE CITY
                ON QNT.Quantidade = CITY.Nome


/* 4) Indique o comando SQL para listar cada PRODUTO e a 
quantidade de itens vendidos de cada um deles. */
SELECT PROD.Codigo
  FROM joinPRODUTO PROD
    INNER JOIN joinITEMPEDIDO PED
                ON PROD.Codigo = PED.Cod_produto


/* 5)Indique o comando SQL para listar o nome de todos 
os VENDEDORES que realizaram vendas que tenham ‘Lazanha’ 
em seus pedidos emitidos. */
SELECT VEND.codigo 
  FROM joinVENDEDOR VEND
    INNER JOIN joinPEDIDO PED
                ON VEND.codigo = PED.Cod_Vendedor
WHERE PED.Num_Pedido = 'Lazanha'


/* 6) Indique qual foi o valor total arrecadado com venda 
de produtos. */
SELECT PROD.Codigo, PROD.Preco
  FROM joinPRODUTO PROD
    INNER JOIN joinITEMPEDIDO ITEM
                ON ITEM.Cod_produto = PROD.Codigo
    INNER JOIN joinITEMPEDIDO 
                ON ITEM.Quantidade = PROD.Preco


/* 7) Indique qual foi o valor arrecadado com o produto ‘Pizza’ 
no mês 03 deste ano. */
SELECT PROD.Codigo
  FROM joinPRODUTO PROD
    INNER JOIN joinPEDIDO PED
                ON PED.Data = PROD.Preco
WHERE PROD.Codigo = 'Pizza' and PED.[Data] = '%03/2024'