--GROUP BY - agrupar os resultados da saída da consulta.
-- SUM - Soma
-- AVG - Média
-- MAX - Máximo
-- MIN - Mínimo

USE SUCOS_FRUTAS

SELECT * FROM TABELA_DE_CLIENTES;

SELECT CIDADE, IDADE FROM TABELA_DE_CLIENTES ORDER BY CIDADE, IDADE;

/*Dentro do GROUP BY, o campo que está sendo somado não entra, só vai 
entrar aqui depois do group by os campos que são critérios de junção, de soma das linhas.
Nessa consulta abaixo quero saber a soma das idades dos clientes que moram 
em cada cidade*/
SELECT CIDADE, SUM(IDADE) AS SOMA_DAS_IDADE FROM TABELA_DE_CLIENTES GROUP BY CIDADE;

/*Nessa consulta abaixo quero saber a soma das idades e a soma dos limites de credito dos clientes que moram 
em cada cidade*/
SELECT CIDADE, SUM(IDADE) AS SOMA_IDADE, SUM(LIMITE_DE_CREDITO)  AS SOMA_DO_LIMITE_DE_CREDITO
FROM TABELA_DE_CLIENTES GROUP BY CIDADE;

/*Quero ver a media das idades dos clientes de cada cidade e a soma dos limites de creditos dos clientes de cada estado
Nesse caso a média de idade é 21 anos no Rio de Janeiro
e a media de idade e 27 em São Paulo*/
SELECT CIDADE, AVG(IDADE) AS MEDIA_DAS_IDADES, SUM(LIMITE_DE_CREDITO) AS SOMA_DOS_LIMITES_DE_CREDITO 
FROM TABELA_DE_CLIENTES GROUP BY CIDADE;

/*Contador de Linhas - Permite eu contar o número de clientes
que existem em uma cidade*/
SELECT CIDADE, COUNT(*) AS NUMERO_DE_CLIENTES FROM TABELA_DE_CLIENTES GROUP BY CIDADE;

/*Estou contando o numero de produtos  por embalagem, somente do sabor laranja*/
SELECT EMBALAGEM, COUNT(*) AS NUMERO_DE_PRODUTOS FROM TABELA_DE_PRODUTOS
WHERE SABOR = 'Laranja' GROUP BY EMBALAGEM;

