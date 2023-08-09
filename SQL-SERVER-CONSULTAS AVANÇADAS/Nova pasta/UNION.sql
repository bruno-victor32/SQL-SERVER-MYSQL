-- Union   Union All
Use SUCOS_FRUTAS;

/*Consulta para verificar quantos bairros tem relação com os clientes*/
SELECT DISTINCT BAIRRO FROM TABELA_DE_CLIENTES;

/*Consulta para verificar quantos bairros tem relação com os vendedores*/
SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES;


--Union permite fazer consultas
SELECT DISTINCT BAIRRO FROM TABELA_DE_CLIENTES
UNION
SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES;

--Essa consulta e a mesma da de cima como si fosse um distinct
--Ele não vai mostrar nada repetido
SELECT BAIRRO FROM TABELA_DE_CLIENTES
UNION
SELECT BAIRRO FROM TABELA_DE_VENDEDORES;

-- Union All não aplica o distinct sobre o resultado,
--O resultado final vai vim com dados repetidos
SELECT BAIRRO FROM TABELA_DE_CLIENTES
UNION ALL
SELECT BAIRRO FROM TABELA_DE_VENDEDORES;

--Nesse caso estou dizendo a origem desse dado
SELECT DISTINCT BAIRRO, 'CLIENTE' AS ORIGEM FROM TABELA_DE_CLIENTES --Aqui estou colocando uma constante que vai aparecer em cada linha
UNION ALL
SELECT DISTINCT BAIRRO, 'FORNECEDOR' AS ORIGEM FROM TABELA_DE_VENDEDORES;

SELECT DISTINCT BAIRRO, 'CLIENTE' AS ORIGEM FROM TABELA_DE_CLIENTES --Aqui estou colocando uma constante que vai aparecer em cada linha
UNION 
SELECT DISTINCT BAIRRO, 'FORNECEDOR' AS ORIGEM FROM TABELA_DE_VENDEDORES;