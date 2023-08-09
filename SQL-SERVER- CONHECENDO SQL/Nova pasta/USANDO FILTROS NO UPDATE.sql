USE SUCOS_VENDAS;

SELECT * FROM [TABELA DE PRODUTOS] WHERE [EMBALAGEM] = 'Lata'; 

/*Vamos supor que o executivo da empresa pediu que fiz�ssemos um reajuste
de dez por cento em todos os produtos de lata, porque o custo do alum�nio 
aumentou. Isto �, a lata ficou mais cara e por isso precisamos aumentar o
pre�o desses produtos.

Para isso, podemos usar o UPDATE, j� que ele altera um valor existente.*/

/*Para aumentar os pre�os dos produtos em 10%, ser� necessario multiplicar os valores do do campo "preco de lista" por 1.1
Podemos fazer o aumento de pre�o dos produtos, um por um dessa forma abaixo
Nesse caso abaixo estou modificando o valor do produto de c�digo 544931*/
UPDATE [TABELA DE PRODUTOS] SET [PRECO DE LISTA] = 4.555 * 1.1 WHERE [CODIGO DO PRODUTO] = '544931';

/*Aumentando o pre�o de todos os produtos de uma vez somente
Aumentando em dez por cento o pre�o de lista de todos os produtos com embalagem de lata. Usando apenas um comando. */
UPDATE [TABELA DE PRODUTOS] SET [PRECO DE LISTA] = [PRECO DE LISTA] * 1.1 WHERE [EMBALAGEM] = 'Lata' ;


