CREATE DATABASE IF NOT EXISTS db_escola;
USE db_escola;

CREATE TABLE IF NOT EXISTS alunos(
id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
data_aniversario DATE,
turma VARCHAR(20),
nota DECIMAL(4,2)
);

INSERT INTO alunos(nome, data_aniversario, turma, nota)
VALUES ('Joao', '2000/01/12', 'A-02', 7.5),
('Heitor', '2000-02-21', 'A-04', 8.5),
('Clara', '2000-03-30', 'A-01', 9.5),
('Luiza', '2000-04-05', 'A-02', 7),
('Cicero', '2000-05-16', 'A-04', 8),
('Damaris', '2000-06-22', 'A-01', 9),
('Mary', '2000-07-24', 'A-02', 7.5),
('Kevin', '2000-08-27', 'A-03', 10),
('Maria', '2000-09-04', 'A-02', 6.5),
('Ana', '2000-10-12', 'A-03', 5);

SELECT * FROM alunos WHERE nota > 7;

SELECT * FROM alunos WHERE nota < 7;
SELECT * FROM alunos;
UPDATE alunos SET nota = 8 WHERE id = 2;