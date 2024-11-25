CREATE DATABASE IF NOT EXISTS cidade_dos_vegetais;
USE cidade_dos_vegetais;

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
VALUES ('Vegetais Frescos', 'Produtos frescos como verduras e legumes'),
('Frutas', 'Frutas frescas e saudáveis'),
('Ervas e Temperos', 'Ervas frescas e temperos naturais'),
('Vegetais Orgânicos', 'Vegetais cultivados sem agrotóxicos'),
('Raízes e Tubérculos', 'Produtos como batatas, cenouras e outras raízes');

INSERT INTO tb_produtos (nome, descricao, valor, quantidade, id_categoria) 
VALUES ('Alface', 'Alface fresca e crocante', 5.00, 100, 1),
('Tomate', 'Tomate maduro e suculento', 7.00, 80, 1),
('Maçã', 'Maçã vermelha e doce', 6.50, 60, 2),
('Manjericão', 'Manjericão fresco para temperar', 4.00, 40, 3),
('Batata Doce', 'Batata doce orgânica', 12.00, 50, 5),
('Cenoura', 'Cenoura fresca e crocante', 8.00, 70, 1),
('Beterraba', 'Beterraba orgânica', 10.00, 30, 4),
('Abóbora', 'Abóbora madura e fresca', 15.00, 20, 5);

SELECT * FROM tb_produtos;

-- Faça um SELECT que retorna todos os produtos cujo valor seja maior do que R$ 50,00
SELECT nome, descricao, valor, quantidade FROM tb_produtos 
WHERE valor > 7.00;

-- Faça um SELECT que retorna todos os produtos cujo valor esteja no intervalo R$ 50,00 e R$ 150,00
SELECT nome, descricao, valor, quantidade FROM tb_produtos 
WHERE valor BETWEEN 5.00 AND 10.00;

-- Faça um SELECT utilizando o operador LIKE, buscando todos os produtos que possuam a letra C no atributo nome
SELECT nome, descricao, valor, quantidade FROM tb_produtos 
WHERE nome LIKE '%C%';

-- Faça um SELECT utilizando INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias
SELECT p.nome AS produto, p.valor, c.nome AS categoria 
FROM tb_produtos AS p
INNER JOIN tb_categorias AS c 
ON p.id_categoria = c.id
ORDER BY produto;

-- Faça um SELECT utilizando INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias, filtrando por uma categoria específica (produtos de frutas ou vegetais frescos)
SELECT p.nome AS produto, p.valor, c.nome AS categoria 
FROM tb_produtos AS p
INNER JOIN tb_categorias AS c 
ON p.id_categoria = c.id
WHERE c.nome IN ('Frutas', 'Vegetais Frescos')
ORDER BY produto;