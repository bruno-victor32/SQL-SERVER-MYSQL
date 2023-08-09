/*
ESTRUTURA DE CLASSIFICAÇÃO

CASE WHEN <CONDIÇÃO> THEN <VALOR>
     WHEN <CONDIÇÃO> THEN <VALOR>
     WHEN <CONDIÇÃO> THEN <VALOR>
     ELSE <VALOR> END

Eu coloco CASE WHEN, uma condição lógica, 
que eu posso usar as mesmas coisas que eu 
utilizo lá no where, então eu posso colocar
várias condições lógicas entre and, entre or,
not, maior, menor, igual e assim por diante

 O else é: se nenhuma condição for satisfeita, 
 esse vai ser o valor final.

 WHEN = QUANDO
 THEN = ENTAO
 ELSE = SENÃO
*/

USE SUCOS_FRUTAS;

/*Quero que mostre na tela somente os produtos que sejam do sabor de Manga*/
SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA FROM TABELA_DE_PRODUTOS
WHERE SABOR = 'Manga';

/*Quero que mostre na tela somente os produtos que sejam do sabor de Manga
Quando o preco do produto for maior/igual a 12 então será considerado um produto caro
Quando o preco do produto for maior/igual a 7 e menor que 12 então será considerado um produto em conta
Se o produto não for "PRODUTO CARO" ou " PRODUTO EM CONTA" ele será um "PRODUTO BARATO"*/
SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
(CASE WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
	  WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
      ELSE 'PRODUTO BARATO' END) AS CLASSIFICACAO
FROM TABELA_DE_PRODUTOS
WHERE SABOR = 'Manga'
ORDER BY CLASSIFICACAO;

/*Quero que mostre na tela todos os produtos e 
quando o preco do produto for maior/igual a 12 então será considerado um produto caro
Quando o preco do produto for maior/igual a 7 e menor que 12 então será considerado um produto em conta
Se o produto não for "PRODUTO CARO" ou " PRODUTO EM CONTA" ele será um "PRODUTO BARATO"*/
SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
(CASE WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
	  WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
      ELSE 'PRODUTO BARATO' END) AS CLASSIFICACAO
FROM TABELA_DE_PRODUTOS
ORDER BY CLASSIFICACAO;  -- aqui esta sendo ordenado de forma alfabetica, estou utilizando o alias

/*Estou contando quantos produtos baratos, caros e em conta eu tenho*/
SELECT 
(CASE WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
	  WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
      ELSE 'PRODUTO BARATO' END) AS CLASSIFICACAO, COUNT(*) AS NUMERO_DE_PRODUTOS
FROM TABELA_DE_PRODUTOS
GROUP BY (CASE WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
	  WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
      ELSE 'PRODUTO BARATO' END);

-- O GROUP BY não aceita Alias

--DESAFIO
/*
Para cada cliente temos seus limites de crédito
mensais. Liste somente o nome dos clientes e os
classifique por:

Acima ou igual a 150.000 - Clientes grandes
Entre 150.000 e 110.000 - Clientes médios
Menores que 110.000 Clientes pequenos
*/

SELECT * FROM TABELA_DE_CLIENTES;

SELECT CPF, NOME, LIMITE_DE_CREDITO,
(CASE WHEN LIMITE_DE_CREDITO >= 150000 THEN 'CLIENTE GRANDE'
      WHEN LIMITE_DE_CREDITO >= 110000 AND LIMITE_DE_CREDITO < 150000 THEN 'CLIENTE MÉDIO'
	  ELSE 'CLIENTE PEQUENO' END) AS CLASSIFICACAO_DO_CLIENTE
FROM TABELA_DE_CLIENTES
ORDER BY LIMITE_DE_CREDITO DESC;
