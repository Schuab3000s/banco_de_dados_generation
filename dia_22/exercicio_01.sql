CREATE DATABASE IF NOT EXISTS db_generation_games_online;
USE db_generation_games_online;

CREATE TABLE IF NOT EXISTS tb_classes(
id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
classe VARCHAR(25),
MP INT
);

CREATE TABLE IF NOT EXISTS tb_personagens(
id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50),
idade INT,
raça VARCHAR(25),
atk INT,
def INT,
id_classe BIGINT,
FOREIGN KEY (id_classe) REFERENCES tb_classes (id)
);

INSERT INTO tb_classes(classe, MP)
VALUES('Ladino', 60),
('Mago', 150),
('Guerreiro', 50),
('Clérigo', 120),
('Bardo', 100),
('Druida', 140);

INSERT INTO tb_personagens(nome, idade, raça, id_classe, atk, def)
VALUES('Elowen',115,'Elfa',6, 3000,2500),
('Nivek',28,'Humano',1, 3200, 1800),
('Tharok',34,'Orc',3,4000, 4800),
('Alaric',40,'Humano',4, 2800, 3600),
('Seraphine',27,'Tiefling',2, 4500, 1500),
('Fendrel',23,'Halfing',5, 2500, 2700),
('Kael',37,'Anão',3, 3800, 4600),
('Liora',70,'Elfa',4, 2700, 3400);

SELECT * FROM tb_personagens;

-- Faça um SELECT que retorne todes os personagens cujo poder de ataque seja maior do que 2000.

SELECT nome, raça, atk, def FROM tb_personagens 
WHERE atk > 2000
ORDER BY atk;

-- Faça um SELECT que retorne todes os personagens cujo poder de defesa esteja no intervalo 1000 e 2000.

SELECT nome, raça, atk, def FROM tb_personagens 
WHERE def > 1000 AND def < 2000
ORDER BY atk;

-- Faça um SELECT utilizando o operador LIKE, buscando todes os personagens que possuam a letra C no atributo nome.

SELECT nome, raça, atk, def FROM tb_personagens 
WHERE nome LIKE '%C%';

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes.

SELECT p.nome, p.raça, p.atk, p.def, c.classe, c.mp
FROM tb_personagens AS p 
INNER JOIN tb_classes AS c
ON p.id_classe = c.id;

/* Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes, 
onde traga apenas os personagens que pertençam a uma classe específica (Exemplo: Todes os personagens da classe dos arqueiros).*/

SELECT p.nome, p.raça, p.atk, p.def, c.classe, c.mp
FROM tb_personagens AS p 
INNER JOIN tb_classes AS c
ON p.id_classe = c.id
WHERE c.classe = 'Guerreiro';