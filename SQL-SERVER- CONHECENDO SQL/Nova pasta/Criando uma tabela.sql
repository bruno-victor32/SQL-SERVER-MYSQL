USE SUCOS_VENDAS;

-- Informações que precisam constar na nossa tabela
-- CPF do cliente "O cpf sempre vai ocupar 11 digitos" 
-- O nome completo do cliente
-- Endereço com Rua, bairro, cidade, estado e CEP
-- Data de nascimento
-- A idade
-- Gênero
-- O limite do crédito do cliente para ele comprar produtos na empresa
-- O volume mínimo de produtos que ele pode comprar
-- Se ele já realizou a primeira compra

--OBSERVAÇÕES

/*CPF do Cliente -- O cpf sempre vai ocupar 11 digitos
É comum, no entanto, que CPFs iniciem com o numeral 0, por isso, se colocamos 01, 
a leitura é 1. Para evitar esse problema, teríamos que colocá-lo como caracter, '01',
mantendo, assim, o 0 inicial. Pensando nesta problemática, é necessário que coloquemos o
campo CPF como texto, e não como número*/

/*Lembre-se que, diferente do CHAR, o tipo VARCHAR não completa os caracteres 
restantes com espaços em branco.*/

/*Faremos primeiro dois campos de "endereço", um para o nome da rua e outro para o complemento*/

/*O CEP, por sua vez, é um número de 8 dígitos, embora pudesse ser 9 caso quiséssemos considerar 
o traço, mas optaremos pelo tamanho (8). Como há CEPs que iniciam em 0, o definiremos como [CHAR], assim como no CPF*/

/*O limite de crédito refere-se a valores monetários e não requer um tamanho, então será do tipo [MONEY]*/

/*O último campo, que chamamremos de [PRIMEIRA COMPRA], quer saber se o cliente já realizou alguma compra, então trata-se
de um campo lógico que definiremos como do tipo [BIT].*/


/*Podemos fazer a criação da tabela dessa maneira
CREATE TABLE [TABELA DE CLIENTES](
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
*/



CREATE TABLE TABELA_DE_CLIENTES(
CPF CHAR (11),
NOME VARCHAR (100),
ENDERECO1 VARCHAR (150),
ENDERECO2 VARCHAR (150),
BAIRRO VARCHAR (50),
CIDADE VARCHAR (50),
ESTADO CHAR (2),
CEP CHAR (8),
DATA_DE_NASCIMENTO DATE,
IDADE SMALLINT,
GENERO CHAR (1),
LIMITE_DE_CREDITO MONEY,
VOLUME_DE_COMPRA FLOAT,
PRIMEIRA_COMPRA BIT
);

