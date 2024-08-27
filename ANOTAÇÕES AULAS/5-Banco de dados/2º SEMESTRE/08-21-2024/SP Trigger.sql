CREATE TABLE trCLIENTES(
   RG char(15) not null,
   Nome varchar(40) not null,
   EMail varchar(40) not null,
   Telefone varchar(40) not null,

   constraint pk_clientes primary key  (rg)
) 

CREATE TABLE trAGENCIA(
   id Int Identity not null,
   Nome varchar(40) not null,

   constraint pk_agencia primary key  (id)
) 

CREATE TABLE trCONTA(
   idAgencia int not null,
   nrConta int not null,
   DV int not null,
   Tipo int not null,
   idCliente char(15) not null,
   saldo money not null,

   constraint pk_conta primary key  (idAgencia,nrConta),
   constraint fk_conta_agencia foreign key (idAgencia) references trAgencia(id),
   constraint fk_conta_cliente foreign key (idCliente) references trClientes(rg)
) 

CREATE TABLE trMOVIMENTACAO(
   id Int Identity not null,
   idAgencia int not null,
   nrConta int not null,
   data smalldatetime not null,
   descricao varchar(50) not null,
   valor  money not null,
   credito bit not null,
   
   constraint pk_movimentacao primary key (id),
	CONSTRAINT fk_mov_ag_conta FOREIGN KEY (idAgencia,nrCOnta) REFERENCES trCONTA (idAgencia,nrCOnta)
)

CREATE TABLE trAGENDAMENTO(
   id Int Identity not null,
   idAgencia int not null,
   nrConta int not null,
   data smalldatetime not null,
   descricao varchar(50) not null,
   valor  money not null,
   credito bit not null,
   
   constraint pk_agendamento primary key (id),
	CONSTRAINT fk_agendamento_ag_conta FOREIGN KEY (idAgencia,nrCOnta) REFERENCES trCONTA (idAgencia,nrCOnta)
)

INSERT INTO trCLIENTES 
VALUES ('52154','Marcelo Antonio Santos','mar@uol.com','36254587'),
       ('23423','Gil Faber','gf211@uol.com','2345476'),
       ('68767','Beth Brunella','bb@uol.com','32342347'),
       ('12333','Cris Antunes','ca@uol.com','39789587')

INSERT INTO trAGENCIA(nome) 
VALUES ('Barao de Itapura'),
       ('Culto A Ciencia'),
       ('Centro')

INSERT INTO trCONTA 
VALUES (1,10,5,0,'52154',100),
       (2,100,0,0,'23423',520),
       (2,110,5,1,'68767',210),
       (3,120,0,0,'12333',325)