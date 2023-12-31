/*Comando que permite se conectar a esse banco*/
USE SUCOS_VENDAS;


CREATE TABLE [TABELA DE CLIENTES2]
    (
    [CPF] [CHAR] (11),
    [NOME] [VARCHAR] (100),
    [ENDERECO1] [VARCHAR] (150),
    [ENDERECO2] [VARCHAR] (150),
    [BAIRRO] [VARCHAR] (50),
    [CIDADE] [VARCHAR] (50),
    [ESTADO] [CHAR] (2),
    [CEP] [CHAR] (8),
    [DATA DE NASCIMENTO] [DATE],
    [IDADE] [SMALLINT],
    [GENERO] [CHAR] (1),
    [LIMITE DE CREDITO] [MONEY],
    [VOLUME DE COMPRA] [FLOAT],
    [PRIMEIRA COMPRA] [BIT]
    );


    CREATE TABLE [TABELA DE CLIENTES3]
    (
    [CPF] [CHAR] (11),
    [NOME] [VARCHAR] (100),
    [ENDERECO1] [VARCHAR] (150),
    [ENDERECO2] [VARCHAR] (150),
    [BAIRRO] [VARCHAR] (50),
    [CIDADE] [VARCHAR] (50),
    [ESTADO] [CHAR] (2),
    [CEP] [CHAR] (8),
    [DATA DE NASCIMENTO] [DATE],
    [IDADE] [SMALLINT],
    [GENERO] [CHAR] (1),
    [LIMITE DE CREDITO] [MONEY],
    [VOLUME DE COMPRA] [FLOAT],
    [PRIMEIRA COMPRA] [BIT]
    );


    CREATE TABLE [TABELA DE CLIENTES4]
    (
    [CPF] [CHAR] (11),
    [NOME] [VARCHAR] (100),
    [ENDERECO1] [VARCHAR] (150),
    [ENDERECO2] [VARCHAR] (150),
    [BAIRRO] [VARCHAR] (50),
    [CIDADE] [VARCHAR] (50),
    [ESTADO] [CHAR] (2),
    [CEP] [CHAR] (8),
    [DATA DE NASCIMENTO] [DATE],
    [IDADE] [SMALLINT],
    [GENERO] [CHAR] (1),
    [LIMITE DE CREDITO] [MONEY],
    [VOLUME DE COMPRA] [FLOAT],
    [PRIMEIRA COMPRA] [BIT]
    );

/*Comando para excluir uma tabela*/
DROP TABLE [TABELA DE CLIENTES2];

DROP TABLE [TABELA DE CLIENTES4];