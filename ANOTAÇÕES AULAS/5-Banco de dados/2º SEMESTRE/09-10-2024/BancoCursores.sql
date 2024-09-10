CREATE TABLE curClientes (
	id int identity not null,
	nome varchar(40) not null

	constraint pk_curClientes PRIMARY KEY (id)
)

INSERT INTO curClientes (nome)
VALUES ('Mercado das Flores'), 
	   ('Pedro Paulo COm�rcio Ltda'),
	   ('Alez Marins')

CREATE TABLE curProdutos (
	id int identity not null,
	descricao varchar(40) not null, 
	estoque int not null DEFAULT 0, 
	valorUnitario money not null DEFAULT 0.0

	constraint pk_curProdutos PRIMARY KEY (id)
)

INSERT INTO curProdutos(descricao, estoque, valorUnitario)
VALUES ('Caneta BIC Super',100,10.25),
       ('Caderno 100 Folhas',5,20.25),
       ('Papel Bolha',80,14.56),
       ('Teclado Simples',80,70.30),
       ('Mesa de Plastico',350,34.20),
       ('Gaveteiro',580,60.50)

CREATE TABLE curVendas (
	id int identity not null,
	data smalldatetime not null, 
	idCliente int not null , 
	situacao int not null

	constraint pk_curVendas PRIMARY KEY (id)
)

INSERT INTO curVendas (data, idCliente, situacao) 
VALUES (getdate()-20, 1, 0),
	   (getdate()-30, 1, 0),
	   (getdate()-60, 1, 0),
	   (getdate()-30, 2, 1),
	   (getdate()-50, 2, 0),
	   (getdate()-80, 2, 0),
	   (getdate()-20, 3, 0),
	   (getdate()-20, 3, 1)

CREATE TABLE curItens (
	idVenda int not null,
	idProduto int not null , 
	quantidade int not null, 
	valor money not null

	constraint pk_curItens PRIMARY KEY (idVenda, idProduto)
)