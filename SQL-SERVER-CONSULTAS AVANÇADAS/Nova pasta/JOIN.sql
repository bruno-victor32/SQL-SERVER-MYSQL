/*JOIN "JUN��O"
Os INNER JOIN t�m mais performance quando eu tenho �ndices nos campos 
que eu estou juntando.
E quando eu tenho uma chave estrangeira, esse �ndice j� � naturalmente criado pelo banco de dados.
Ent�o inner joins entre chaves estrangeiras t�m mais performance, por�m eu posso fazer inner joins 
entre dois campos que n�o t�m uma chave estrangeira, desde que sejam campos com o mesmo conte�do e do mesmo tipo.
*/
USE SUCOS_FRUTAS;

SELECT * FROM TABELA_DE_VENDEDORES;

SELECT * FROM NOTAS_FISCAIS;

-- Si eu estou usando COUNT, estou usando uma fun��o de agrupamento ent�o tem que colocar o Group By
-- Contando quantas matriculas temos, ou seja, contar quantas notas fiscais cada vendedor vendeu
SELECT MATRICULA, COUNT(*) AS NUMERO_DE_VENDAS FROM NOTAS_FISCAIS GROUP BY MATRICULA;

/*Quero que mostre na tela o campo matricula dos vendedores da tabela notas fiscais
  Quero que mostre na tela o campo nome dos vendedores  da tabela de vendedores
  e quero que contabilize quantas vendas cada vendedor fez*/
SELECT NOTAS_FISCAIS.MATRICULA, TABELA_DE_VENDEDORES.NOME, COUNT(*) AS NUMERO_DE_VENDAS
FROM NOTAS_FISCAIS
INNER JOIN TABELA_DE_VENDEDORES
ON NOTAS_FISCAIS.MATRICULA = TABELA_DE_VENDEDORES.MATRICULA
GROUP BY NOTAS_FISCAIS.MATRICULA, TABELA_DE_VENDEDORES.NOME;

--Fazendo a mesma consulta acima, mas utilizando o Alias/Apelido
SELECT NF.MATRICULA, TV.NOME, COUNT(*) AS NUMERO_DE_VENDAS
FROM NOTAS_FISCAIS AS NF
INNER JOIN TABELA_DE_VENDEDORES AS TV
ON NF.MATRICULA = TV.MATRICULA
GROUP BY NF.MATRICULA, TV.NOME;

--Posso inverter as ordens da tabela
SELECT NF.MATRICULA, TV.NOME, COUNT(*) AS NUMERO_DE_VENDAS
FROM TABELA_DE_VENDEDORES  AS TV
INNER JOIN  NOTAS_FISCAIS AS NF
ON NF.MATRICULA = TV.MATRICULA
GROUP BY NF.MATRICULA, TV.NOME;
