/*
SINAIS
> MAIOR
< MENOR
<> DIFERENTE
>= MAIOR OU IGUAL
<= MENOR OU IGUAL
*/

USE SUCOS_VENDAS

SELECT * FROM [TABELA DE PRODUTOS];

/*Se quisermos saber qual é o produto com preço de lista igual a 7,336*/
SELECT * FROM [TABELA DE PRODUTOS] WHERE [PRECO DE LISTA] = 7.336;

/*Saber quais produtos custam mais que 7.336*/
SELECT * FROM [TABELA DE PRODUTOS] WHERE [PRECO DE LISTA] > 7.336;

/*Saber quais produtos custam menos que 7.336*/
SELECT * FROM [TABELA DE PRODUTOS] WHERE [PRECO DE LISTA] < 7.336;

/*Com a consulta abaixo , veremos todos os produtos que não custam 7,336*/
SELECT * FROM [TABELA DE PRODUTOS] WHERE [PRECO DE LISTA] <> 7.004;

/*Com a consulta abaixo, vamos visualizar todos os produtos que custam mais que 7,336, incluindo os produtos que custam 7,336.*/
SELECT * FROM [TABELA DE PRODUTOS] WHERE [PRECO DE LISTA] >= 7.336;

/*Com a consulta abaixo, vamos visualizar todos os produtos que custam menos que 7,336, incluindo os produtos que custam 7,336.*/
SELECT * FROM [TABELA DE PRODUTOS] WHERE [PRECO DE LISTA] <= 7.336;