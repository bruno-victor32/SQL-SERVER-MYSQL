--CRIANDO UM BANCO DE DADOS
CREATE DATABASE CALDOS_VENDAS;

--SELECIONANDO O BANCO DE DADOS
USE CALDOS_VENDAS;

--APAGANDO UM BANCO DE DADOS
DROP DATABASE CALDOS_VENDAS;


--CRIANDO UMA TABELA NO BANCO DE DADOS
CREATE TABLE TABELA_DE_CLIENTES (
	CPF CHAR(11) NOT NULL CONSTRAINT PK_CPF PRIMARY KEY, -- O campo CPF vai ocupar 11 espaços/11 digitos
	NOME VARCHAR (100) NULL, --NOME DO CLIENTE
	ENDERECO1 VARCHAR (150) NULL,
	ENDERECO2 VARCHAR (150) NULL,
	BAIRRO VARCHAR (50) NULL,
	CIDADE VARCHAR (50) NULL,
	ESTADO CHAR (2) NULL,
	CEP  CHAR (8) NULL, --Vai ser 8 digitos porque não vamos considerar o traço "-"
	DATA_DE_NASCIMENTO DATE NULL,
	IDADE SMALLINT NULL, 
	GENERO CHAR (1) NULL,
	LIMITE_DE_CREDITO MONEY NULL, -- O limite do crédito do cliente para ele comprar produtos na empresa
	VOLUME_DE_COMPRA FLOAT NULL,-- O volume mínimo de produtos que ele pode comprar
	PRIMEIRA_COMPRA BIT NULL -- Se ele já realizou a primeira compra, campo lógico 0 ou 1 
);

--CRIANDO UMA TABELA NO BANCO DE DADOS
CREATE TABLE TABELA_DE_PRODUTOS(
CODIGO_DO_PRODUTO INT CONSTRAINT PK_CODIGO_PRODUTO PRIMARY KEY IDENTITY (1,1), --IDENTITY e como si fosse o AUTO INCREMENT no Mysql "(1,1)" significa que vai começar do 1 e vai subindo de 1 em 1 
NOME_DO_PRODUTO VARCHAR(150) NULL,
EMBALAGEM VARCHAR (50) NULL,
TAMANHO VARCHAR (50) NULL,
SABOR VARCHAR (50) NULL,
PRECO_DE_LISTA SMALLMONEY NOT NULL  --O tipo SMALLINT indica que tem casas decimais
);

--CRIANDO UMA TABELA NO BANCO DE DADOS
CREATE TABLE TABELA_DE_VENDEDORES(
MATRICULA CHAR(5),
NOME VARCHAR(100),
PERCENTUAL_COMISSAO FLOAT
);

--VER INFORMAÇÕES SOBRE A TABELA CRIADA
sp_help TABELA_DE_CLIENTES;

--REALIZANDO UMA CONSULTA NA TABELA 
SELECT * FROM TABELA_DE_CLIENTES;

SELECT * FROM TABELA_DE_PRODUTOS;

SELECT * FROM TABELA_DE_VENDEDORES;


--ALTERANDO A COLUNA "CPF" DA TABELA DE CLIENTES PARA QUE ELA NÃO ACEITE VALORES NULOS
ALTER TABLE TABELA_DE_CLIENTES ALTER COLUMN CPF CHAR(11) NOT NULL;


--CRIANDO UMA "CHAVE PRIMARIA" NA TABELA DE CLIENTES
ALTER TABLE TABELA_DE_CLIENTES ADD CONSTRAINT PK_TABELA_DE_CLIENTES
PRIMARY KEY CLUSTERED (CPF);


/*Incluindo dados na tabela. Não colocaremos o nome dos campos, nós adicionaremos os dados na mesma ordem em que os campos estão declarados. */
INSERT INTO TABELA_DE_CLIENTES
VALUES
('00384393431', 'João da Silva', 'Rua Projetada A1', 'Numero 233', 'Copacabana', 'Rio de janeiro', 'RJ', '20000000', '1965-03-21', 57, 'M', 20000, 30000.30, 1);


--REALIZANDO UMA CONSULTA NA TABELA DE PRODUTOS, QUERO SABER SOMENTE INFORMAÇÕES SOBRE O CAMPO "NOME_DO_PRODUTO, TAMANHO, SABOR"
SELECT NOME_DO_PRODUTO, TAMANHO, SABOR 
FROM TABELA_DE_PRODUTOS;


--QUERO QUE MOSTRE NA TELA SOMENTE O CAMPO/COLUNA "NOME" E "CPF" DA TABELA DE CLIENTES
SELECT NOME, CPF
FROM TABELA_DE_CLIENTES;


/*Também podemos criar um alias, ou seja, um apelido. O alias é um nome fantasia que daremos para a coluna. Por exemplo, após [NOME], podemos escrever AS NOME_DO_CLIENTE, nesse caso "NOME_DO_CLIENTE" e o alias/apelido.*/
SELECT NOME AS NOME_DO_CLIENTE, CPF
FROM TABELA_DE_CLIENTES;

--OUTRO EXEMPLO UTILIZANDO ALIAS
SELECT NOME  AS NOME_DO_CLIENTE, CPF AS IDENTIFICADOR
FROM TABELA_DE_CLIENTES;


--COMANDO PARA EXCLUIR UMA TABELA 
DROP TABLE TABELA_DE_PRODUTOS;


--INSERINDO DADOS NA TABELA
INSERT INTO TABELA_DE_PRODUTOS
(CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA)
VALUES
('1040107', 'Light - 350 ml - Melância', 'Lata', '350 ml', 'Melância', 4.56 );

--OUTRA FORMA DE INSERIR VARIOS DADOS NA TABELA
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA)
VALUES
('1037797', 'Clean - 2 litros - Laranja', 'PET', '2 Litros', 'Laranja', 16.01 ),
('1000889', 'Sabor da Montanha - 700 ml - Uva', 'Garrafa', '700 ml', 'Uva', 6.31 );

--OUTRA FORMA DE INSERIR DADOS NA TABELA
INSERT INTO TABELA_DE_VENDEDORES (MATRICULA, NOME, PERCENTUAL_COMISSAO)
VALUES
('00235','Márcio Almeida Silva',0.08);

/*Quando as ordem dos campos for respeitada, não é preciso declará-los no comando, podendo ficar desta forma:
Isso significa que que cada valor corresponde, respectivamente, a determinado campo da tabela*/
INSERT INTO TABELA_DE_PRODUTOS
VALUES
('1004327','Videira do Cmapo - 1,5 Litros - Melância','PET','1,5 Litros','Melância',19.51);

/*Esse INSERT acima e a mesma coisa que esse insert a seguir*/
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA)
VALUES
('1004327','Videira do Cmapo - 1,5 Litros - Melância','PET','1,5 Litros','Melância',19.51);


/*Esse INSERT abaixo, no campo "PRECO_DE_LISTA" inserimos somente 7 ao invés de 7.00, ainda assim
não teve problema devido o tipo desse campo ser "smallmoney", ou seja, possui casas decimais.*/
INSERT INTO TABELA_DE_PRODUTOS
VALUES
('1088126','Linha Citros - 1 Litro - Limão','PET','1 Litro','Limão',7);


 /*Dessa maneira abaixo estamos inserindo duas linhas na tabela ao mesmo tempo*/
 INSERT INTO TABELA_DE_PRODUTOS
 VALUES
('1088126','Linha Citros - 1 Litro - Limão','PET','1 Litro','Limão',7),
('544931','Frescor do Verão - 350 ml - Limão','Lata','350 ml','Limão',2.46);


INSERT INTO TABELA_DE_VENDEDORES (MATRICULA, NOME, PERCENTUAL_COMISSAO)
VALUES
('00236', 'Cláudia Morais', 0.08),
('00237', 'Marcela Ferreira', 0.09);

--INSERINDO DADOS NA TABELA DE CLIENTES
INSERT INTO TABELA_DE_CLIENTES (CPF, NOME, ENDERECO1, ENDERECO2, BAIRRO, CIDADE, ESTADO, CEP , DATA_DE_NASCIMENTO, IDADE , GENERO, LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA) 
VALUES 
('19290992743','Fernando Cavalcante','R. Dois de Fevereiro','','Água Santa','Rio de Janeiro','RJ','22000000','2000-02-12',18,'M',100000,200000,1),
('2600586709','César Teixeira','Rua Conde de Bonfim','','Tijuca','Rio de Janeiro','RJ','22020001','2000-03-12',18,'M',120000,220000,0),
('95939180787','Fábio Carvalho','R. dos Jacarandás da Península','','Barra da Tijuca','Rio de Janeiro','RJ','22002020','1992-01-05',16,'M',90000,180000,1),
('9283760794','Edson Meilelles','R. Pinto de Azevedo','','Cidade Nova','Rio de Janeiro','RJ','22002002','1995-10-07',22,'M',150000,250000,1),
('7771579779','Marcelo Mattos','R. Eduardo Luís Lopes','','Brás','São Paulo','SP','88202912','1992-03-25',25,'M',120000,200000,1),
('5576228758','Petra Oliveira','R. Benício de Abreu','','Lapa','São Paulo','SP','88192029','1995-11-14',22,'F',70000,160000,1),
('8502682733','Valdeci da Silva','R. Srg. Édison de Oliveira','','Jardins','São Paulo','SP','82122020','1995-10-07',22,'M',110000,190000,0),
('1471156710','Érica Carvalho','R. Iriquitia','','Jardins','São Paulo','SP','80012212','1990-09-01',27,'F',170000,245000,0),
('3623344710','Marcos Nougeuira','Av. Pastor Martin Luther King Junior','','Inhauma','Rio de Janeiro','RJ','22002012','1995-01-13',23,'M',110000,220000,1),
('50534475787','Abel Silva ','Rua Humaitá','','Humaitá','Rio de Janeiro','RJ','22000212','1995-09-11',22,'M',170000,260000,0),
('5840119709','Gabriel Araujo','R. Manuel de Oliveira','','Santo Amaro','São Paulo','SP','80010221','1985-03-16',32,'M',140000,210000,1),
('94387575700','Walber Lontra','R. Cel. Almeida','','Piedade','Rio de Janeiro','RJ','22000201','1989-06-20',28,'M',60000,120000,1),
('8719655770','Carlos Eduardo','Av. Gen. Guedes da Fontoura','','Jardins','São Paulo','SP','81192002','1983-12-20',34,'M',200000,240000,0),
('5648641702','Paulo César Mattos','Rua Hélio Beltrão','','Tijuca','Rio de Janeiro','RJ','21002020','1991-08-30',26,'M',120000,220000,0),
('492472718','Eduardo Jorge','R. Volta Grande','','Tijuca','Rio de Janeiro','RJ','22012002','1994-07-19',23,'M',75000,95000,1);


--INSERINDO DADOS NA TABELA DE PRODUTOS
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) 
VALUES 
('1040107','Light - 350 ml - Melância','Lata','350 ml','Melância',4.555),
('1037797','Clean - 2 Litros - Laranja','PET','2 Litros','Laranja',16.008),
('1000889','Sabor da Montanha - 700 ml - Uva','Garrafa','700 ml','Uva',6.309),
('1004327','Videira do Campo - 1,5 Litros - Melância','PET','1,5 Litros','Melância',19.51),
('1088126','Linha Citros - 1 Litro - Limão','PET','1 Litro','Limão',7.004),
('544931','Frescor do Verão - 350 ml - Limão','Lata','350 ml','Limão',2.4595),
('1078680','Frescor do Verão - 470 ml - Manga','Garrafa','470 ml','Manga',5.1795),
('1042712','Linha Citros - 700 ml - Limão','Garrafa','700 ml','Limão',4.904),
('788975','Pedaços de Frutas - 1,5 Litros - Maça','PET','1,5 Litros','Maça',18.011),
('1002767','Videira do Campo - 700 ml - Cereja/Maça','Garrafa','700 ml','Cereja/Maça',8.41),
('231776','Festival de Sabores - 700 ml - Açai','Garrafa','700 ml','Açai',13.312),
('479745','Clean - 470 ml - Laranja','Garrafa','470 ml','Laranja',3.768),
('1051518','Frescor do Verão - 470 ml - Limão','Garrafa','470 ml','Limão',3.2995),
('1101035','Linha Refrescante - 1 Litro - Morango/Limão','PET','1 Litro','Morango/Limão',9.0105),
('229900','Pedaços de Frutas - 350 ml - Maça','Lata','350 ml','Maça',4.211),
('1086543','Linha Refrescante - 1 Litro - Manga','PET','1 Litro','Manga',11.0105),
('695594','Festival de Sabores - 1,5 Litros - Açai','PET','1,5 Litros','Açai',28.512),
('838819','Clean - 1,5 Litros - Laranja','PET','1,5 Litros','Laranja',12.008),
('326779','Linha Refrescante - 1,5 Litros - Manga','PET','1,5 Litros','Manga',16.5105),
('520380','Pedaços de Frutas - 1 Litro - Maça','PET','1 Litro','Maça',12.011),
('1041119','Linha Citros - 700 ml - Lima/Limão','Garrafa','700 ml','Lima/Limão',4.904),
('243083','Festival de Sabores - 1,5 Litros - Maracujá','PET','1,5 Litros','Maracujá',10.512),
('394479','Sabor da Montanha - 700 ml - Cereja','Garrafa','700 ml','Cereja',8.409),
('746596','Light - 1,5 Litros - Melância','PET','1,5 Litros','Melância',19.505),
('773912','Clean - 1 Litro - Laranja','PET','1 Litro','Laranja',8.008),
('826490','Linha Refrescante - 700 ml - Morango/Limão','Garrafa','700 ml','Morango/Limão',6.3105),
('723457','Festival de Sabores - 700 ml - Maracujá','Garrafa','700 ml','Maracujá',4.912),
('812829','Clean - 350 ml - Laranja','Lata','350 ml','Laranja',2.808),
('290478','Videira do Campo - 350 ml - Melância','Lata','350 ml','Melância',4.56),
('783663','Sabor da Montanha - 700 ml - Morango','Garrafa','700 ml','Morango',7.709),
('235653','Frescor do Verão - 350 ml - Manga','Lata','350 ml','Manga',3.8595),
('1002334','Linha Citros - 1 Litro - Lima/Limão','PET','1 Litro','Lima/Limão',7.004),
('1013793','Videira do Campo - 2 Litros - Cereja/Maça','PET','2 Litros','Cereja/Maça',24.01),
('1096818','Linha Refrescante - 700 ml - Manga','Garrafa','700 ml','Manga',7.7105),
('1022450','Festival de Sabores - 2 Litros - Açai','PET','2 Litros','Açai',38.012);



SET IDENTITY_INSERT TABELA_DE_PRODUTOS ON;
SET IDENTITY_INSERT TABELA_DE_PRODUTOS OFF;


--EXCLUINDO DADOS NA TABELA

SELECT * FROM TABELA_DE_PRODUTOS;

--EXCLUINDO O PRODUTO DE "CODIGO_DO_PRODUTO = 10088126"
DELETE FROM TABELA_DE_PRODUTOS
WHERE CODIGO_DO_PRODUTO = '1088126';

SELECT * FROM TABELA_DE_VENDEDORES;

--EXCLUINDO A VENDEDORA DE "MATRICULA = 00236" que pediu demissão
DELETE FROM TABELA_DE_VENDEDORES
WHERE MATRICULA = '00236';

--USANDO FILTROS NAS TABELAS

--DELETANDO O PRODUTO QUE TENHA COMO "CODIGO_DO_PRODUTO = 1000889"
DELETE FROM TABELA_DE_PRODUTOS
WHERE CODIGO_DO_PRODUTO = 1000889;

--QUERO QUE ESSA CONSULTA RETORNE O PRODUTO QUE TENHA O "CODIGO_DO_PRODUTO = 1002334"
SELECT * FROM TABELA_DE_PRODUTOS 
WHERE CODIGO_DO_PRODUTO = 1002334;

--QUERO VISUALIZAR TODOS OS PRODUTOS QUE SEJAM DO "SABOR = LARANJA"
SELECT * FROM TABELA_DE_PRODUTOS
WHERE SABOR = 'Laranja';

--QUERO VISUALIZAR TODOS OS PRODUTOS QUE SEJAM DO "SABOR = LIMÃO"
SELECT * FROM TABELA_DE_PRODUTOS
WHERE SABOR = 'Limão';

--DELETANDO TODOS OS PRODUTOS QUE TEM "SABOR = LIMÃO"
DELETE FROM TABELA_DE_PRODUTOS
WHERE SABOR = 'Limão';

						--USANDO FILTROS NO UPDATE

USE SUCOS_VENDAS;

SELECT * FROM [TABELA DE PRODUTOS] WHERE [EMBALAGEM] = 'Lata'; 

/*Vamos supor que o executivo da empresa pediu que fizéssemos um reajuste
de dez por cento em todos os produtos de lata, porque o custo do alumínio 
aumentou. Isto é, a lata ficou mais cara e por isso precisamos aumentar o
preço desses produtos.

Para isso, podemos usar o UPDATE, já que ele altera um valor existente.*/

/*Para aumentar os preços dos produtos em 10%, será necessario multiplicar os valores do do campo "preco de lista" por 1.1
Podemos fazer o aumento de preço dos produtos, um por um dessa forma abaixo
Nesse caso abaixo estou modificando o valor do produto de código 544931*/
UPDATE TABELA_DE_PRODUTOS SET PRECO_DE_LISTA = 4.555 * 1.1 WHERE CODIGO_DO_PRODUTO = '544931';

/*Aumentando o preço de todos os produtos de uma vez somente
Aumentando em dez por cento o preço de lista de todos os produtos com embalagem de lata. Usando apenas um comando. */
UPDATE TABELA_DE_PRODUTOS SET PRECO_DE_LISTA = PRECO_DE_LISTA * 1.1 WHERE EMBALAGEM = 'Lata' ;

SELECT * FROM TABELA_DE_VENDEDORES;

--ALTEREI O NÚMERO DA MATRICULA DO VENDEDOR DE "NOME = MÁRCIO ALMEIDA SILVA"
UPDATE TABELA_DE_VENDEDORES SET MATRICULA = '00238' WHERE NOME = 'Márcio Almeida Silva';

--ALTERANDO O NOME DA VENDEDORA DE "MARCELA FERREIRA" PARA "MARCIELE FERREIRA"
UPDATE TABELA_DE_VENDEDORES SET NOME = 'Marcielle ferreira' WHERE MATRICULA = '00237';


--FILTROS COMPOSTOS

/*Os "Filtros compostos" acontecem quando reunimos mais de uma condição no mesmo filtro, 
Por exemplo:
visualizar todas as pessoas que nasceram no ano de 1995 e moram no Rio de Janeiro.
Neste caso, vamos juntar condições e usar dois símbolos lógicos: AND (E) e OR (OU).

As expressões com "AND" só serão verdadeiras quando as duas condições são verdadeiras.

VERDADEIRO AND VERDADEIRO --> VERDADEIRA
FALSO      AND VERDADEIRO --> FALSA
VERDADEIRO AND FALSO --> FALSA 
FALSO      AND FALSO --> FALSA 

O "OR" é um pouco diferente: se uma das condições for verdadeira, a expressão é verdadeira.

VERDADEIRO OR VERDADEIRO --> VERDADEIRA
FALSO      OR VERDADEIRO --> VERDADEIRA
VERDADEIRO OR FALSO --> VERDADEIRA 
FALSO      OR FALSO --> FALSA 
*/

SELECT * FROM TABELA_DE_CLIENTES;

--CONSULTA QUE PERMITE VISUALIZAR TODOS OS CLIENTES QUE NASCERAM NO DIA 12
SELECT * FROM TABELA_DE_CLIENTES WHERE DAY (DATA_DE_NASCIMENTO) = 12;

--CONSULTA QUE PERMITE VISUALIZAR TODOS OS CLIENTES QUE NASCERAM NO MÊS DE JUNHO
SELECT * FROM TABELA_DE_CLIENTES WHERE MONTH (DATA_DE_NASCIMENTO) = 06;

--CONSULTA QUE PERMITE VISUALIZAR TODOS OS CLIENTES QUE NASCERAM NO ANO DE 1983
SELECT * FROM TABELA_DE_CLIENTES WHERE YEAR (DATA_DE_NASCIMENTO) = 1983;

--CONSULTA QUE PERMITE VISUALIZAR TODOS OS CLIENTES QUE NASCERAM NO DIA 12 E MORAM NO BAIRRO DA TIJUCA
SELECT * FROM TABELA_DE_CLIENTES WHERE DAY (DATA_DE_NASCIMENTO) = 12 AND BAIRRO = 'Tijuca';

--CONSULTA QUE PERMITE VISUALIZAR TODOS OS CLIENTES QUE MORAM NO BAIRRO DA TIJUCA OU NO BAIRRO DE JARDINS
SELECT * FROM TABELA_DE_CLIENTES WHERE BAIRRO = 'Jardins' OR BAIRRO = 'Tijuca';

										--UTILIZANDO FILTRO MAIOR MENOR DIFERENTE

/*
SINAIS
> MAIOR
< MENOR
<> DIFERENTE
>= MAIOR OU IGUAL
<= MENOR OU IGUAL
*/


--Descobrir qual produto tem o preco igual a 7.336
SELECT * FROM TABELA_DE_PRODUTOS WHERE PRECO_DE_LISTA = 7.336;

--DESCOBRIR QUAIS PRODUTOS CUSTAM MAIS DE 7.336
SELECT * FROM TABELA_DE_PRODUTOS WHERE PRECO_DE_LISTA > 7.336;