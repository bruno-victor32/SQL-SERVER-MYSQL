/*Comando para consultar uma tabela do banco de dados
Nesse caso quero visualizar todos os campos do jeito que est�o declarados na tabela*/
SELECT * FROM [TABELA DE PRODUTOS];


SELECT [CPF], [NOME], [ENDERECO1], [ENDERECO2], [BAIRRO], [CIDADE], [ESTADO], [CEP], [DATA DE NASCIMENTO], [IDADE], [GENERO], [LIMITE DE CREDITO], [PRIMEIRA COMPRA]
FROM [TABELA DE CLIENTES]; 

/*Quero que mostre na tela somente o campo/coluna "nome" e "cpf"*/
SELECT [NOME], [CPF]
FROM [TABELA DE CLIENTES];

/*Tamb�m podemos criar um alias, ou seja, um apelido. O alias � um nome fantasia que daremos para a coluna. Por exemplo, ap�s [NOME], podemos escrever AS NOME_DO_CLIENTE, nesse caso "NOME_DO_CLIENTE" e o alias/apelido.*/
SELECT [NOME] AS NOME_DO_CLIENTE, [CPF]
FROM [TABELA DE CLIENTES]; 

SELECT [NOME] AS NOME_DO_CLIENTE, [CPF] AS IDENTIFICADOR
FROM [TABELA DE CLIENTES]; 

