USE SUCOS_VENDAS;

SELECT * FROM TABELA_DE_PRODUTOS;

/*Fazendo a alteração do "preco de lista" do produto " "Frescor do Verão - 350 ml - Limão" que 
atualmente 2,46, mas sofrerá uma alteração e passará para 3.*/

/*Utilizando o comando dessa forma abaixo,ele não identificará a linha e mudará todos os preços de lista para 3. Precisamos criar um filtro.*/
UPDATE TABELA_DE_PRODUTOS
SET PRECO_DE_LISTA = 3;

/*Para que não sejá alterado o valor do produto no campo "preco de lista" de todos os produtos,
criei um filtro "WHERE" que utilizei para identificar o produto o campo "CODIGO_DO_PRODUTO"*/

UPDATE TABELA_DE_PRODUTOS
SET PRECO_DE_LISTA = 7.00
WHERE CODIGO_DO_PRODUTO = '544931';

/*Vamos fazer outras modificações, desta vez, no produto da linha 5: "Linha Citros - 1 Litro - Limão". A embalagem mudará de "PET" para "Lata" e o preço mudará de 7.00 para 7.50*/
UPDATE TABELA_DE_PRODUTOS 
SET	PRECO_DE_LISTA = 7.50, 
	EMBALAGEM = 'Garrafa'
WHERE CODIGO_DO_PRODUTO = '1088126';



SELECT * FROM TABELA_DE_VENDEDORES;

UPDATE TABELA_DE_VENDEDORES
SET PERCENTUAL_COMISSAO = 0.11
WHERE MATRICULA = '00235';

UPDATE TABELA_DE_VENDEDORES
SET NOME = 'Cláudia Morais Sousa'
WHERE MATRICULA = '00236';

