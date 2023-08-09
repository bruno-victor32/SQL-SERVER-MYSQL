-- ASC ASCENDENTE -   vai vir do menor para o maior
-- Quando eu estiver ordenando textos, menor para maior seria no sentido alfabético das letras, começando no A, terminando no Z.
-- Por padrão quando não colocamos "ASC" ou "DESC", significa que vai ser ASC

-- DESC DESCENDENTE - vai vir do maior para o menor
-- Quando eu estiver ordenando textos,maior para o menor começa no Z e termina no A

USE SUCOS_FRUTAS;

SELECT * FROM TABELA_DE_PRODUTOS;

/*Estou fazendo uma consulta que vai ser ordenada pelo preço do produto, como
não coloquei "Asc" ou "Desc", por padrão a consulta vai ser Asc, ou seja,
do menor preço para o maior preço*/
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY PRECO_DE_LISTA;

/*Estou fazendo uma consulta que vai ser ordenada pelo preço do produto, como
coloquei "Asc" a consulta vai ser do menor preço para o maior preço*/
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY PRECO_DE_LISTA ASC;

/*Estou fazendo uma consulta que vai ser ordenada pelo preço do produto, como
coloquei "Desc" a consulta vai ser do produto de maior preço para o menor preço*/
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY PRECO_DE_LISTA DESC;

/*Estou fazendo uma consulta que vai ser ordenada pelo nome do produto de forma descendente "Desc", e como o
campo que vou ordenar e do tipo texto vai ser do Z até o A*/
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY NOME_DO_PRODUTO DESC;

/*Estou fazendo uma consulta que vai ser ordenada pelo nome do produto de forma ascendente "ASC", e como o
campo que vou ordenar e do tipo texto vai ser do A até o Z,ou seja, no sentido alfabético das letras*/
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY NOME_DO_PRODUTO ;

/*Essa consulta terá o mesmo resultado da consulta de cima, porque mesmo
que não colocamos ASC, por padrão a consulta sempre será do
maior para o menor ou do sentido alfabetico das letras*/
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY NOME_DO_PRODUTO ASC;

/*Essa consulta vai ser da seguinte maneira.
Estou ordenando primeiro por embalagem de forma Ascendente,
nesse caso vai retornar primeiro os produtos que tiverem embalagem
do tipo "Garrafa" em seguida do tipo "Lata" e por ultimo "PET" porque
estou ordenando no sentido alfabetico das letras.
Dentro dos produtos que tem as embalagens do tipo Garrafa vou ordenar o 
nome deles de forma alfabetica ou seja do A ao Z
*/
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY EMBALAGEM, NOME_DO_PRODUTO;


/*Estou ordenando tanto as embalagens dos produtos do Z ate A,
quanto o nome do produto do Z ao A
Para ver o resultado inverso da consulta acima*/
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY EMBALAGEM DESC, NOME_DO_PRODUTO DESC;

/*Quero fazer uma consulta para saber os 5 produtos mais caros dentro dos produtos oferecidos pela empresa de suco de frutas.*/
SELECT TOP 5 * FROM TABELA_DE_PRODUTOS ORDER BY PRECO_DE_LISTA DESC;

/*Quero fazer uma consulta para saber os 5 produtos mais baratos dentro dos produtos oferecidos pela empresa de suco de frutas.*/
SELECT TOP 5 * FROM TABELA_DE_PRODUTOS ORDER BY PRECO_DE_LISTA ASC;


/*Desafio
Qual foi a maior venda do produto "Linha Refrescante - 1 Litro - Morango/Limao" em quantidade?*/
--1º Passo:buscar o código do produto "Linha Refrescante - 1 Litro - Morango/Limão":
SELECT * FROM TABELA_DE_PRODUTOS WHERE NOME_DO_PRODUTO = 'Linha Refrescante - 1 Litro - Morango/Limao';

--Com a consulta acima obtemos o resultado do código deste produto: '1101035'. Com esta informação em mãos, fazemos a consulta para achar a maior quantidade vendida deste produto:
SELECT * FROM ITENS_NOTAS_FISCAIS
WHERE CODIGO_DO_PRODUTO = 1101035 ORDER BY QUANTIDADE DESC;

--Constatou que a maior quantidade foi 99

-- Pergunto: Quantas vendas foram feitas com quantidade igual a 99 litros para o produto '1101035'?
SELECT COUNT(*) FROM ITENS_NOTAS_FISCAIS WHERE CODIGO_DO_PRODUTO = '1101035' AND QUANTIDADE = 99;

/*O total foi de 79.

Portanto, essa foi a quantidade de vendas feitas para o produto 1101035.*/

SELECT CODIGO_DO_PRODUTO FROM ITENS_NOTAS_FISCAIS;

--Verifique as quantidades totais de vendas de cada produto e ordene do maior para o menor.
-- Para obter o resultado esperado, nós podemos realizar uma consulta na tabela de itens notas fiscais, utilizando a função de agregação SUM para somar a quantidade e ordenar a saída utilizando o GROUP BY:
SELECT CODIGO_DO_PRODUTO, SUM(QUANTIDADE) AS SOMA_DAS_QUANTIDADES FROM ITENS_NOTAS_FISCAIS
 GROUP BY CODIGO_DO_PRODUTO 
 ORDER BY SUM(QUANTIDADE);

 --Agora, liste somente os produtos que venderam mais que 394000 unidades.
SELECT CODIGO_DO_PRODUTO, SUM(QUANTIDADE) AS SOMA_DAS_QUANTIDADES FROM ITENS_NOTAS_FISCAIS
GROUP BY CODIGO_DO_PRODUTO  HAVING SUM(QUANTIDADE) > 394000
ORDER BY SUM(QUANTIDADE) DESC;



