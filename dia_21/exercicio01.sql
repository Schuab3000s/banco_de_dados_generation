CREATE DATABASE IF NOT EXISTS db_rh ;
use db_rh;

CREATE TABLE IF NOT EXISTS colaboradores(
id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
email VARCHAR(100),
telefone VARCHAR(11),
salario DECIMAL(8,2)
);

INSERT INTO colaboradores
value ('Maria','maria@gmail.com','21987654321',2500.00),
('João','joao@gmail.com','21987258321',2500.00),
('Kevin','kevin@gmail.com','11987654321',2000.00),
('Ana','ana@gmail.com','21912354321',1500.00),
('Ruth','ruth@gmail.com','21975654321',4500.00);

SELECT nome, salario FROM colaboradores 
WHERE salario > 2000;

SELECT nome, salario FROM colaboradores 
WHERE salario < 2000;

UPDATE colaboradores SET salario = 50000.00 WHERE nome = 'Kevin';