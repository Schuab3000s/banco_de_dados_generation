CREATE DATABASE IF NOT EXISTS db_pizzaria_legal;
USE db_pizzaria_legal;

CREATE TABLE IF NOT EXISTS tb_categorias(
id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50),
descricao VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS tb_pizzas(
id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50),
descricao VARCHAR(100),
valor DECIMAL(10, 2),
disponivel BOOLEAN,
id_categoria BIGINT,
FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome, descricao) 
VALUES ('Tradicional', 'Pizzas clássicas de sabores tradicionais'),
('Especial', 'Pizzas com ingredientes especiais e diferenciados'),
('Vegetariana', 'Pizzas sem carne, com ingredientes vegetarianos'),
('Doce', 'Pizzas doces para sobremesa'),
('Vegana', 'Pizzas feitas sem produtos de origem animal');

INSERT INTO tb_pizzas (nome, descricao, valor, disponivel, id_categoria) 
VALUES ('Margherita', 'Molho de tomate, mussarela e manjericão', 42.00, TRUE, 1),
('Pepperoni', 'Molho de tomate, mussarela e pepperoni', 48.00, TRUE, 1),
('Quatro Queijos', 'Molho de tomate, mussarela, gorgonzola, provolone e parmesão', 55.00, TRUE, 2),
('Frango com Catupiry', 'Molho de tomate, frango desfiado e catupiry', 50.00, TRUE, 2),
('Vegetariana', 'Molho de tomate, pimentão, cebola, tomate e azeitonas', 40.00, TRUE, 3),
('Brigadeiro', 'Chocolate, granulado e leite condensado', 45.00, TRUE, 4),
('Romeu e Julieta', 'Queijo e goiabada', 47.00, TRUE, 4),
('Vegana Especial', 'Molho de tomate, cogumelos, espinafre e pimentão', 52.00, TRUE, 5);

SELECT * FROM  tb_pizzas;

-- Faça um SELECT que retorna todas as pizzas cujo valor seja maior do que R$ 45,00
SELECT nome, descricao, valor FROM tb_pizzas 
WHERE valor > 45.00;

-- Faça um SELECT que retorna todas as pizzas cujo valor esteja no intervalo R$ 50,00 e R$ 100,00
SELECT nome, descricao, valor FROM tb_pizzas 
WHERE valor BETWEEN 50.00 AND 100.00;

-- Faça um SELECT utilizando o operador LIKE, buscando todas as pizzas que possuam a letra M no atributo nome
SELECT nome, descricao, valor FROM tb_pizzas 
WHERE nome LIKE '%M%';

-- Faça um SELECT utilizando INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias
SELECT p.nome AS pizza, p.valor, c.nome AS categoria 
FROM tb_pizzas AS p
INNER JOIN tb_categorias AS c 
ON p.id_categoria = c.id;

-- Faça um SELECT utilizando INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias, filtrando por uma categoria específica (pizzas doces)
SELECT p.nome AS pizza, p.valor, c.nome AS categoria 
FROM tb_pizzas AS p
INNER JOIN tb_categorias AS c 
ON p.id_categoria = c.id
WHERE c.nome = 'Doce';