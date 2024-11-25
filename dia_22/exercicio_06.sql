CREATE DATABASE IF NOT EXISTS db_curso_da_minha_vida;
USE db_curso_da_minha_vida;

CREATE TABLE IF NOT EXISTS tb_categorias (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    descricao VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS tb_cursos (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    descricao VARCHAR(100),
    valor DECIMAL(10, 2),
    carga_horaria INT,
    id_categoria BIGINT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome, descricao) 
VALUES ('Programação', 'Cursos de desenvolvimento e programação de software'),
('Design', 'Cursos relacionados a design gráfico e interfaces'),
('Marketing', 'Cursos sobre estratégias de marketing e vendas'),
('Finanças', 'Cursos sobre gestão financeira e investimentos'),
('Idiomas', 'Cursos de aprendizado de línguas estrangeiras');

INSERT INTO tb_cursos (nome, descricao, valor, carga_horaria, id_categoria) 
VALUES ('Java para Iniciantes', 'Curso básico de programação em Java', 600.00, 40, 1),
('Web Design Responsivo', 'Curso de design para web com foco em responsividade', 500.00, 30, 2),
('SEO Avançado', 'Curso de otimização de sites para mecanismos de busca', 700.00, 25, 3),
('Investimentos para Iniciantes', 'Curso sobre fundamentos de investimentos', 800.00, 20, 4),
('Inglês Básico', 'Curso básico de inglês para iniciantes', 400.00, 50, 5),
('JavaScript Avançado', 'Curso avançado de programação em JavaScript', 900.00, 35, 1),
('Adobe Illustrator', 'Curso sobre uso do Adobe Illustrator para design gráfico', 650.00, 30, 2),
('Marketing Digital Completo', 'Curso completo sobre estratégias de marketing digital', 1000.00, 40, 3);

SELECT * FROM tb_cursos;

-- Faça um SELECT que retorna todos os cursos cujo valor seja maior do que R$ 500,00
SELECT nome, descricao, valor, carga_horaria FROM tb_cursos WHERE valor > 500.00;

-- Faça um SELECT que retorna todos os cursos cujo valor esteja no intervalo R$ 600,00 e R$ 1000,00
SELECT nome, descricao, valor, carga_horaria FROM tb_cursos WHERE valor BETWEEN 600.00 AND 1000.00;

-- Faça um SELECT utilizando o operador LIKE, buscando todos os cursos que possuam a letra J no atributo nome
SELECT nome, descricao, valor, carga_horaria FROM tb_cursos WHERE nome LIKE '%J%';

-- Faça um SELECT utilizando INNER JOIN, unindo os dados da tabela tb_cursos com os dados da tabela tb_categorias
SELECT c.nome AS curso, c.valor, cat.nome AS categoria 
FROM tb_cursos AS c
INNER JOIN tb_categorias AS cat 
ON c.id_categoria = cat.id;

-- Faça um SELECT utilizando INNER JOIN, unindo os dados da tabela tb_cursos com os dados da tabela tb_categorias, filtrando por uma categoria específica (cursos de Java)
SELECT c.nome AS curso, c.valor, cat.nome AS categoria 
FROM tb_cursos AS c
INNER JOIN tb_categorias AS cat 
ON c.id_categoria = cat.id
WHERE cat.nome IN ('Programação');
