CREATE DATABASE IF NOT EXISTS db_farmacia_bem_estar;
USE db_farmacia_bem_estar;

CREATE TABLE IF NOT EXISTS tb_categorias (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    descricao VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS tb_produtos (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    descricao VARCHAR(100),
    valor DECIMAL(10, 2),
    quantidade INT,
    id_categoria BIGINT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome, descricao) 
VALUES ('Medicamentos', 'Produtos farmacêuticos para tratamento de doenças'),
('Cosméticos', 'Produtos para cuidados pessoais e beleza'),
('Suplementos', 'Produtos para suplementação alimentar e vitamínica'),
('Higiene', 'Produtos de higiene pessoal'),
('Infantil', 'Produtos destinados ao cuidado infantil');

INSERT INTO tb_produtos (nome, descricao, valor, quantidade, id_categoria) 
VALUES ('Paracetamol', 'Analgésico e antitérmico', 25.00, 100, 1),
('Shampoo', 'Shampoo para todos os tipos de cabelo', 15.00, 50, 2),
('Vitamina C', 'Suplemento vitamínico', 35.00, 30, 3),
('Sabonete Líquido', 'Sabonete para pele sensível', 12.00, 80, 4),
('Fraldas', 'Fraldas descartáveis tamanho M', 40.00, 60, 5),
('Protetor Solar', 'Protetor solar FPS 50', 55.00, 20, 2),
('Creatina', 'Suplemento para aumento de massa muscular', 75.00, 15, 3),
('Antisséptico Bucal', 'Produto para higiene bucal', 18.00, 40, 4);

SELECT * FROM tb_produtos;

-- Faça um SELECT que retorna todos os produtos cujo valor seja maior do que R$ 50,00
SELECT nome, descricao, valor, quantidade FROM tb_produtos 
WHERE valor > 50.00;

-- Faça um SELECT que retorna todos os produtos cujo valor esteja no intervalo R$ 5,00 e R$ 60,00
SELECT nome, descricao, valor, quantidade FROM tb_produtos 
WHERE valor BETWEEN 5.00 AND 60.00;

-- Faça um SELECT utilizando o operador LIKE, buscando todos os produtos que possuam a letra C no atributo nome
SELECT nome, descricao, valor, quantidade FROM tb_produtos 
WHERE nome LIKE '%C%';

-- Faça um SELECT utilizando INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias
SELECT p.nome AS produto, p.valor, c.nome AS categoria 
FROM tb_produtos AS p
INNER JOIN tb_categorias AS c 
ON p.id_categoria = c.id;

-- Faça um SELECT utilizando INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias, filtrando por uma categoria específica (produtos de cosméticos)
SELECT p.nome AS produto, p.valor, c.nome AS categoria 
FROM tb_produtos AS p
INNER JOIN tb_categorias AS c 
ON p.id_categoria = c.id
WHERE c.nome = 'Cosméticos';