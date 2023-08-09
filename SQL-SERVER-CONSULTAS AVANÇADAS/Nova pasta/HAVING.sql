USE SUCOS_FRUTAS;

SELECT * FROM TABELA_DE_CLIENTES;

--Quero listar os estado e saber a soma do limite de credito de todos os clientes de cada estado
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS SOMA_DO_LIMITE_DE_CREDITO
FROM TABELA_DE_CLIENTES GROUP BY ESTADO;

-- Quero listar os estados cuja a soma do limite de credito e maior que 900 000 
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS SOMA_LIMITE_DE_CREDITO
FROM TABELA_DE_CLIENTES
GROUP BY ESTADO
HAVING SUM(LIMITE_DE_CREDITO) >= 900000;

-- Na tabela de produtos quero ver o maior preco e o menor preco de todos os produtos por tipo de embalagem
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO, MIN(PRECO_DE_LISTA) AS MENOR_PRECO
FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM;

SELECT * FROM TABELA_DE_PRODUTOS;

-- Na tabela de produtos quero ver o maior preco e o menor preco dos produtos por tipo de embalagem e que o preço seja maior/igual a 10
SELECT EMBALAGEM,  MAX(PRECO_DE_LISTA) AS MAIOR_PRECO , MIN(PRECO_DE_LISTA) AS MENOR_PRECO  
FROM TABELA_DE_PRODUTOS WHERE PRECO_DE_LISTA >= 10 GROUP BY EMBALAGEM;

-- Na tabela de produtos quero ver o maior preco e o menor preco dos produtos por tipo de embalagem e que o preço seja menor/igual a 5
SELECT EMBALAGEM,  MAX(PRECO_DE_LISTA) AS MAIOR_PRECO , MIN(PRECO_DE_LISTA) AS MENOR_PRECO  
FROM TABELA_DE_PRODUTOS WHERE PRECO_DE_LISTA <= 5 GROUP BY EMBALAGEM;

--Nesta consulta somente quero os produtos que possuem o maior preço de lista mais do que 20 unidade monetária, 
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAXIMO_PRECO , MIN(PRECO_DE_LISTA) AS MENOR_PRECO  
FROM TABELA_DE_PRODUTOS WHERE PRECO_DE_LISTA >= 10 
GROUP BY EMBALAGEM HAVING MAX(PRECO_DE_LISTA) >=20;

