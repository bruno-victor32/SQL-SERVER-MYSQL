USE SUCOS_VENDAS;

SELECT * FROM [TABELA DE PRODUTOS];

/*para excluir determinado produto da tabela, usamos o comando "delete" e,
para identificar o produto que desej�vamos pegar, usamos o comando "where". Por exemplo:*/

DELETE FROM [TABELA DE PRODUTOS] WHERE [CODIGO DO PRODUTO] = 1000889; 

/*O WHERE e um filtro que permite nesse caso s� deletar o produto que tem o codigo 1000889*/

/*Nessa consulta abaixo, vai retornar todos os campos, mas somente do produto de c�digo 1002334*/
SELECT * FROM [TABELA DE PRODUTOS] WHERE [CODIGO DO PRODUTO] = 1002334;

/*Fazendo uma consulta para visualizar todos os produtos que tem sabor de "Laranja"*/
SELECT * FROM [TABELA DE PRODUTOS] WHERE SABOR = 'Laranja';

/*Fazendo uma consulta para visualizar todos os produtos que tem sabor de "Lim�o"*/
SELECT * FROM [TABELA DE PRODUTOS] WHERE SABOR = 'Lim�o';

/*Deletando todos os produtos que tem sabor de "Lim�o"*/
DELETE FROM [TABELA DE PRODUTOS] WHERE SABOR = 'Lim�o';


