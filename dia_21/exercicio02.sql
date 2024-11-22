CREATE DATABASE IF NOT EXISTS db_ecommerce;
use db_ecommerce;

CREATE TABLE IF NOT EXISTS produtos(
id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(25),
marca VARCHAR(25),
preco DECIMAL(8,2),
quantidade INT
);

INSERT INTO produtos(nome,marca,preco,quantidade)
VALUES('Celular','Sansung',2000,100),
('Celular','Motorola',2500,100),
('Celular','Iphone',5000,100),
('Celular','Xiome',1500,100),
('Table','sansung',2000,100),
('Tablet','Motorola',2000,100),
('Tablet','Iphone',2000,100),
('Tablet','Xiome',2000,100);

SELECT nome, marca, preco, quantidade FROM produtos 
WHERE preco > 2000;

SELECT nome, marca, preco, quantidade FROM produtos 
WHERE preco < 2000;

UPDATE produtos SET quantidade = 150 WHERE quantidade = 100;


