--WHERE  e como si fosse um filtro*/

/*Fazendo uma consulta e utilizando o filtro para que retorne somente o produto de codigo 290478*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE CODIGO_DO_PRODUTO = 290478;

/*Vai retornar somente os produtos que tem o sabor de laranja*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Laranja';

/*Consulta que vai retornar os produtos que a embalagem seja do tipo PET*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE EMBALAGEM = 'PET';