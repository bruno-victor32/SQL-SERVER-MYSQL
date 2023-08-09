/*Criando um banco de dados*/
CREATE DATABASE DB_ControleDeGastos;

--Selecionando o Banco de dados que quero utilizar
USE DB_ControleDeGastos;

--Criando uma tabela
CREATE TABLE TB_compras(
	valor DECIMAL(18,2), --Coluna com do tipo decimal, ou seja, aceita números com vírgulas. Pode ter 18 casas decimais antes da vírgula e 2 casas depois da vírgula 
	data DATE,
	observacoes VARCHAR(255), --Campo do tipo texto
	recebidas TINYINT -- TINYINT aceita valores 0 e 1, para representar o negativo e o positivo
);


/*Para verificar a descrição da tabela*/
sp_help TB_compras;

/--Listando todas as tabelas do banco de dados
SELECT * FROM information_schema.tables;

--Inserindo dados na tabela
INSERT INTO TB_compras VALUES (20, '2016-01-05', 'Lanchonete', 1); 

--Realizando uma consulta
SELECT * FROM TB_compras;

--Inserindo dados na tabela
INSERT INTO TB_compras VALUES (15.00, '2016-01-06', 'Lanchonete', 1)
INSERT INTO TB_compras VALUES (915.50, '2016-01-05', 'Guarda-roupa', 0);

--Inserindo dados na tabela com uma ordem diferente da estrutura da tabela
INSERT INTO TB_compras (data, observacoes, valor, recebidas)
VALUES ('2016-01-10', 'Smartphone', 949.99, 0);

--Adicionando uma coluna na tabela de compras já existente
--OBSERVAÇÃO, vai criar essa tabela do tipo que aceita valores nulos
ALTER TABLE TB_compras ADD id INT;

--Tive que colocar no campo/coluna id de forma manual os id que estavam nulo, para que 
-- seja possível modificar a coluna para que não aceite valores nulos
UPDATE TB_compras
SET id = 1  
WHERE valor = 20  and observacoes = 'Lanchonete';

UPDATE TB_compras
SET id = 2  
WHERE valor = 15.00  and observacoes = 'Lanchonete';

UPDATE TB_compras
SET id = 3  
WHERE valor = 915.50  and observacoes = 'Guarda-roupa';

UPDATE TB_compras
SET id = 4  
WHERE valor = 949.99  and observacoes = 'Smartphone';


--Alterando a tabela para que aceite valores nulos
ALTER TABLE TB_compras ALTER COLUMN id INT NOT NULL;


--Apagando uma coluna da tabela, nesse caso a coluna não pode ser chave primaria
ALTER TABLE TB_compras DROP COLUMN id;


--Adicionando uma chave primária na tabela já existente

--Chave primária ( PRIMARY KEY)
--Inteiro (INT)
--Automaticamente incrementado (AUTO_INCREMENT)
--Nome da chave primária "ID"


ALTER TABLE TB_compras ADD CONSTRAINT PK_id
 PRIMARY KEY CLUSTERED (id);


 ALTER TABLE TB_compras
ALTER COLUMN PK_id Identity(1,1) PRIMARY KEY  ;

--Apagando uma chave primaria de uma tabela, só consigo apagar si ela não estiver envolvida em nenhum relacionamento
ALTER TABLE TB_compras DROP CONSTRAINT PK_id

DELETE table TABELA