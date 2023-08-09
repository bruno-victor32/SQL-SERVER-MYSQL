-- O comando TOP mostra os primeiros registros de uma tabela.

-- O comando TOP  limita sempre, mostrando as primeiras linhas daquela seleção que você está aplicando.
USE SUCOS_FRUTAS;

SELECT * FROM TABELA_DE_CLIENTES;

/*Dessa maneira vai mostrar na tela os 4 primeiros clientes */
SELECT TOP 4 * FROM TABELA_DE_CLIENTES;

SELECT * FROM TABELA_DE_PRODUTOS;

/*Quero que mostre na tela somente os 5 primeiros produtos que estão cadastrados na tabela de produtos*/
SELECT TOP 5 * FROM TABELA_DE_PRODUTOS;

/*Quero que mostre na tela somente os 2 primeiros produtos que estão cadastrados na tabela de produtos e que sejam do sabor Maça*/
SELECT TOP 2 * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Maca';

SELECT * FROM NOTAS_FISCAIS;

/*Listando as 10 primeiras vendas do dia 01/10/2017*/
SELECT TOP 10 * FROM NOTAS_FISCAIS WHERE DATA_VENDA = '2017-10-01';

