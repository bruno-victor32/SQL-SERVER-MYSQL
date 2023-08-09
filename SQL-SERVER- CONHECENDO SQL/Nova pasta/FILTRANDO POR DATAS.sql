/*Quando aplicamos maior, menor, maior igual, menor igual ou diferente, sobre textos, 
respeitamos a ordem alfab�tica e quando aplicamos sobre datas, respeitamos a ordem do calend�rio.*/

USE SUCOS_VENDAS;

SELECT * FROM [TABELA DE CLIENTES];

SELECT * FROM [TABELA DE CLIENTES] WHERE [DATA DE NASCIMENTO] = '1995-09-11';

/*Estamos fazendo uma consulta, para descobrir quem nasceu depois da data de 11/09/1995
Com isso, visualizaremos todas as pessoas que nasceram depois do dia 11 de setembro de 1995.*/
SELECT * FROM [TABELA DE CLIENTES] WHERE [DATA DE NASCIMENTO] > '1995-09-11';

/*Estamos fazendo uma consulta, para descobrir quem nasceu antes da data de 11/09/1995
Com isso, visualizaremos todas as pessoas que nasceram antes do dia 11 de setembro de 1995.
Nosso resultado s� tem datas menores que 11 de setembro de 1995. */
SELECT * FROM [TABELA DE CLIENTES] WHERE [DATA DE NASCIMENTO] < '1995-09-11';

/*Estamos fazendo uma consulta, para descobrir  todas as pessoas que nasceram em 1995*/ 

SELECT * FROM [TABELA DE CLIENTES] WHERE year ([DATA DE NASCIMENTO])= 1995;

/*N�s selecionamos os campos "Nome", "Estado", "Data de Nascimento" e o ano da "Data de nascimento". Por fim,
apelidamos o campo " Data de nascimento" de "Ano"*/
SELECT [NOME], [ESTADO], [DATA DE NASCIMENTO], YEAR ([DATA DE NASCIMENTO]) AS ANO FROM [TABELA DE CLIENTES];

/*N�s selecionamos os campos "Nome", "Estado", "Data de Nascimento",ano da "Data de nascimento",m�s da "Data de nascimento" e o dia da "Data de nascimento" . Por fim,
apelidamos o campo " Data de nascimento" de "Ano", M�s e dia*/
SELECT [NOME], [ESTADO], [DATA DE NASCIMENTO]
, YEAR ([DATA DE NASCIMENTO]) AS ANO
, MONTH ([DATA DE NASCIMENTO]) AS MES
, DAY ([DATA DE NASCIMENTO]) AS DIA
FROM [TABELA DE CLIENTES];

/*Para visualizar todas as pessoas que nasceram em setembro, ou seja, m�s 9, fizemos a seguinte consulta*/
SELECT [NOME], [ESTADO], [DATA DE NASCIMENTO]
, YEAR ([DATA DE NASCIMENTO]) AS ANO
, MONTH ([DATA DE NASCIMENTO]) AS MES
, DAY ([DATA DE NASCIMENTO]) AS DIA
FROM [TABELA DE CLIENTES]
WHERE MONTH ([DATA DE NASCIMENTO]) = 9;
