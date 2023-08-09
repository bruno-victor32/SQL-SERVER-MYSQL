USE SUCOS_VENDAS;

SELECT * FROM TABELA_DE_VENDEDORES;

/*Visualize a tabela [TABELA DE VENDEDORES] mostrando o campo MATRICULA com o alias IDENTIFICADOR e o campo NOME com o alias NOME DO VENDEDOR*/
SELECT MATRICULA AS IDENTIFICADOR, NOME AS NOME_DO_VENDEDOR
FROM TABELA_DE_VENDEDORES;

/*Visualize a tabela [TABELA DE VENDEDORES] mostrando o campo MATRICULA com o alias IDENTIFICADOR e o campo NOME com o alias NOME DO VENDEDOR, mas apenas os que atuam em S�o Paulo.*/
SELECT MATRICULA AS IDENTIFICADOR, NOME AS NOME_DO_VENDEDOR
FROM TABELA_DE_VENDEDORES WHERE CIDADE = 'S�o Paulo';

/*Para os vendedores que possuem dependentes aumente em 1 ponto percentual suas comiss�es.*/
UPDATE TABELA_DE_VENDEDORES SET PERCENTUAL_COMISS�O = PERCENTUAL_COMISS�O + 0.01 WHERE TEM_DEPENDENTE = 1 ;

/*Mostre os vendedores que possuem comiss�o abaixo de 8%.*/
SELECT * FROM TABELA_DE_VENDEDORES WHERE PERCENTUAL_COMISS�O < 0.08;

/*Liste os vendedores que foram admitidos em 2020 e antes destes ano.*/
SELECT * FROM TABELA_DE_VENDEDORES
WHERE YEAR (DATA_INICIO) <= 2020;

/*Liste os vendedores que possuem dependentes e que estejam atuando na cidade do Rio de Janeiro.*/
SELECT * FROM TABELA_DE_VENDEDORES WHERE TEM_DEPENDENTE = 1 AND CIDADE = 'Rio de Janeiro';

