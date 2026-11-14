-- =====================================================================
-- Exercício 11 – Agenda de Médicos e Pacientes
-- Etapa 4 – Aplicação dos comandos SQL no Banco de Dados
-- Banco: 20262s-consulta (MySQL / MariaDB)
-- =====================================================================

USE `20262s-consulta`;

-- ---------------------------------------------------------------------
-- 1. CONSULTAS SIMPLES (SELECT, WHERE, ORDER BY, LIKE, BETWEEN)
-- ---------------------------------------------------------------------

-- 1.1 Listar todos os médicos em ordem alfabética
SELECT CRM, nome, especializacao
FROM medico
ORDER BY nome;

-- 1.2 Médicos de uma especialização específica
SELECT nome, CRM
FROM medico
WHERE especializacao LIKE '%Pediatra%';

-- 1.3 Pacientes cujo nome começa com 'M'
SELECT nome
FROM paciente
WHERE nome LIKE 'M%';

-- 1.4 Consultas marcadas em um período
SELECT *
FROM consulta
WHERE datahora BETWEEN '2026-10-01 00:00:00' AND '2026-10-01 23:59:59'
ORDER BY datahora;

-- 1.5 Consultas do período da manhã (antes das 12h)
SELECT *
FROM consulta
WHERE HOUR(datahora) < 12
ORDER BY datahora;

-- ---------------------------------------------------------------------
-- 2. JUNÇÕES (INNER JOIN / LEFT JOIN)
-- ---------------------------------------------------------------------

-- 2.1 Agenda completa: data, paciente, convênio e médico
SELECT DATE_FORMAT(c.datahora, '%d/%m/%Y %H:%i') AS data_hora,
       p.nome   AS paciente,
       cv.nome  AS convenio,
       m.nome   AS medico,
       m.especializacao
FROM consulta c
INNER JOIN paciente p ON p.codigoconvenio = c.codigoconvenio
                     AND p.numeropaciente = c.numeropaciente
INNER JOIN convenio cv ON cv.codigoconvenio = c.codigoconvenio
INNER JOIN medico   m  ON m.CRM = c.CRM
ORDER BY c.datahora;

-- 2.2 Agenda de um médico específico
SELECT c.datahora, p.nome AS paciente
FROM consulta c
INNER JOIN paciente p ON p.codigoconvenio = c.codigoconvenio
                     AND p.numeropaciente = c.numeropaciente
WHERE c.CRM = 22222
ORDER BY c.datahora;

-- 2.3 Pacientes com o nome do convênio
SELECT p.nome AS paciente, cv.nome AS convenio
FROM paciente p
INNER JOIN convenio cv ON cv.codigoconvenio = p.codigoconvenio
ORDER BY cv.nome, p.nome;

-- 2.4 Médicos que NUNCA atenderam (LEFT JOIN + IS NULL)
SELECT m.CRM, m.nome, m.especializacao
FROM medico m
LEFT JOIN consulta c ON c.CRM = m.CRM
WHERE c.CRM IS NULL;

-- 2.5 Pacientes que ainda não tiveram consulta
SELECT p.codigoconvenio, p.numeropaciente, p.nome
FROM paciente p
LEFT JOIN consulta c ON c.codigoconvenio = p.codigoconvenio
                    AND c.numeropaciente = p.numeropaciente
WHERE c.datahora IS NULL;

-- ---------------------------------------------------------------------
-- 3. AGREGAÇÃO (COUNT, MIN, MAX, GROUP BY, HAVING)
-- ---------------------------------------------------------------------

-- 3.1 Total de consultas cadastradas
SELECT COUNT(*) AS total_consultas FROM consulta;

-- 3.2 Quantidade de consultas por médico (inclui quem tem zero)
SELECT m.nome, COUNT(c.datahora) AS qtd_consultas
FROM medico m
LEFT JOIN consulta c ON c.CRM = m.CRM
GROUP BY m.CRM, m.nome
ORDER BY qtd_consultas DESC, m.nome;

-- 3.3 Quantidade de consultas por convênio
SELECT cv.nome AS convenio, COUNT(c.datahora) AS qtd_consultas
FROM convenio cv
LEFT JOIN consulta c ON c.codigoconvenio = cv.codigoconvenio
GROUP BY cv.codigoconvenio, cv.nome
ORDER BY qtd_consultas DESC;

-- 3.4 Pacientes com mais de uma consulta (HAVING)
SELECT p.nome, COUNT(*) AS qtd
FROM consulta c
INNER JOIN paciente p ON p.codigoconvenio = c.codigoconvenio
                     AND p.numeropaciente = c.numeropaciente
GROUP BY p.codigoconvenio, p.numeropaciente, p.nome
HAVING COUNT(*) > 1;

-- 3.5 Quantidade de consultas por dia
SELECT DATE(datahora) AS dia, COUNT(*) AS qtd
FROM consulta
GROUP BY DATE(datahora)
ORDER BY dia;

-- 3.6 Primeira e última consulta da agenda
SELECT MIN(datahora) AS primeira, MAX(datahora) AS ultima FROM consulta;

-- ---------------------------------------------------------------------
-- 4. SUBCONSULTAS
-- ---------------------------------------------------------------------

-- 4.1 Médico(s) com mais consultas
SELECT m.nome
FROM medico m
WHERE m.CRM IN (
    SELECT CRM FROM consulta
    GROUP BY CRM
    HAVING COUNT(*) = (SELECT MAX(qtd) FROM
                         (SELECT COUNT(*) AS qtd FROM consulta GROUP BY CRM) t)
);

-- 4.2 Convênios sem nenhuma consulta
SELECT nome
FROM convenio
WHERE codigoconvenio NOT IN (SELECT codigoconvenio FROM consulta);

-- ---------------------------------------------------------------------
-- 5. VIEW (visão da agenda)
-- ---------------------------------------------------------------------

CREATE OR REPLACE VIEW vw_agenda AS
SELECT c.datahora,
       p.nome  AS paciente,
       cv.nome AS convenio,
       m.nome  AS medico,
       m.especializacao
FROM consulta c
JOIN paciente p ON p.codigoconvenio = c.codigoconvenio
               AND p.numeropaciente = c.numeropaciente
JOIN convenio cv ON cv.codigoconvenio = c.codigoconvenio
JOIN medico   m  ON m.CRM = c.CRM;

SELECT * FROM vw_agenda ORDER BY datahora;

-- ---------------------------------------------------------------------
-- 6. MANIPULAÇÃO (INSERT, UPDATE, DELETE) – com transação
-- ---------------------------------------------------------------------

START TRANSACTION;

-- 6.1 Agendar nova consulta (Trophozilda com o Dr. Otoniel)
INSERT INTO consulta (codigoconvenio, numeropaciente, CRM, datahora)
VALUES (1, 2, 33333, '2026-11-12 14:00:00');

-- 6.2 Corrigir espaço sobrando no nome de uma paciente
UPDATE paciente
SET nome = TRIM(nome)
WHERE codigoconvenio = 3 AND numeropaciente = 1;

-- 6.3 Padronizar especialização (acento)
UPDATE medico
SET especializacao = 'Cirurgião'
WHERE especializacao = 'Cirurgiao';

-- 6.4 Remarcar a consulta (UPDATE de data)
UPDATE consulta
SET datahora = '2026-11-12 15:00:00'
WHERE codigoconvenio = 1 AND numeropaciente = 2
  AND CRM = 33333 AND datahora = '2026-11-12 14:00:00';

-- 6.5 Cancelar a consulta (DELETE)
DELETE FROM consulta
WHERE codigoconvenio = 1 AND numeropaciente = 2
  AND CRM = 33333 AND datahora = '2026-11-12 15:00:00';

-- 6.6 Teste de integridade: deve FALHAR (CRM inexistente – violação de FK)
-- INSERT INTO consulta VALUES (1, 1, 99999, '2026-11-20 10:00:00');

COMMIT;   -- ou ROLLBACK; para desfazer tudo

-- ---------------------------------------------------------------------
-- 7. ALTERAÇÃO DE ESTRUTURA (DDL)
-- ---------------------------------------------------------------------

-- 7.1 Adicionar telefone ao paciente
ALTER TABLE paciente ADD COLUMN telefone VARCHAR(15) NULL;

-- 7.2 Índice para buscas por data na agenda
CREATE INDEX idx_consulta_datahora ON consulta (datahora);

-- 7.3 Conferir estrutura
DESCRIBE paciente;
SHOW INDEX FROM consulta;
