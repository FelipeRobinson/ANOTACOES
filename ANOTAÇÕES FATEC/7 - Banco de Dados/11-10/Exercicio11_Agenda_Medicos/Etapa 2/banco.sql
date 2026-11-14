-- =====================================================================
-- Exercício 11 – Agenda de Médicos e Pacientes
-- Etapa 2 – Criação do banco de dados físico (MySQL / MariaDB)
-- =====================================================================

DROP DATABASE IF EXISTS `20262s-consulta`;
CREATE DATABASE `20262s-consulta`
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;

USE `20262s-consulta`;

-- Tabela CONVENIO
CREATE TABLE convenio (
  codigoconvenio INT(5)      NOT NULL,
  nome           VARCHAR(80) NOT NULL,
  PRIMARY KEY (codigoconvenio)
) ENGINE=InnoDB;

-- Tabela MEDICO
CREATE TABLE medico (
  CRM            INT(9)       NOT NULL,
  nome           VARCHAR(80)  NOT NULL,
  especializacao VARCHAR(100) NOT NULL,
  PRIMARY KEY (CRM)
) ENGINE=InnoDB;

-- Tabela PACIENTE (identificado pelo convênio + número no convênio)
CREATE TABLE paciente (
  codigoconvenio INT(5)      NOT NULL,
  numeropaciente INT(6)      NOT NULL,
  nome           VARCHAR(80) NOT NULL,
  PRIMARY KEY (codigoconvenio, numeropaciente),
  CONSTRAINT fk_paciente_convenio
    FOREIGN KEY (codigoconvenio) REFERENCES convenio (codigoconvenio)
) ENGINE=InnoDB;

-- Tabela CONSULTA (relacionamento N:N entre paciente e médico, com data/hora)
CREATE TABLE consulta (
  codigoconvenio INT(5)   NOT NULL,
  numeropaciente INT(6)   NOT NULL,
  CRM            INT(9)   NOT NULL,
  datahora       DATETIME NOT NULL,
  PRIMARY KEY (codigoconvenio, numeropaciente, CRM, datahora),
  KEY idx_consulta_crm (CRM),
  CONSTRAINT fk_consulta_medico
    FOREIGN KEY (CRM) REFERENCES medico (CRM),
  CONSTRAINT fk_consulta_convenio
    FOREIGN KEY (codigoconvenio) REFERENCES convenio (codigoconvenio),
  CONSTRAINT fk_consulta_paciente
    FOREIGN KEY (codigoconvenio, numeropaciente)
    REFERENCES paciente (codigoconvenio, numeropaciente)
) ENGINE=InnoDB;
