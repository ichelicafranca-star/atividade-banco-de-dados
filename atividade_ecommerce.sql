-- ==========================================
-- 1. DDL: Criação do Esquema (Tabelas)
-- ==========================================

-- Tabela de categorias dos itens/pets
CREATE TABLE categorias (
    id_categoria INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_categoria TEXT NOT NULL UNIQUE
);

-- Tabela de produtos/serviços da lojinha pet
CREATE TABLE produtos (
    id_produto INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_produto TEXT NOT NULL,
    preco REAL NOT NULL CHECK (preco > 0),
    estoque INTEGER NOT NULL,
    id_categoria INTEGER,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);


-- ==========================================
-- 2. DML: Carga de Dados, Atualização e Deleção
-- ==========================================

-- Inserindo 3 categorias
INSERT INTO categorias (nome_categoria) VALUES ('Acessórios');
INSERT INTO categorias (nome_categoria) VALUES ('Ração e Petiscos');
INSERT INTO categorias (nome_categoria) VALUES ('Brinquedos');

-- Inserindo 5 produtos
INSERT INTO produtos (nome_produto, preco, estoque, id_categoria) 
VALUES ('Coleira Ajustável', 45.90, 15, 1);

INSERT INTO produtos (nome_produto, preco, estoque, id_categoria) 
VALUES ('Ração Premium 10kg', 120.00, 8, 2);

INSERT INTO produtos (nome_produto, preco, estoque, id_categoria) 
VALUES ('Bolinha Mordedora', 25.00, 30, 3);

INSERT INTO produtos (nome_produto, preco, estoque, id_categoria) 
VALUES ('Arranhador para Gatos', 149.90, 4, 1);

INSERT INTO produtos (nome_produto, preco, estoque, id_categoria) 
VALUES ('Petisco Natural de Frango', 18.50, 50, 2);

-- Atualizando o preço de um produto (Ex: Aumentando o estoque ou ajustando a Ração Premium)
UPDATE produtos 
SET preco = 125.50 
WHERE id_produto = 2;

-- Deletando um produto que saiu de linha (Ex: A Bolinha Mordedora)
DELETE FROM produtos 
WHERE id_produto = 3;


-- ==========================================
-- 3. DQL: Filtros e Exibição
-- ==========================================

-- Consultar produtos com preço >= 50 ordenados do mais caro para o mais barato
SELECT nome_produto, preco, estoque 
FROM produtos 
WHERE preco >= 50 
ORDER BY preco DESC;


-- ==========================================
-- 4. Abstração: Criação de VIEW
-- ==========================================

-- Criar uma VIEW com produtos promocionais (preço < 100.0) e que tenham estoque disponível (> 0)
CREATE VIEW vw_produtos_promocao AS
SELECT nome_produto, preco, estoque 
FROM produtos 
WHERE preco < 100.0 
  AND estoque > 0;

-- Para testar e visualizar a View criada, basta rodar:
SELECT * FROM vw_produtos_promocao;