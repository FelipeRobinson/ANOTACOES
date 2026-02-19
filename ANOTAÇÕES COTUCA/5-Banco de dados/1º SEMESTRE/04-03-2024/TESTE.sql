create table dbo.departamento(
	codigo int  identity not null,
	nome varchar(30) not null,
		
	constraint pk_departamento primary key (codigo) 
)

create table dbo.professor(
	codigo int identity not null,
	nome varchar(30) not null
)

alter table dbo.departamento
add constraint pk_departamento primary key (codigo)

create table dbo.compras(
	codCliente int not null,
	codProduto int not null,
	Data smalldatetime not null,
	Valor money not null,

	constraint pk_compras primary key (codCliente,codProduto, Data)
)