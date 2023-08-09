USE SUCOS_VENDAS;

-- Informa��es que precisam constar na nossa tabela
-- CPF do cliente "O cpf sempre vai ocupar 11 digitos" 
-- O nome completo do cliente
-- Endere�o com Rua, bairro, cidade, estado e CEP
-- Data de nascimento
-- A idade
-- G�nero
-- O limite do cr�dito do cliente para ele comprar produtos na empresa
-- O volume m�nimo de produtos que ele pode comprar
-- Se ele j� realizou a primeira compra

--OBSERVA��ES

/*CPF do Cliente -- O cpf sempre vai ocupar 11 digitos
� comum, no entanto, que CPFs iniciem com o numeral 0, por isso, se colocamos 01, 
a leitura � 1. Para evitar esse problema, ter�amos que coloc�-lo como caracter, '01',
mantendo, assim, o 0 inicial. Pensando nesta problem�tica, � necess�rio que coloquemos o
campo CPF como texto, e n�o como n�mero*/

/*Lembre-se que, diferente do CHAR, o tipo VARCHAR n�o completa os caracteres 
restantes com espa�os em branco.*/

/*Faremos primeiro dois campos de "endere�o", um para o nome da rua e outro para o complemento*/

/*O CEP, por sua vez, � um n�mero de 8 d�gitos, embora pudesse ser 9 caso quis�ssemos considerar 
o tra�o, mas optaremos pelo tamanho (8). Como h� CEPs que iniciam em 0, o definiremos como [CHAR], assim como no CPF*/

/*O limite de cr�dito refere-se a valores monet�rios e n�o requer um tamanho, ent�o ser� do tipo [MONEY]*/

/*O �ltimo campo, que chamamremos de [PRIMEIRA COMPRA], quer saber se o cliente j� realizou alguma compra, ent�o trata-se
de um campo l�gico que definiremos como do tipo [BIT].*/


/*Podemos fazer a cria��o da tabela dessa maneira
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

