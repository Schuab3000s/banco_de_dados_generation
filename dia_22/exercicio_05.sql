CREATE DATABASE IF NOT EXISTS db_construindo_vidas;
USE db_construindo_vidas;

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

INSERT INTO tb_categorias (nome, descricao) VALUES ('Ferramentas Manuais', 'Ferramentas utilizadas manualmente para diversas aplicações');
INSERT INTO tb_categorias (nome, descricao) VALUES ('Materiais de Construção', 'Materiais básicos utilizados em obras e construções');
INSERT INTO tb_categorias (nome, descricao) VALUES ('Hidráulica', 'Produtos para instalações e reparos hidráulicos');
INSERT INTO tb_categorias (nome, descricao) VALUES ('Elétrica', 'Materiais e equipamentos para instalações elétricas');
INSERT INTO tb_categorias (nome, descricao) VALUES ('Pintura', 'Produtos relacionados à pintura e acabamento');

INSERT INTO tb_produtos (nome, descricao, valor, quantidade, id_categoria) VALUES ('Martelo', 'Ferramenta manual para pregar e remover pregos', 80.00, 50, 1);
INSERT INTO tb_produtos (nome, descricao, valor, quantidade, id_categoria) VALUES ('Parafusadeira', 'Ferramenta para apertar e soltar parafusos', 150.00, 30, 1);
INSERT INTO tb_produtos (nome, descricao, valor, quantidade, id_categoria) VALUES ('Cimento', 'Saco de cimento para construção', 25.00, 100, 2);
INSERT INTO tb_produtos (nome, descricao, valor, quantidade, id_categoria) VALUES ('Areia', 'Areia fina para construção civil', 70.00, 200, 2);
INSERT INTO tb_produtos (nome, descricao, valor, quantidade, id_categoria) VALUES ('Torneira', 'Torneira para pia de cozinha', 120.00, 40, 3);
INSERT INTO tb_produtos (nome, descricao, valor, quantidade, id_categoria) VALUES ('Cano PVC', 'Cano de PVC para instalações hidráulicas', 50.00, 150, 3);
INSERT INTO tb_produtos (nome, descricao, valor, quantidade, id_categoria) VALUES ('Fio Elétrico', 'Fio elétrico para instalações residenciais', 90.00, 100, 4);
INSERT INTO tb_produtos (nome, descricao, valor, quantidade, id_categoria) VALUES ('Tinta Látex', 'Tinta para pintura interna', 130.00, 60, 5);

SELECT * FROM tb_produtos;

-- Faça um SELECT que retorna todos os produtos cujo valor seja maior do que R$ 100,00
SELECT nome, descricao, valor, quantidade FROM tb_produtos WHERE valor > 100.00;

-- Faça um SELECT que retorna todos os produtos cujo valor esteja no intervalo R$ 70,00 e R$ 150,00
SELECT nome, descricao, valor, quantidade FROM tb_produtos WHERE valor BETWEEN 70.00 AND 150.00;

-- Faça um SELECT utilizando o operador LIKE, buscando todos os produtos que possuam a letra C no atributo nome
SELECT nome, descricao, valor, quantidade FROM tb_produtos WHERE nome LIKE '%C%';

-- Faça um SELECT utilizando INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias
SELECT p.nome AS produto, p.valor, c.nome AS categoria 
FROM tb_produtos AS p
INNER JOIN tb_categorias AS c 
ON p.id_categoria = c.id;

-- Faça um SELECT utilizando INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias, filtrando por uma categoria específica (produtos hidráulicos)
SELECT p.nome AS produto, p.valor, c.nome AS categoria 
FROM tb_produtos AS p
INNER JOIN tb_categorias AS c 
ON p.id_categoria = c.id
WHERE c.nome IN ('Hidráulica');
