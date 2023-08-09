-- Sub Query pode ser usada como se fosse uma tabela
-- Neste caso é obrigatório usar um ALIAS para a SubQuery

USE SUCOS_FRUTAS;

/*Consulta que vai retornar todos os bairros da tabela de vendedores,não vai repetir bairro*/
SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES;

SELECT BAIRRO FROM TABELA_DE_VENDEDORES;