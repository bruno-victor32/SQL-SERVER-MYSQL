/*
O SELECT DISTINCT instru��o � usada para retornar apenas valores distintos (diferentes).

Dentro de uma tabela, uma coluna geralmente cont�m muitos valores duplicados; 
e �s vezes voc� deseja apenas listar os valores diferentes (distintos).

Trata-se de uma cl�usula para eliminar repeti��es em consultas
*/

USE SUCOS_FRUTAS;

SELECT * FROM TABELA_DE_PRODUTOS;

/*Essa consulta vai retornar o campo embalagem da tabela de produtos*/
SELECT EMBALAGEM FROM TABELA_DE_PRODUTOS;

/*Saber quantas embalagens diferentes tem meus produtos*/
SELECT DISTINCT EMBALAGEM FROM TABELA_DE_PRODUTOS;

/*Vai retornar todos os tipos de embalagens que o produto de sabor ma�a tem */
SELECT DISTINCT EMBALAGEM FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Maca';


SELECT DISTINCT EMBALAGEM, SABOR FROM TABELA_DE_PRODUTOS;

/* Executando uma consulta para obter o n�mero de sabores existentes*/
SELECT DISTINCT SABOR FROM TABELA_DE_PRODUTOS;