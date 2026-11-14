-- =====================================================================
-- Exercício 11 – Agenda de Médicos e Pacientes
-- Etapa 3 – Popular as tabelas (inserir dados)
-- Ordem: convenio -> medico -> paciente -> consulta (por causa das FKs)
-- =====================================================================

USE `20262s-consulta`;

INSERT INTO convenio (codigoconvenio, nome) VALUES
(1, 'UNIMED'),
(2, 'AMIL'),
(3, 'BRADESCO'),
(4, 'SAUDE INTEGRAL'),
(5, 'VIDA PLENA'),
(6, 'MED MAIS'),
(7, 'SAUDE TOTAL'),
(8, 'BEM ESTAR'),
(9, 'VIDA SAUDAVEL'),
(10, 'PROTEGE SAUDE'),
(11, 'CLINICA FACIL'),
(12, 'SAUDE PRIME'),
(13, 'VIDA E SAUDE'),
(14, 'MED CENTER'),
(15, 'SAUDE BRASIL'),
(16, 'PLANO VITAL'),
(17, 'NOVA SAUDE'),
(18, 'UNIAO MEDICA'),
(19, 'SAUDE IDEAL'),
(20, 'VIDA MAIS'),
(21, 'MED POPULAR'),
(22, 'SAUDE FAMILIAR'),
(23, 'BEM VIVER');

INSERT INTO medico (CRM, nome, especializacao) VALUES
(11111, 'Baciclides da Silva Sauro', 'Cirurgião'),
(22222, 'Josisvaldo Araújo', 'Geriatra; Pediatra'),
(33333, 'Otoniel de Almeida Barros', 'Otorrinolaringologista'),
(44444, 'Mariana Costa Ribeiro', 'Cardiologista'),
(44445, 'Roberto Mendes Lima', 'Ortopedista'),
(44446, 'Fernanda Alves Martins', 'Dermatologista'),
(44447, 'Eduardo Ferreira Souza', 'Neurologista'),
(44448, 'Patricia Gomes Oliveira', 'Pediatra'),
(44449, 'Ricardo Santos Pereira', 'Urologista'),
(44450, 'Camila Rocha Almeida', 'Ginecologista'),
(44451, 'Felipe Carvalho Nunes', 'Oftalmologista'),
(44452, 'Juliana Barbosa Castro', 'Endocrinologista'),
(44453, 'Marcelo Araujo Costa', 'Psiquiatra'),
(44454, 'Renata Dias Moreira', 'Pneumologista'),
(44455, 'Gustavo Ribeiro Lopes', 'Gastroenterologista'),
(44456, 'Aline Martins Freitas', 'Reumatologista'),
(44457, 'Bruno Oliveira Ramos', 'Oncologista'),
(44458, 'Daniela Lima Ferreira', 'Nefrologista'),
(44459, 'Anderson Souza Melo', 'Cirurgiao'),
(44460, 'Priscila Castro Mendes', 'Geriatra'),
(44461, 'Leonardo Alves Pinto', 'Otorrinolaringologista'),
(44462, 'Vanessa Pereira Dias', 'Hematologista'),
(44463, 'Thiago Costa Barros', 'Medico de familia');

INSERT INTO paciente (codigoconvenio, numeropaciente, nome) VALUES
(1, 1, 'Carlos Almeida de Andrade'),
(1, 2, 'Trophozilda Maria Rocha'),
(3, 1, 'Josephina Madona Perry '),
(4, 1, 'Ana Paula Mendes'),
(5, 1, 'Pedro Henrique Costa'),
(6, 1, 'Mariana Souza Lima'),
(7, 1, 'Lucas Ferreira Alves'),
(8, 1, 'Beatriz Oliveira Santos'),
(9, 1, 'Gabriel Rocha Martins'),
(10, 1, 'Isabela Ribeiro Castro'),
(11, 1, 'Matheus Gomes Pereira'),
(12, 1, 'Laura Carvalho Nunes'),
(13, 1, 'Rafael Barbosa Melo'),
(14, 1, 'Sofia Almeida Freitas'),
(15, 1, 'Enzo Dias Moreira'),
(16, 1, 'Helena Araujo Pinto'),
(17, 1, 'Miguel Lopes Ferreira'),
(18, 1, 'Valentina Ramos Costa'),
(19, 1, 'Arthur Mendes Ribeiro'),
(20, 1, 'Alice Martins Souza'),
(21, 1, 'Davi Castro Oliveira'),
(22, 1, 'Manuela Pereira Santos'),
(23, 1, 'Bernardo Lima Rocha');

INSERT INTO consulta (codigoconvenio, numeropaciente, CRM, datahora) VALUES
(1, 1, 22222, '2026-09-08 15:04:12'),
(1, 1, 22222, '2026-09-29 10:04:46'),
(3, 1, 11111, '2026-09-08 15:06:40'),
(4, 1, 44444, '2026-10-01 08:00:00'),
(5, 1, 44445, '2026-10-01 08:30:00'),
(6, 1, 44446, '2026-10-01 09:00:00'),
(7, 1, 44447, '2026-10-01 09:30:00'),
(8, 1, 44448, '2026-10-01 10:00:00'),
(9, 1, 44449, '2026-10-01 10:30:00'),
(10, 1, 44450, '2026-10-01 11:00:00'),
(11, 1, 44451, '2026-10-01 11:30:00'),
(12, 1, 44452, '2026-10-01 13:00:00'),
(13, 1, 44453, '2026-10-01 13:30:00'),
(14, 1, 44454, '2026-10-01 14:00:00'),
(15, 1, 44455, '2026-10-01 14:30:00'),
(16, 1, 44456, '2026-10-01 15:00:00'),
(17, 1, 44457, '2026-10-01 15:30:00'),
(18, 1, 44458, '2026-10-02 08:00:00'),
(19, 1, 44459, '2026-10-02 08:30:00'),
(20, 1, 44460, '2026-10-02 09:00:00'),
(21, 1, 44461, '2026-10-02 09:30:00'),
(22, 1, 44462, '2026-10-02 10:00:00'),
(23, 1, 44463, '2026-10-02 10:30:00');

-- Conferência
SELECT 'convenio' AS tabela, COUNT(*) AS registros FROM convenio
UNION ALL SELECT 'medico',   COUNT(*) FROM medico
UNION ALL SELECT 'paciente', COUNT(*) FROM paciente
UNION ALL SELECT 'consulta', COUNT(*) FROM consulta;
