-- Criação da Tabela de Ator
CREATE TABLE netFilmes_Ator(
    id int identity(1,1) not null,
    nome varchar(40) not null

    CONSTRAINT pk_netFilmes_Ator PRIMARY KEY (id)
)

-- Criação da Tabela de Diretor
CREATE TABLE netFilmes_Diretor(
    id int identity(1,1) not null,
    nome varchar(40) not null

    CONSTRAINT pk_netFilmes_Diretor PRIMARY KEY (id)
)

-- Crialção da Tabela de Gênero
CREATE TABLE netFilmes_Genero(
    id int identity(1,1) not null,
	descricao varchar(50) not null

    CONSTRAINT pk_netFilmes_Genero PRIMARY KEY (id)
)

-- Criação da Tabela de Filme
CREATE TABLE netFilmes_Filme(
   id int identity(1,1) not null,
   nome varchar(40) not null,
   idGenero int not null 

   CONSTRAINT pk_netFilmes_Filme PRIMARY KEY (id)
   CONSTRAINT fk_netFilmes_Filme_Genero FOREIGN KEY (idGenero) REFERENCES netFilmes_Genero (id)
)

-- Criação da Tabela de RELACIONAMENTO AtoresDoFilme
CREATE TABLE netFilmes_AtoresDoFilme(
    idAtor int not null,
	idFilme int not null

	CONSTRAINT pk_netFilmes_AtoresDoFilme PRIMARY KEY (idAtor,idFilme),
    CONSTRAINT fk_netFilmes_AFilme_Ator FOREIGN KEY (idAtor) REFERENCES netFilmes_Ator (id),
	CONSTRAINT fk_netFilmes_AFilme_Filme FOREIGN KEY (idFilme) REFERENCES netFilmes_Filme (id)
)

-- Criação da Tabela de RELACIONAMENTO DiretoresDoFilme
CREATE TABLE netFilmes_DiretoresDoFilme(
    idDiretor int not null,
    idFilme int not null

	CONSTRAINT pk_netFilmes_DiretoresDoFilme PRIMARY KEY (idDiretor,idFilme),
    CONSTRAINT fk_netFilmes_DFilme_Ator FOREIGN KEY (idDiretor) REFERENCES netFilmes_Diretor (id),
	CONSTRAINT fk_netFilmes_DFilme_Filme FOREIGN KEY (idFilme) REFERENCES netFilmes_Filme (id)
)

CREATE TABLE netFilmes_Cliente(
    id int identity(1,1) not null,
    nome varchar(40) not null

    CONSTRAINT pk_netFilmes_Cliente PRIMARY KEY (id)
)