							--CRIANDO UM BANCO DE DADOS
CREATE DATABASE SUCOS_VENDAS_01;

CREATE DATABASE SUCOS_VENDAS_02
ON (NAME = 'SUCOS_VENDAS.DAT',
        FILENAME = 'C:\TEMP2\SUCOS_VENDAS_02.MDF',
        SIZE = 10MB,
        MAXSIZE = 50MB,
        FILEGROWTH = 5MB)
LOG ON
(NAME = 'SUCOS_VENDAS.LOG',
        FILENAME = 'C:\TEMP2\SUCOS_VENDAS_02.LDF',
        SIZE = 10MB,
        MAXSIZE = 50MB,
        FILEGROWTH = 5MB);

						/*APAGANDO UM BANCO DE DADOS*/
DROP DATABASE [SUSCOS_VENDAS_01];

						--CRIANDO UMA TABELA
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
campo CPF como texto, e n�o como n�mero

Lembre-se que, diferente do CHAR, o tipo VARCHAR n�o completa os caracteres 
restantes com espa�os em branco.

Faremos primeiro dois campos de "endere�o", um para o nome da rua e outro para o complemento

O CEP, por sua vez, � um n�mero de 8 d�gitos, embora pudesse ser 9 caso quis�ssemos considerar 
o tra�o, mas optaremos pelo tamanho (8). Como h� CEPs que iniciam em 0, o definiremos como [CHAR], assim como no CPF

O limite de cr�dito refere-se a valores monet�rios e n�o requer um tamanho, ent�o ser� do tipo [MONEY]

O �ltimo campo, que chamamremos de [PRIMEIRA COMPRA], quer saber se o cliente j� realizou alguma compra, ent�o trata-se
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

						/*CRIANDO A TABELA DE PRODUTOS
-- C�digo do produto
-- Nome do produto
-- Embalagem
-- Tamanho
-- Sabor
-- Pre�o de lista
*/

USE  SUCOS_VENDAS;

CREATE TABLE TABELA_DE_PRODUTOS(
CODIGO_DO_PRODUTO VARCHAR (20),
NOME_DO_PRODUTO VARCHAR (150),
EMBALAGEM VARCHAR (50),
TAMANHO VARCHAR (50),
SABOR VARCHAR (50),
PRECO_DE_LISTA SMALLMONEY
);

						--CRIANDO A TABELA DE VENDEDORES
USE SUCOS_VENDAS;

CREATE TABLE TABELA_DE_VENDEDORES(
MATRICULA CHAR(5),
NOME VARCHAR(100),
PERCENTUAL_COMISSAO FLOAT
);


USE SUCOS_VENDAS;

SELECT * FROM TABELA_DE_CLIENTES;

/*Alterar a coluna "CPF" para que ela n�o aceite nulos.*/
ALTER TABLE TABELA_DE_CLIENTES ALTER COLUMN CPF CHAR(11) NOT NULL; 

/*Criar a chave prim�ria.*/
ALTER TABLE TABELA_DE_CLIENTES ADD CONSTRAINT PK_TABELA_DE_CLIENTES
PRIMARY KEY CLUSTERED (CPF);

/*Incluindo dados na tabela. N�o colocaremos o nome dos campos, n�s adicionaremos os dados na mesma ordem em que os campos est�o declarados. */
INSERT INTO TABELA_DE_CLIENTES
VALUES 
    ('00384393431', 'Jo�o da Silva', 'Rua Projetada A1', 'Numero 233', 'Copacabana', 'Rio de janeiro', 'RJ', '20000000', '1965-03-21', 57, 'M', 20000, 30000.30, 1);



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

						--APAGANDO UMA TABELA

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

					--INSERINDO DADOS NA TABELA
USE SUCOS_VENDAS;

INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA)
VALUES
('1040107', 'Light - 350 ml - Mel�ncia', 'Lata', '350 ml', 'Mel�ncia', 4.56 );

INSERT INTO TABELA_DE_VENDEDORES (MATRICULA, NOME, PERCENTUAL_COMISSAO)
VALUES
('00235','M�rcio Almeida Silva',0.08);

/*Precisamos lembrar que o campo de comiss�o est� no valor float, portanto, 
� relevante colocarmos 0.08 pois ali representaria a porcentagem (8%). Pensando
em decimal, 1.00 seria 100%, por isso 0.08 � o valor que queremos para a comiss�o.*/


INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA)
VALUES
('1037797', 'Clean - 2 litros - Laranja', 'PET', '2 Litros', 'Laranja', 16.01 );
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA)
VALUES
('1000889', 'Sabor da Montanha - 700 ml - Uva', 'Garrafa', '700 ml', 'Uva', 6.31 );

SELECT*FROM TABELA_DE_PRODUTOS;

/*Quando as ordem dos campos for respeitada, n�o � preciso declar�-los no comando, podendo ficar desta forma:
Isso significa que que cada valor corresponde, respectivamente, a determinado campo da tabela*/
INSERT INTO TABELA_DE_PRODUTOS
VALUES
('1004327','Videira do Cmapo - 1,5 Litros - Mel�ncia','PET','1,5 Litros','Mel�ncia',19.51);

/*Esse INSERT acima e a mesma coisa que esse insert a seguir*/
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA)
VALUES
('1004327','Videira do Cmapo - 1,5 Litros - Mel�ncia','PET','1,5 Litros','Mel�ncia',19.51);


/*Esse INSERT abaixo, no campo "PRECO_DE_LISTA" inserimos somente 7 ao inv�s de 7.00, ainda assim
n�o teve problema devido o tipo desse campo ser "smallmoney", ou seja, possui casas decimais.*/
INSERT INTO TABELA_DE_PRODUTOS
   VALUES
   ('1088126','Linha Citros - 1 Litro - Lim�o','PET','1 Litro','Lim�o',7);


 /*Dessa maneira abaixo estamos inserindo duas linhas na tabela ao mesmo tempo*/
 INSERT INTO TABELA_DE_PRODUTOS
   VALUES
   ('1088126','Linha Citros - 1 Litro - Lim�o','PET','1 Litro','Lim�o',7),
    ('544931','Frescor do Ver�o - 350 ml - Lim�o','Lata','350 ml','Lim�o',2.46);


INSERT INTO TABELA_DE_VENDEDORES (MATRICULA, NOME, PERCENTUAL_COMISSAO)
VALUES
('00236', 'Cl�udia Morais', 0.08),
('00237', 'Marcela Ferreira', 0.09);

SELECT * FROM TABELA_DE_VENDEDORES;

				-- INCLUINDO VENDEDORES NA TABELA DE VENDEDORES
USE SUCOS_VENDAS

INSERT INTO TABELA_DE_VENDEDORES
(NOME,MATRICULA,CIDADE,PERCENTUAL_COMISS�O,DATA_INICIO,TEM_DEPENDENTE)
VALUES
('Jo�o da Silva','00241','S�o Paulo',0.06,'2022-12-01','TRUE'),
('Carolina Soares','00242','Rio de Janeiro',0.07,'2020-03-13','TRUE'),
('Juliana Marques','00243','S�o Paulo',0.09,'2018-11-14','FALSE'),
('Pedro Gomes','00244','S�o Paulo',0.08,'2019-01-20','FALSE'),
('Christina Rodrigues','00245','Rio de Janeiro',0.07,'2021-02-13','TRUE');

SELECT*FROM TABELA_DE_VENDEDORES;

					--INCLUINDO DADOS NA TABELA DE PRODUTOS DE CLIENTES

USE [SUCOS_VENDAS]

/*DROP TABLE [dbo].[TABELA DE CLIENTES]*/

CREATE TABLE [dbo].[TABELA DE CLIENTES](
	[CPF] [varchar](11) NOT NULL,
	[NOME] [varchar](100) NULL,
	[ENDERECO1] [varchar](150) NULL,
	[ENDERECO2] [varchar](150) NULL,
	[BAIRRO] [varchar](50) NULL,
	[CIDADE] [varchar](50) NULL,
	[ESTADO] [varchar](2) NULL,
	[CEP] [varchar](8) NULL,
	[DATA DE NASCIMENTO] [date] NULL,
	[IDADE] [smallint] NULL,
	[GENERO] [varchar](1) NULL,
	[LIMITE DE CREDITO] [money] NULL,
	[VOLUME DE COMPRA] [float] NULL,
	[PRIMEIRA COMPRA] [bit] NULL,
 CONSTRAINT [PK_CLIENTES] PRIMARY KEY CLUSTERED 
(
	[CPF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT INTO [dbo].[TABELA DE CLIENTES] ([CPF],[NOME],[ENDERECO1],[ENDERECO2],[BAIRRO],[CIDADE],[ESTADO],[CEP],[DATA DE NASCIMENTO],[IDADE],[GENERO],[LIMITE DE CREDITO],[VOLUME DE COMPRA],[PRIMEIRA COMPRA]) VALUES ('19290992743','Fernando Cavalcante','R. Dois de Fevereiro','','�gua Santa','Rio de Janeiro','RJ','22000000','2000-02-12',18,'M',100000,200000,1)
INSERT INTO [dbo].[TABELA DE CLIENTES] ([CPF],[NOME],[ENDERECO1],[ENDERECO2],[BAIRRO],[CIDADE],[ESTADO],[CEP],[DATA DE NASCIMENTO],[IDADE],[GENERO],[LIMITE DE CREDITO],[VOLUME DE COMPRA],[PRIMEIRA COMPRA]) VALUES ('2600586709','C�sar Teixeira','Rua Conde de Bonfim','','Tijuca','Rio de Janeiro','RJ','22020001','2000-03-12',18,'M',120000,220000,0)
INSERT INTO [dbo].[TABELA DE CLIENTES] ([CPF],[NOME],[ENDERECO1],[ENDERECO2],[BAIRRO],[CIDADE],[ESTADO],[CEP],[DATA DE NASCIMENTO],[IDADE],[GENERO],[LIMITE DE CREDITO],[VOLUME DE COMPRA],[PRIMEIRA COMPRA]) VALUES ('95939180787','F�bio Carvalho','R. dos Jacarand�s da Pen�nsula','','Barra da Tijuca','Rio de Janeiro','RJ','22002020','1992-01-05',16,'M',90000,180000,1)
INSERT INTO [dbo].[TABELA DE CLIENTES] ([CPF],[NOME],[ENDERECO1],[ENDERECO2],[BAIRRO],[CIDADE],[ESTADO],[CEP],[DATA DE NASCIMENTO],[IDADE],[GENERO],[LIMITE DE CREDITO],[VOLUME DE COMPRA],[PRIMEIRA COMPRA]) VALUES ('9283760794','Edson Meilelles','R. Pinto de Azevedo','','Cidade Nova','Rio de Janeiro','RJ','22002002','1995-10-07',22,'M',150000,250000,1)
INSERT INTO [dbo].[TABELA DE CLIENTES] ([CPF],[NOME],[ENDERECO1],[ENDERECO2],[BAIRRO],[CIDADE],[ESTADO],[CEP],[DATA DE NASCIMENTO],[IDADE],[GENERO],[LIMITE DE CREDITO],[VOLUME DE COMPRA],[PRIMEIRA COMPRA]) VALUES ('7771579779','Marcelo Mattos','R. Eduardo Lu�s Lopes','','Br�s','S�o Paulo','SP','88202912','1992-03-25',25,'M',120000,200000,1)
INSERT INTO [dbo].[TABELA DE CLIENTES] ([CPF],[NOME],[ENDERECO1],[ENDERECO2],[BAIRRO],[CIDADE],[ESTADO],[CEP],[DATA DE NASCIMENTO],[IDADE],[GENERO],[LIMITE DE CREDITO],[VOLUME DE COMPRA],[PRIMEIRA COMPRA]) VALUES ('5576228758','Petra Oliveira','R. Ben�cio de Abreu','','Lapa','S�o Paulo','SP','88192029','1995-11-14',22,'F',70000,160000,1)
INSERT INTO [dbo].[TABELA DE CLIENTES] ([CPF],[NOME],[ENDERECO1],[ENDERECO2],[BAIRRO],[CIDADE],[ESTADO],[CEP],[DATA DE NASCIMENTO],[IDADE],[GENERO],[LIMITE DE CREDITO],[VOLUME DE COMPRA],[PRIMEIRA COMPRA]) VALUES ('8502682733','Valdeci da Silva','R. Srg. �dison de Oliveira','','Jardins','S�o Paulo','SP','82122020','1995-10-07',22,'M',110000,190000,0)
INSERT INTO [dbo].[TABELA DE CLIENTES] ([CPF],[NOME],[ENDERECO1],[ENDERECO2],[BAIRRO],[CIDADE],[ESTADO],[CEP],[DATA DE NASCIMENTO],[IDADE],[GENERO],[LIMITE DE CREDITO],[VOLUME DE COMPRA],[PRIMEIRA COMPRA]) VALUES ('1471156710','�rica Carvalho','R. Iriquitia','','Jardins','S�o Paulo','SP','80012212','1990-09-01',27,'F',170000,245000,0)
INSERT INTO [dbo].[TABELA DE CLIENTES] ([CPF],[NOME],[ENDERECO1],[ENDERECO2],[BAIRRO],[CIDADE],[ESTADO],[CEP],[DATA DE NASCIMENTO],[IDADE],[GENERO],[LIMITE DE CREDITO],[VOLUME DE COMPRA],[PRIMEIRA COMPRA]) VALUES ('3623344710','Marcos Nougeuira','Av. Pastor Martin Luther King Junior','','Inhauma','Rio de Janeiro','RJ','22002012','1995-01-13',23,'M',110000,220000,1)
INSERT INTO [dbo].[TABELA DE CLIENTES] ([CPF],[NOME],[ENDERECO1],[ENDERECO2],[BAIRRO],[CIDADE],[ESTADO],[CEP],[DATA DE NASCIMENTO],[IDADE],[GENERO],[LIMITE DE CREDITO],[VOLUME DE COMPRA],[PRIMEIRA COMPRA]) VALUES ('50534475787','Abel Silva ','Rua Humait�','','Humait�','Rio de Janeiro','RJ','22000212','1995-09-11',22,'M',170000,260000,0)
INSERT INTO [dbo].[TABELA DE CLIENTES] ([CPF],[NOME],[ENDERECO1],[ENDERECO2],[BAIRRO],[CIDADE],[ESTADO],[CEP],[DATA DE NASCIMENTO],[IDADE],[GENERO],[LIMITE DE CREDITO],[VOLUME DE COMPRA],[PRIMEIRA COMPRA]) VALUES ('5840119709','Gabriel Araujo','R. Manuel de Oliveira','','Santo Amaro','S�o Paulo','SP','80010221','1985-03-16',32,'M',140000,210000,1)
INSERT INTO [dbo].[TABELA DE CLIENTES] ([CPF],[NOME],[ENDERECO1],[ENDERECO2],[BAIRRO],[CIDADE],[ESTADO],[CEP],[DATA DE NASCIMENTO],[IDADE],[GENERO],[LIMITE DE CREDITO],[VOLUME DE COMPRA],[PRIMEIRA COMPRA]) VALUES ('94387575700','Walber Lontra','R. Cel. Almeida','','Piedade','Rio de Janeiro','RJ','22000201','1989-06-20',28,'M',60000,120000,1)
INSERT INTO [dbo].[TABELA DE CLIENTES] ([CPF],[NOME],[ENDERECO1],[ENDERECO2],[BAIRRO],[CIDADE],[ESTADO],[CEP],[DATA DE NASCIMENTO],[IDADE],[GENERO],[LIMITE DE CREDITO],[VOLUME DE COMPRA],[PRIMEIRA COMPRA]) VALUES ('8719655770','Carlos Eduardo','Av. Gen. Guedes da Fontoura','','Jardins','S�o Paulo','SP','81192002','1983-12-20',34,'M',200000,240000,0)
INSERT INTO [dbo].[TABELA DE CLIENTES] ([CPF],[NOME],[ENDERECO1],[ENDERECO2],[BAIRRO],[CIDADE],[ESTADO],[CEP],[DATA DE NASCIMENTO],[IDADE],[GENERO],[LIMITE DE CREDITO],[VOLUME DE COMPRA],[PRIMEIRA COMPRA]) VALUES ('5648641702','Paulo C�sar Mattos','Rua H�lio Beltr�o','','Tijuca','Rio de Janeiro','RJ','21002020','1991-08-30',26,'M',120000,220000,0)
INSERT INTO [dbo].[TABELA DE CLIENTES] ([CPF],[NOME],[ENDERECO1],[ENDERECO2],[BAIRRO],[CIDADE],[ESTADO],[CEP],[DATA DE NASCIMENTO],[IDADE],[GENERO],[LIMITE DE CREDITO],[VOLUME DE COMPRA],[PRIMEIRA COMPRA]) VALUES ('492472718','Eduardo Jorge','R. Volta Grande','','Tijuca','Rio de Janeiro','RJ','22012002','1994-07-19',23,'M',75000,95000,1)

/*DROP TABLE [dbo].[TABELA DE PRODUTOS]*/

CREATE TABLE [dbo].[TABELA DE PRODUTOS](
	[CODIGO DO PRODUTO] [varchar](10) NOT NULL,
	[NOME DO PRODUTO] [varchar](50) NULL,
	[EMBALAGEM] [varchar](20) NULL,
	[TAMANHO] [varchar](10) NULL,
	[SABOR] [varchar](20) NULL,
	[PRECO DE LISTA] [smallmoney] NOT NULL,
 CONSTRAINT [PK_TABELA DE PRODUTOS] PRIMARY KEY CLUSTERED 
(
	[CODIGO DO PRODUTO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA]) VALUES ('1040107','Light - 350 ml - Mel�ncia','Lata','350 ml','Mel�ncia',4.555)
INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA]) VALUES ('1037797','Clean - 2 Litros - Laranja','PET','2 Litros','Laranja',16.008)
INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA]) VALUES ('1000889','Sabor da Montanha - 700 ml - Uva','Garrafa','700 ml','Uva',6.309)
INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA]) VALUES ('1004327','Videira do Campo - 1,5 Litros - Mel�ncia','PET','1,5 Litros','Mel�ncia',19.51)
INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA]) VALUES ('1088126','Linha Citros - 1 Litro - Lim�o','PET','1 Litro','Lim�o',7.004)
INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA]) VALUES ('544931','Frescor do Ver�o - 350 ml - Lim�o','Lata','350 ml','Lim�o',2.4595)
INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA]) VALUES ('1078680','Frescor do Ver�o - 470 ml - Manga','Garrafa','470 ml','Manga',5.1795)
INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA]) VALUES ('1042712','Linha Citros - 700 ml - Lim�o','Garrafa','700 ml','Lim�o',4.904)
INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA]) VALUES ('788975','Peda�os de Frutas - 1,5 Litros - Ma�a','PET','1,5 Litros','Ma�a',18.011)
INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA]) VALUES ('1002767','Videira do Campo - 700 ml - Cereja/Ma�a','Garrafa','700 ml','Cereja/Ma�a',8.41)
INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA]) VALUES ('231776','Festival de Sabores - 700 ml - A�ai','Garrafa','700 ml','A�ai',13.312)
INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA]) VALUES ('479745','Clean - 470 ml - Laranja','Garrafa','470 ml','Laranja',3.768)
INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA]) VALUES ('1051518','Frescor do Ver�o - 470 ml - Lim�o','Garrafa','470 ml','Lim�o',3.2995)
INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA]) VALUES ('1101035','Linha Refrescante - 1 Litro - Morango/Lim�o','PET','1 Litro','Morango/Lim�o',9.0105)
INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA]) VALUES ('229900','Peda�os de Frutas - 350 ml - Ma�a','Lata','350 ml','Ma�a',4.211)
INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA]) VALUES ('1086543','Linha Refrescante - 1 Litro - Manga','PET','1 Litro','Manga',11.0105)
INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA]) VALUES ('695594','Festival de Sabores - 1,5 Litros - A�ai','PET','1,5 Litros','A�ai',28.512)
INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA]) VALUES ('838819','Clean - 1,5 Litros - Laranja','PET','1,5 Litros','Laranja',12.008)
INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA]) VALUES ('326779','Linha Refrescante - 1,5 Litros - Manga','PET','1,5 Litros','Manga',16.5105)
INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA]) VALUES ('520380','Peda�os de Frutas - 1 Litro - Ma�a','PET','1 Litro','Ma�a',12.011)
INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA]) VALUES ('1041119','Linha Citros - 700 ml - Lima/Lim�o','Garrafa','700 ml','Lima/Lim�o',4.904)
INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA]) VALUES ('243083','Festival de Sabores - 1,5 Litros - Maracuj�','PET','1,5 Litros','Maracuj�',10.512)
INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA]) VALUES ('394479','Sabor da Montanha - 700 ml - Cereja','Garrafa','700 ml','Cereja',8.409)
INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA]) VALUES ('746596','Light - 1,5 Litros - Mel�ncia','PET','1,5 Litros','Mel�ncia',19.505)
INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA]) VALUES ('773912','Clean - 1 Litro - Laranja','PET','1 Litro','Laranja',8.008)
INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA]) VALUES ('826490','Linha Refrescante - 700 ml - Morango/Lim�o','Garrafa','700 ml','Morango/Lim�o',6.3105)
INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA]) VALUES ('723457','Festival de Sabores - 700 ml - Maracuj�','Garrafa','700 ml','Maracuj�',4.912)
INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA]) VALUES ('812829','Clean - 350 ml - Laranja','Lata','350 ml','Laranja',2.808)
INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA]) VALUES ('290478','Videira do Campo - 350 ml - Mel�ncia','Lata','350 ml','Mel�ncia',4.56)
INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA]) VALUES ('783663','Sabor da Montanha - 700 ml - Morango','Garrafa','700 ml','Morango',7.709)
INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA]) VALUES ('235653','Frescor do Ver�o - 350 ml - Manga','Lata','350 ml','Manga',3.8595)
INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA]) VALUES ('1002334','Linha Citros - 1 Litro - Lima/Lim�o','PET','1 Litro','Lima/Lim�o',7.004)
INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA]) VALUES ('1013793','Videira do Campo - 2 Litros - Cereja/Ma�a','PET','2 Litros','Cereja/Ma�a',24.01)
INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA]) VALUES ('1096818','Linha Refrescante - 700 ml - Manga','Garrafa','700 ml','Manga',7.7105)
INSERT INTO [TABELA DE PRODUTOS] ([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA]) VALUES ('1022450','Festival de Sabores - 2 Litros - A�ai','PET','2 Litros','A�ai',38.012)


						--EXCLUINDO DADOS NAS TABELAS
USE SUCOS_VENDAS;

SELECT * FROM TABELA_DE_PRODUTOS;
SELECT * FROM TABELA_DE_VENDEDORES;

/*Exluindo o produto 10088126 da linha 5*/
DELETE FROM TABELA_DE_PRODUTOS
WHERE CODIGO_DO_PRODUTO = '1088126';

/*Excluindo a vendedora de matricula 00236 que pediu demiss�o*/
DELETE FROM TABELA_DE_VENDEDORES
WHERE MATRICULA = '00236';


						--USANDO FILTROS NAS TABELAS

USE SUCOS_VENDAS;

SELECT * FROM [TABELA DE PRODUTOS];

/*para excluir determinado produto da tabela, usamos o comando "delete" e,
para identificar o produto que desej�vamos pegar, usamos o comando "where". Por exemplo:*/

DELETE FROM [TABELA DE PRODUTOS] WHERE [CODIGO DO PRODUTO] = 1000889; 

/*O WHERE e um filtro que permite nesse caso s� deletar o produto que tem o codigo 1000889*/

/*Nessa consulta abaixo, vai retornar todos os campos, mas somente do produto de c�digo 1002334*/
SELECT * FROM [TABELA DE PRODUTOS] WHERE [CODIGO DO PRODUTO] = 1002334;

/*Fazendo uma consulta para visualizar todos os produtos que tem sabor de "Laranja"*/
SELECT * FROM [TABELA DE PRODUTOS] WHERE SABOR = 'Laranja';

/*Fazendo uma consulta para visualizar todos os produtos que tem sabor de "Lim�o"*/
SELECT * FROM [TABELA DE PRODUTOS] WHERE SABOR = 'Lim�o';

/*Deletando todos os produtos que tem sabor de "Lim�o"*/
DELETE FROM [TABELA DE PRODUTOS] WHERE SABOR = 'Lim�o';

						--USANDO FILTROS NO UPDATE

USE SUCOS_VENDAS;

SELECT * FROM [TABELA DE PRODUTOS] WHERE [EMBALAGEM] = 'Lata'; 

/*Vamos supor que o executivo da empresa pediu que fiz�ssemos um reajuste
de dez por cento em todos os produtos de lata, porque o custo do alum�nio 
aumentou. Isto �, a lata ficou mais cara e por isso precisamos aumentar o
pre�o desses produtos.

Para isso, podemos usar o UPDATE, j� que ele altera um valor existente.*/

/*Para aumentar os pre�os dos produtos em 10%, ser� necessario multiplicar os valores do do campo "preco de lista" por 1.1
Podemos fazer o aumento de pre�o dos produtos, um por um dessa forma abaixo
Nesse caso abaixo estou modificando o valor do produto de c�digo 544931*/
UPDATE [TABELA DE PRODUTOS] SET [PRECO DE LISTA] = 4.555 * 1.1 WHERE [CODIGO DO PRODUTO] = '544931';

/*Aumentando o pre�o de todos os produtos de uma vez somente
Aumentando em dez por cento o pre�o de lista de todos os produtos com embalagem de lata. Usando apenas um comando. */
UPDATE [TABELA DE PRODUTOS] SET [PRECO DE LISTA] = [PRECO DE LISTA] * 1.1 WHERE [EMBALAGEM] = 'Lata' ;


								--FILTROS COMPOSTOS

/*Os "Filtros compostos" acontecem quando reunimos mais de uma condi��o no mesmo filtro, 
Por exemplo:
visualizar todas as pessoas que nasceram no ano de 1995 e moram no Rio de Janeiro.
Neste caso, vamos juntar condi��es e usar dois s�mbolos l�gicos: AND (E) e OR (OU).

As express�es com "AND" s� ser�o verdadeiras quando as duas condi��es s�o verdadeiras.

VERDADEIRO AND VERDADEIRO --> VERDADEIRA
FALSO      AND VERDADEIRO --> FALSA
VERDADEIRO AND FALSO --> FALSA 
FALSO      AND FALSO --> FALSA 

O "OR" � um pouco diferente: se uma das condi��es for verdadeira, a express�o � verdadeira.

VERDADEIRO OR VERDADEIRO --> VERDADEIRA
FALSO      OR VERDADEIRO --> VERDADEIRA
VERDADEIRO OR FALSO --> VERDADEIRA 
FALSO      OR FALSO --> FALSA 
*/

/*Realizar uma consulta para visualizar todos os campos da tabela de clientes referentes �s pessoas que nasceram no dia 12.*/
SELECT * FROM [TABELA DE CLIENTES] WHERE DAY ([DATA DE NASCIMENTO]) = 12

/*Realizar uma consulta para visualizar  todas as pessoas que nasceram no dia 12 "e"/AND moram no bairro da Tijuca.*/
SELECT * FROM [TABELA DE CLIENTES] WHERE DAY ([DATA DE NASCIMENTO]) =12 AND [BAIRRO] = 'Tijuca';

/*Realizar uma consulta para visualizar  todas as pessoas que moram no bairro da Tijuca "ou"/OR no bairro dos Jardins.*/
SELECT * FROM [TABELA DE CLIENTES] WHERE [BAIRRO] = 'Jardins' OR [BAIRRO] = 'Tijuca';


										--UTILIZANDO FILTRO MAIOR MENOR DIFERENTE

/*
SINAIS
> MAIOR
< MENOR
<> DIFERENTE
>= MAIOR OU IGUAL
<= MENOR OU IGUAL
*/

USE SUCOS_VENDAS

SELECT * FROM [TABELA DE PRODUTOS];

/*Se quisermos saber qual � o produto com pre�o de lista igual a 7,336*/
SELECT * FROM [TABELA DE PRODUTOS] WHERE [PRECO DE LISTA] = 7.336;

/*Saber quais produtos custam mais que 7.336*/
SELECT * FROM [TABELA DE PRODUTOS] WHERE [PRECO DE LISTA] > 7.336;

/*Saber quais produtos custam menos que 7.336*/
SELECT * FROM [TABELA DE PRODUTOS] WHERE [PRECO DE LISTA] < 7.336;

/*Com a consulta abaixo , veremos todos os produtos que n�o custam 7,336*/
SELECT * FROM [TABELA DE PRODUTOS] WHERE [PRECO DE LISTA] <> 7.004;

/*Com a consulta abaixo, vamos visualizar todos os produtos que custam mais que 7,336, incluindo os produtos que custam 7,336.*/
SELECT * FROM [TABELA DE PRODUTOS] WHERE [PRECO DE LISTA] >= 7.336;

/*Com a consulta abaixo, vamos visualizar todos os produtos que custam menos que 7,336, incluindo os produtos que custam 7,336.*/
SELECT * FROM [TABELA DE PRODUTOS] WHERE [PRECO DE LISTA] <= 7.336;


								--FILTRANDO POR DATAS

/*Quando aplicamos maior, menor, maior igual, menor igual ou diferente, sobre textos, 
respeitamos a ordem alfab�tica e quando aplicamos sobre datas, respeitamos a ordem do calend�rio.*/

USE SUCOS_VENDAS;

SELECT * FROM [TABELA DE CLIENTES];

SELECT * FROM [TABELA DE CLIENTES] WHERE [DATA DE NASCIMENTO] = '1995-09-11';

/*Estamos fazendo uma consulta, para descobrir quem nasceu depois da data de 11/09/1995
Com isso, visualizaremos todas as pessoas que nasceram depois do dia 11 de setembro de 1995.*/
SELECT * FROM [TABELA DE CLIENTES] WHERE [DATA DE NASCIMENTO] > '1995-09-11';

/*Estamos fazendo uma consulta, para descobrir quem nasceu antes da data de 11/09/1995
Com isso, visualizaremos todas as pessoas que nasceram antes do dia 11 de setembro de 1995.
Nosso resultado s� tem datas menores que 11 de setembro de 1995. */
SELECT * FROM [TABELA DE CLIENTES] WHERE [DATA DE NASCIMENTO] < '1995-09-11';

/*Estamos fazendo uma consulta, para descobrir  todas as pessoas que nasceram em 1995*/ 

SELECT * FROM [TABELA DE CLIENTES] WHERE year ([DATA DE NASCIMENTO])= 1995;

/*N�s selecionamos os campos "Nome", "Estado", "Data de Nascimento" e o ano da "Data de nascimento". Por fim,
apelidamos o campo " Data de nascimento" de "Ano"*/
SELECT [NOME], [ESTADO], [DATA DE NASCIMENTO], YEAR ([DATA DE NASCIMENTO]) AS ANO FROM [TABELA DE CLIENTES];

/*N�s selecionamos os campos "Nome", "Estado", "Data de Nascimento",ano da "Data de nascimento",m�s da "Data de nascimento" e o dia da "Data de nascimento" . Por fim,
apelidamos o campo " Data de nascimento" de "Ano", M�s e dia*/
SELECT [NOME], [ESTADO], [DATA DE NASCIMENTO]
, YEAR ([DATA DE NASCIMENTO]) AS ANO
, MONTH ([DATA DE NASCIMENTO]) AS MES
, DAY ([DATA DE NASCIMENTO]) AS DIA
FROM [TABELA DE CLIENTES];

/*Para visualizar todas as pessoas que nasceram em setembro, ou seja, m�s 9, fizemos a seguinte consulta*/
SELECT [NOME], [ESTADO], [DATA DE NASCIMENTO]
, YEAR ([DATA DE NASCIMENTO]) AS ANO
, MONTH ([DATA DE NASCIMENTO]) AS MES
, DAY ([DATA DE NASCIMENTO]) AS DIA
FROM [TABELA DE CLIENTES]
WHERE MONTH ([DATA DE NASCIMENTO]) = 9;


										--DELETANDO LINHAS DE UMA TABELA


SELECT * FROM TABELA_DE_PRODUTOS;

/*Deletando registros ou linhas de uma tabela*/
DELETE FROM TABELA_DE_PRODUTOS WHERE CODIGO_DO_PRODUTO = '1078680';


										--ALTERANDO DADOS EM UMA TABELA

USE SUCOS_VENDAS;

SELECT * FROM TABELA_DE_PRODUTOS;

/*Fazendo a altera��o do "preco de lista" do produto " "Frescor do Ver�o - 350 ml - Lim�o" que 
atualmente 2,46, mas sofrer� uma altera��o e passar� para 3.*/

/*Utilizando o comando dessa forma abaixo,ele n�o identificar� a linha e mudar� todos os pre�os de lista para 3. Precisamos criar um filtro.*/
UPDATE TABELA_DE_PRODUTOS
SET PRECO_DE_LISTA = 3;

/*Para que n�o sej� alterado o valor do produto no campo "preco de lista" de todos os produtos,
criei um filtro "WHERE" que utilizei para identificar o produto o campo "CODIGO_DO_PRODUTO"*/

UPDATE TABELA_DE_PRODUTOS
SET PRECO_DE_LISTA = 7.00
WHERE CODIGO_DO_PRODUTO = '544931';

/*Vamos fazer outras modifica��es, desta vez, no produto da linha 5: "Linha Citros - 1 Litro - Lim�o". A embalagem mudar� de "PET" para "Lata" e o pre�o mudar� de 7.00 para 7.50*/
UPDATE TABELA_DE_PRODUTOS 
SET	PRECO_DE_LISTA = 7.50, 
	EMBALAGEM = 'Garrafa'
WHERE CODIGO_DO_PRODUTO = '1088126';



SELECT * FROM TABELA_DE_VENDEDORES;

UPDATE TABELA_DE_VENDEDORES
SET PERCENTUAL_COMISSAO = 0.11
WHERE MATRICULA = '00235';

UPDATE TABELA_DE_VENDEDORES
SET NOME = 'Cl�udia Morais Sousa'
WHERE MATRICULA = '00236';



								--ALTERANDO O CAMPO COLUNA DE UMA TABELA


/*ALTER TABLE e o comando utilizado para alterar uma tabela ou para alterar um campo da tabela

ALTER TABLE [TABELA DE PRODUTOS] 

*/


/*PoderiamosPoder�amos usar ADD se quis�ssemos, por exemplo, adicionar uma nova coluna.

ALTER TABLE [TABELA DE PRODUTOS] ADD COLUMN

Por�m, a coluna CODIGO_DO_PRODUTO j� existe. Sendo assim, n�o usaremos ADD, mas ALTER, de "alterar".
*/


/*Descri��o do comando abaixo:
Alterar a coluna "tabela de produtos" modificando a coluna/campo "codigo do produto"
 para o tipo "varchar(20)" e que n�o aceite valores nulos*/
ALTER TABLE TABELA_DE_PRODUTOS ALTER COLUMN CODIGO_DO_PRODUTO VARCHAR(20) NOT NULL;



													---ALTERNATIVAS PARA O CAMPO L�GICO - BIT

SELECT * FROM TABELA_DE_CLIENTES;

INSERT INTO TABELA_DE_CLIENTES 
VALUES 
    ('00384393555', 'Maria Clara', 'Rua Projetada A1', 'Numero 233', 'Copacabana', 'Rio de janeiro', 'RJ', '20000000', '1975-03-21', 47, 'F', 20000, 30000.30, 'TRUE');

INSERT INTO TABELA_DE_CLIENTES  
VALUES 
    ('00384399999', 'Bruno da Silva', 'Rua Projetada 29', 'Numero 273', 'Caricica', 'Rio de janeiro', 'RJ', '20050000', '1975-03-21', 62, 'M', 30000, 40000.30, 1);

INSERT INTO TABELA_DE_CLIENTES
VALUES 
    ('00384393666', 'M�rcia Pereira', 'Rua Projetada A1', 'Numero 233', 'Copacabana', 'Rio de janeiro', 'RJ', '20000000', '1975-03-21', 47, 'F', 20000, 30000.30, 'FALSE');


/*O campo "primeira_compra" � do tipo bit, podemos represent�-lo tanto com 0 ou 1, quanto com True or False.
Lembrando que esta segunda op��o precisa estar escrita em letras mai�sculas e aspas simples.
Quando escrevemos a palavra "True" no campo bit, ele entende que significa verdadeiro e usa o n�mero 1 na tabela.
Ao escrevermos "False" no comando, no banco, ele ser� representado por zero.

Ent�o, no campo l�gico bit, podemos usar os n�meros �1 ou 0� ou as palavras �True ou False�, entre aspas simples e em letras mai�sculas.*/



										--ADICIONANDO UMA CHAVE PRIMARIA EM UMA TABELA JA EXISTENTE

USE SUCOS_VENDAS;

/*Podemos ter dois produtos com o mesmo nome, embalagem, tamanho, sabor e at� com o mesmo pre�o,
mas o c�digo tem que ser diferente. Precisamos dizer para o banco de dados que o campo "CODIGO DO PRODUTO"
agora ser� uma Primary key. Para isso, � necess�rio alterar a estrutura da tabela de produtos: ALTER TABLE 
TABELA_DE_PRODUTOS.*/

/*Nossa inten��o � adicionar uma chave prim�ria � tabela existente.

Restri��o(constraints)

Podemos ter uma chave prim�ria com mais de um campo, mas cada tabela pode ter apenas uma chave prim�ria.

Para adicionar uma chave primaria faremos "PRIMARY KEY CLUSTERED" entre par�nteses, o(s) campo(s) que ser� chave primaria */

ALTER TABLE TABELA_DE_PRODUTOS
ADD CONSTRAINT PK_TABELA_DE_PRODUTOS
PRIMARY KEY CLUSTERED (CODIGO_DO_PRODUTO);

/*Explicando o comando acima:
Alterando  "ALTER TABLE" a tabela "TABELA_DE_PRODUTOS"
adicionando uma chave primaria chamada de "PK_TABELA_DE_PRODUTOS"
no campo "CODIGO_DO_PRODUTO"*/


							--- ADICIONANDO UMA CHAVE PRIMARIA NA TABELA DE VENDEDORES

USE SUCOS_VENDAS;

SELECT * FROM TABELA_DE_VENDEDORES;

/*Alterar o campo/coluna para que aceite valores nulos.*/
ALTER TABLE TABELA_DE_VENDEDORES ALTER COLUMN MATRICULA CHAR(5) NOT NULL;

/*Criar a chave prim�ria*/
ALTER TABLE TABELA_DE_VENDEDORES
ADD CONSTRAINT PK_TABELA_DE_VENDEDORES
PRIMARY KEY CLUSTERED (MATRICULA);


								---DESAFIO- MOSTRANDO DADOS NA TABELA

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


							--DESAFIO-TABELA-VENDEDORES

USE SUCOS_VENDAS;

SELECT * FROM TABELA_DE_VENDEDORES;

/*1) Apague a tabela existente.*/
DROP TABLE TABELA_DE_VENDEDORES;

/*2) Crie uma nova TABELA_DE_VENDEDORES. Algumas informa��es:

Nome da tabela deve ser TABELA DE VENDEDORES.

Vendedor tem como chave o n�mero interno da matr�cula (Nome do campo MATRICULA) 
que deve ser um texto de 5 posi��es que n�o pode ser NULL.

O nome do vendedor (Nome do campo NOME) deve ser um texto de 100 posi��es.

Cidade de atua��o (Nome do campo CIDADE) deve ser um texto de 100 posi��es.

% de comiss�o. Este campo (Nome do campo PERCENTUAL COMISS�O) representa quantos % 
de comiss�o o vendedor ganha sobre cada venda e n�o pode ser NULL.

Crie um campo chamado DATA INICIO que ser� a data em que o vendedor come�ou a trabalhar na empresa.
Este campo n�o pode ser NULL.

Crie um campo l�gico chamado TEM_DEPENDENTE que ser� TRUE se o vendedor possuir dependentes e FALSE se n�o possuir dependentes.
*/

CREATE TABLE TABELA_DE_VENDEDORES(
    MATRICULA varchar(5) NOT NULL,
    NOME varchar(100) NULL,
    CIDADE varchar(100) NULL,
    PERCENTUAL_COMISS�O FLOAT NOT NULL,
    DATA_INICIO date NOT NULL,
    TEM_DEPENDENTE BIT);


/*3) Inclua o vendedor Alberto de S� Verneck, matr�cula 00239, atua na cidade de S�o Paulo, 
com comiss�o de 8%, admitido em 05/06/2020 e possui dependentes.*/
INSERT INTO TABELA_DE_VENDEDORES (NOME, MATRICULA, CIDADE,PERCENTUAL_COMISS�O, DATA_INICIO,TEM_DEPENDENTE)
VALUES
('Alberto de S� Verneck','00239','S�o Paulo', 0.08,'2020-06-05',1);

/*inclua um novo vendedor usando no campo l�gico a forma alternativa.
Nome Marcela Almeida, matr�cula 00240, atua no Rio de Janeiro, com comiss�o de 7%, admitido em 12/01/2021 e n�o possui dependentes.*/
INSERT INTO TABELA_DE_VENDEDORES (NOME, MATRICULA, CIDADE,PERCENTUAL_COMISS�O, DATA_INICIO,TEM_DEPENDENTE)
VALUES
('Marcela Almeida','00240','Rio de Janeiro', 0.07,'2021-01-12','FALSE');

/*4) Visualize a tabela.*/
SELECT * FROM TABELA_DE_VENDEDORES;