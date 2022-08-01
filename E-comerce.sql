CREATE DATABASE bd_ecomerce;

USE bd_ecomerce;

CREATE TABLE tb_usuarios (
	Id_usuarios INT NOT NULL PRIMARY KEY,
	Nome VARCHAR(255) NOT NULL,
	Usuario VARCHAR(255) NOT NULL,
	Senha VARCHAR(255) NOT NULL,
	Documento VARCHAR(255) NOT NULL,
	Endereco VARCHAR(255) NULL,
);

CREATE TABLE tb_produtos (
	Id_produtos INT NOT NULL PRIMARY KEY,
	Produto VARCHAR(255) NOT NULL,
	Descricao VARCHAR(255) NOT NULL,
	Valor FLOAT NOT NULL,
	Quantidade_Estoque INT NULL,
);

CREATE TABLE tb_compras (
	Id_compras INT NOT NULL,
	FK_Usuario INT NOT NULL,
	FOREIGN KEY (FK_Usuario) REFERENCES tb_usuarios (Id_usuarios),
	FK_Produto INT NOT NULL,
	FOREIGN KEY (FK_Produto) REFERENCES tb_produtos (Id_produtos),
	Datas DATE,
	Quantidade_Produtos_Comprados INT NULL,
	Endereco VARCHAR(255) NULL,
);

INSERT INTO tb_usuarios
VALUES 
(1, 'Henrique', 'HenriqueM', '12345', '123.456.789.10', 'Rua SQL Server'),
(7, 'Carol', 'CarolA', '54321', '987.654.321.01', 'Rua MySQL')

SELECT * FROM tb_usuarios;

INSERT INTO tb_produtos
VALUES 
(75, 'Suco', 'Bebida sem alcool', 1.00, 350),
(38, 'Macarrão', 'Comida de massa', 8.70, 120);

SELECT * FROM tb_produtos;

SELECT Produto, Descricao FROM tb_produtos;

SELECT * FROM tb_produtos
WHERE Descricao LIKE 'Co%';


INSERT INTO tb_compras
VALUES 
(1, 1, 75, '2022-07-29', '12', ' Rua Mercado do Suco'),
(10, 7, 38, '2022-07-29', '3', ' Rua Mercado de Massas');

SELECT * FROM tb_compras;


SELECT 
	u.Nome AS Nomes,
	c.Quantidade_Produtos_Comprados AS QntProdutos,
	p.Produto AS 'Nome do Produto'
FROM tb_usuarios AS u -- Esquerda de tb_compras
INNER JOIN  tb_compras c -- A Direita de tb_usuario e a Esquerda de produtos
	ON u.Id_usuarios = c.Id_compras 
INNER JOIN tb_produtos AS p -- Direita de compras
	ON p.Id_produtos = c.FK_Produto
WHERE c.Quantidade_Produtos_Comprados LIKE '%%';

SELECT 
	u.Nome AS Nomes,
	COUNT(*) AS 'Quantidade de Clientes que Compraram'
FROM tb_usuarios AS u
INNER JOIN tb_compras AS c
	ON u.Id_usuarios = c.FK_Usuario
GROUP BY u.Nome

