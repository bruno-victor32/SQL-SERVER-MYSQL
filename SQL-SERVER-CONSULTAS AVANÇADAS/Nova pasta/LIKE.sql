USE SUCOS_FRUTAS;

--Vamos selecionar dois sabores específicos da nossa tabela de produtos:
SELECT * FROM TABELA_DE_PRODUTOS 
WHERE SABOR IN ('Lima/Limao', 'Morango/Limao');

-- Eu podia fazer essa mesma consulta acima da seguinte maneira:
--Vai retornar todos os produtos que tenham sabores que terminam com a palavra limão
SELECT  * FROM TABELA_DE_PRODUTOS 
WHERE SABOR LIKE '%Limao';

/*Estou fazendo uma consulta que retorne todos os produtos de sabores que terminem com a palavra Maca*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR LIKE '%Maca';

/*Estou fazendo uma consulta que retorne todos os produtos de sabores que iniciem com a palavra Morango*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR LIKE 'Morango%';

/*Estou fazendo uma consulta que retorne todos os produtos de sabores que iniciem com a palavra Morango e que sejam do tamanho PET*/
SELECT * FROM TABELA_DE_PRODUTOS 
WHERE (SABOR LIKE 'Morango%') AND (EMBALAGEM = 'PET');

--consulta que diga quantos clientes possuem o sobrenome Silva.
--Para mim não importa o nome que vem antes de 'Silva' e nem o nome que vem depois de 'Silva'
select * from TABELA_DE_CLIENTES where  NOME LIKE '%Silva%';