/*Criando tabela de produtos
-- C�digo do produto
-- Nome do produto
-- Embalagem
-- Tamanho
-- Sabor
-- Pre�o de lista
*/

USE  SUCOS_VENDAS;

CREATE TABLE TABELA_DE_PRODUTOS(
CODIGO_DO_PRODUTO VARCHAR (20),
NOME_DO_PRODUTO VARCHAR (150),
EMBALAGEM VARCHAR (50),
TAMANHO VARCHAR (50),
SABOR VARCHAR (50),
PRECO_DE_LISTA SMALLMONEY
);