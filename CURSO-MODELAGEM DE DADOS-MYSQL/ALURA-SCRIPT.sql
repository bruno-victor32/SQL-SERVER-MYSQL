/*Comando para criar o banco de dados*/
CREATE DATABASE db_sucos;

/*Selecionado o banco de dados sucos para utilizar o mesmo*/
USE db_sucos;

/*Comando para apagar o banco de dados*/
DROP DATABASE db_sucos;

/*Criando a tabela clientes*/
CREATE TABLE tb_cliente(
cpf varchar (11),
nome varchar (100),
endereco1 varchar (150),
endereco2 varchar (150),
bairro varchar (50),
cidade varchar (50),
estado varchar (2),
cep varchar (8),
idade smallint,
sexo varchar(1),
limite_credito float,
volume_compra float,
primeira_compra bit /*Campo lógico "1" ou "0"*/
);

CREATE TABLE tb_de_vendedores(
matricula varchar (5),
nome varchar (100),
percentual_comissao float
);

drop table tb_de_vendedores;

CREATE TABLE tb_produtos(
produto varchar(20), /*Esse campo e o coigo do produto*/
nome varchar(150),
embalagem varchar(150),
tamanho varchar(50),
sabor varchar(50),
preco_de_lista float
);

/*Comando para apagar a tabela "produtos"*/
DROP TABLE tb_produtos;

/*Comando para inserir registros na tabela tb_produtos*/
INSERT INTO tb_produtos (produto, nome, embalagem, tamanho, sabor, preco_de_lista) 
VALUES
('1040107', 'Light - 350 ml - Melancia', 'Lata', '350 ml', 'Melancia', 4.56);

/*Outra forma de Inserir varios dados/registros ao mesmo tempo*/
INSERT INTO tb_produtos (produto, nome, embalagem, tamanho, sabor, preco_de_lista)
VALUES
('1037797','Clean - 2 Litros - Laranja', 'PET', '2 Litros', 'Laranja', 16.01),
('1000889','Sabor da Montanha - 700 ml - Uva', 'Garrafa', '700 ml', 'Uva', 6.31),
('1004327','Videira do Campo - 1,5 Litros - Melancia', 'PET', '1,5 Litros', 'Melancia', 19.51);

/*Comando utilizado quando queremos buscar dados de uma ou mais tabelas do banco de dados*/

SELECT * FROM tb_produtos;

SELECT * FROM tb_de_vendedores;

INSERT INTO tb_de_vendedores (matricula, nome, percentual_comissao)
VALUES
('00233', 'João Geraldo da Fonseca', 0.10); /*No caso utilizamos 0.10 devido a comissão ser 10%*/

INSERT INTO tb_de_vendedores (matricula, nome, percentual_comissao)
VALUES
('00235', 'Márcio Almeida Silva',0.08),/*No caso utilizamos 0.00 devido a comissão ser 8%*/
('00236', 'Cláudia Morais', 0.08);

INSERT INTO tb_produtos (produto, nome, embalagem, tamanho, sabor, preco_de_lista)
VALUES
('544931','Frescor de Verrão - 350 ml - Limão', 'PET', '350 ml', 'Limão', 3.20),
('1078680','Frescor de Verão - 470 ml - Manga', 'Lata', '470 ml', 'Manga', 5.18);

/*Comando para alterar registros/informações de um campo já inseridas na tabela*/
UPDATE tb_produtos SET embalagem = 'Lata', preco_de_lista = 2.46 /*Alterando a embalagem de "PET" para "LATA" e alterando o preço*/
WHERE produto = '544931';

UPDATE tb_produtos SET embalagem = 'Garrafa'
WHERE produto = '1078680';

/*Alterando o percentual de comissão da funcionaria Cláudia devido ela ter recebido um aumento*/
UPDATE tb_de_vendedores SET percentual_comissao = 0.11 /*No caso utilizamos 0.11 devido a comissão ser 11%*/
WHERE matricula = '00236';

/*Alterando o nome do funcionario de José Geraldo da Fonseca para José Geraldo da Fonseca Junior*/
UPDATE tb_de_vendedores SET nome = 'José Geraldo da Fonseca Junior'
WHERE matricula = '00233';

/*Apagando um registro/dados/informações  da tabela*/

DELETE FROM tb_produtos; /*Apaga todos os registros/dados da tabela*/

DELETE FROM tb_produtos WHERE produto = '1078680';/*Apagando os registros/dados somente do produto "1078680" que está na tabela produtos*/

/*Excluindo o vendedor José Geraldo da Fonseca de matrícula (00233) que foi demitido*/
DELETE FROM tb_de_vendedores WHERE matricula = '00233';

/*Comando que permite alterar uma propriedade de uma tabela que já existe*/
ALTER TABLE tb_produtos ADD PRIMARY KEY (produto); /*Incluindo uma chave primaria no campo "produto" que está na "tabela produtos"*/

/*Comando que permite ver a estrutura de uma tabela*/
DESCRIBE tb_produtos;

DESCRIBE tb_cliente;

/*Incluindo uma chave primaria no campo "cpf" que está na "tabela clientes"*/
ALTER TABLE tb_cliente  ADD PRIMARY KEY(cpf);

/*Adicionando uma nova coluna na tabela clientes */
ALTER TABLE tb_cliente ADD COLUMN (data_nascimento date);/*Adicionando uma coluna/um campo novo chamado "data_nascimento" do tipo "date" na tabela cliente*/

/*Alterando o tipo do campo, nesse caso o campo estado e do tipo varchar(2) e estou alterando para varchar(10)*/
ALTER TABLE tb_cliente
MODIFY COLUMN estado VARCHAR(10);

/*Inserindo dados na tabela clientes*/
/*Nesse caso deixei o endereco2 vazio*/
INSERT INTO tb_cliente(cpf, nome, endereco1, endereco2, bairro, cidade, estado, cep, idade, sexo, limite_credito, volume_compra, primeira_compra, data_nascimento)
VALUES
('00388934505','João da Silva', 'Rua projetada A número 10', '', 'Vila Romana', 'Caratinga', 'Amazonas', '2222222', 30, 'M', 10000.00, 2000, 0, '1989-10-05');

SELECT * FROM tb_cliente;

/*Incluindo um novo campo/coluna na tabela vendedores */
ALTER TABLE tb_de_vendedores ADD COLUMN (data_admissao date);

/*Apagando a tabela de vendedores */
DROP TABLE tb_de_vendedores;

/*Criando a tabela de vendedores*/
CREATE TABLE tb_de_vendedores(
matricula varchar (5),
nome varchar (100),
percentual_comissao float,
data_admissao date,
de_ferias bit
);

/*Incluindo uma chave primaria no campo "matricula" que está na "tabela de vendedores"*/
ALTER TABLE tb_de_vendedores  ADD PRIMARY KEY(matricula);

SELECT * FROM tb_de_vendedores;

DESCRIBE tb_de_vendedores;

/*Inserindo dados na tabela de vendedores*/
INSERT INTO tb_de_vendedores (matricula, nome, percentual_comissao, data_admissao, de_ferias)
VALUE
('00235', 'Márcio Almeida Silva', 0.08, '2014-08-15', 0),
('00236', 'Cláudia Morais', 0.08, '2013-09-17', 1),
('00237', 'Roberta Martins', 0.11, '2017-03-18', 1),
('00238', 'Péricles Alves', 0.11, '2016-08-21',0);

DROP TABLE tb_cliente;

INSERT INTO tb_cliente (CPF,NOME,ENDERECO1,ENDERECO2,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA) VALUES ('19290992743','Fernando Cavalcante','R. Dois de Fevereiro','','Água Santa','Rio de Janeiro','RJ','22000000','2000-02-12',18,'M',100000,200000,1);
INSERT INTO tb_cliente (CPF,NOME,ENDERECO1,ENDERECO2,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA) VALUES ('2600586709','César Teixeira','Rua Conde de Bonfim','','Tijuca','Rio de Janeiro','RJ','22020001','2000-03-12',18,'M',120000,220000,0);
INSERT INTO tb_cliente (CPF,NOME,ENDERECO1,ENDERECO2,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA) VALUES ('95939180787','Fábio Carvalho','R. dos Jacarandás da Península','','Barra da Tijuca','Rio de Janeiro','RJ','22002020','1992-01-05',16,'M',90000,180000,1);
INSERT INTO tb_cliente (CPF,NOME,ENDERECO1,ENDERECO2,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA) VALUES ('9283760794','Edson Meilelles','R. Pinto de Azevedo','','Cidade Nova','Rio de Janeiro','RJ','22002002','1995-10-07',22,'M',150000,250000,1);
INSERT INTO tb_cliente (CPF,NOME,ENDERECO1,ENDERECO2,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA) VALUES ('7771579779','Marcelo Mattos','R. Eduardo Luís Lopes','','Brás','São Paulo','SP','88202912','1992-03-25',25,'M',120000,200000,1);
INSERT INTO tb_cliente (CPF,NOME,ENDERECO1,ENDERECO2,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA) VALUES ('5576228758','Petra Oliveira','R. Benício de Abreu','','Lapa','São Paulo','SP','88192029','1995-11-14',22,'F',70000,160000,1);
INSERT INTO tb_cliente (CPF,NOME,ENDERECO1,ENDERECO2,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA) VALUES ('8502682733','Valdeci da Silva','R. Srg. Édison de Oliveira','','Jardins','São Paulo','SP','82122020','1995-10-07',22,'M',110000,190000,0);
INSERT INTO tb_cliente (CPF,NOME,ENDERECO1,ENDERECO2,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA) VALUES ('1471156710','Érica Carvalho','R. Iriquitia','','Jardins','São Paulo','SP','80012212','1990-09-01',27,'F',170000,245000,0);
INSERT INTO tb_cliente (CPF,NOME,ENDERECO1,ENDERECO2,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA) VALUES ('3623344710','Marcos Nougeuira','Av. Pastor Martin Luther King Junior','','Inhauma','Rio de Janeiro','RJ','22002012','1995-01-13',23,'M',110000,220000,1);
INSERT INTO tb_cliente (CPF,NOME,ENDERECO1,ENDERECO2,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA) VALUES ('50534475787','Abel Silva ','Rua Humaitá','','Humaitá','Rio de Janeiro','RJ','22000212','1995-09-11',22,'M',170000,260000,0);
INSERT INTO tb_cliente (CPF,NOME,ENDERECO1,ENDERECO2,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA) VALUES ('5840119709','Gabriel Araujo','R. Manuel de Oliveira','','Santo Amaro','São Paulo','SP','80010221','1985-03-16',32,'M',140000,210000,1);
INSERT INTO tb_cliente (CPF,NOME,ENDERECO1,ENDERECO2,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA) VALUES ('94387575700','Walber Lontra','R. Cel. Almeida','','Piedade','Rio de Janeiro','RJ','22000201','1989-06-20',28,'M',60000,120000,1);
INSERT INTO tb_cliente (CPF,NOME,ENDERECO1,ENDERECO2,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA) VALUES ('8719655770','Carlos Eduardo','Av. Gen. Guedes da Fontoura','','Jardins','São Paulo','SP','81192002','1983-12-20',34,'M',200000,240000,0);
INSERT INTO tb_cliente (CPF,NOME,ENDERECO1,ENDERECO2,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA) VALUES ('5648641702','Paulo César Mattos','Rua Hélio Beltrão','','Tijuca','Rio de Janeiro','RJ','21002020','1991-08-30',26,'M',120000,220000,0);
INSERT INTO tb_cliente (CPF,NOME,ENDERECO1,ENDERECO2,BAIRRO,CIDADE,ESTADO,CEP,DATA_NASCIMENTO,IDADE,SEXO,LIMITE_CREDITO,VOLUME_COMPRA,PRIMEIRA_COMPRA) VALUES ('492472718','Eduardo Jorge','R. Volta Grande','','Tijuca','Rio de Janeiro','RJ','22012002','1994-07-19',23,'M',75000,95000,1);

INSERT INTO tb_produtos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1040107','Light - 350 ml - Melância','Lata','350 ml','Melância',4.555);
INSERT INTO tb_produtos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1037797','Clean - 2 Litros - Laranja','PET','2 Litros','Laranja',16.008);
INSERT INTO tb_produtos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1000889','Sabor da Montanha - 700 ml - Uva','Garrafa','700 ml','Uva',6.309);
INSERT INTO tb_produtos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1004327','Videira do Campo - 1,5 Litros - Melância','PET','1,5 Litros','Melância',19.51);
INSERT INTO tb_produtos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1088126','Linha Citros - 1 Litro - Limão','PET','1 Litro','Limão',7.004);
INSERT INTO tb_produtos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('544931','Frescor do Verão - 350 ml - Limão','Lata','350 ml','Limão',2.4595);
INSERT INTO tb_produtos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1078680','Frescor do Verão - 470 ml - Manga','Garrafa','470 ml','Manga',5.1795);
INSERT INTO tb_produtos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1042712','Linha Citros - 700 ml - Limão','Garrafa','700 ml','Limão',4.904);
INSERT INTO tb_produtos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('788975','Pedaços de Frutas - 1,5 Litros - Maça','PET','1,5 Litros','Maça',18.011);
INSERT INTO tb_produtos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1002767','Videira do Campo - 700 ml - Cereja/Maça','Garrafa','700 ml','Cereja/Maça',8.41);
INSERT INTO tb_produtos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('231776','Festival de Sabores - 700 ml - Açai','Garrafa','700 ml','Açai',13.312);
INSERT INTO tb_produtos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('479745','Clean - 470 ml - Laranja','Garrafa','470 ml','Laranja',3.768);
INSERT INTO tb_produtos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1051518','Frescor do Verão - 470 ml - Limão','Garrafa','470 ml','Limão',3.2995);
INSERT INTO tb_produtos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1101035','Linha Refrescante - 1 Litro - Morango/Limão','PET','1 Litro','Morango/Limão',9.0105);
INSERT INTO tb_produtos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('229900','Pedaços de Frutas - 350 ml - Maça','Lata','350 ml','Maça',4.211);
INSERT INTO tb_produtos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1086543','Linha Refrescante - 1 Litro - Manga','PET','1 Litro','Manga',11.0105);
INSERT INTO tb_produtos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('695594','Festival de Sabores - 1,5 Litros - Açai','PET','1,5 Litros','Açai',28.512);
INSERT INTO tb_produtos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('838819','Clean - 1,5 Litros - Laranja','PET','1,5 Litros','Laranja',12.008);
INSERT INTO tb_produtos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('326779','Linha Refrescante - 1,5 Litros - Manga','PET','1,5 Litros','Manga',16.5105);
INSERT INTO tb_produtos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('520380','Pedaços de Frutas - 1 Litro - Maça','PET','1 Litro','Maça',12.011);
INSERT INTO tb_produtos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1041119','Linha Citros - 700 ml - Lima/Limão','Garrafa','700 ml','Lima/Limão',4.904);
INSERT INTO tb_produtos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('243083','Festival de Sabores - 1,5 Litros - Maracujá','PET','1,5 Litros','Maracujá',10.512);
INSERT INTO tb_produtos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('394479','Sabor da Montanha - 700 ml - Cereja','Garrafa','700 ml','Cereja',8.409);
INSERT INTO tb_produtos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('746596','Light - 1,5 Litros - Melância','PET','1,5 Litros','Melância',19.505);
INSERT INTO tb_produtos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('773912','Clean - 1 Litro - Laranja','PET','1 Litro','Laranja',8.008);
INSERT INTO tb_produtos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('826490','Linha Refrescante - 700 ml - Morango/Limão','Garrafa','700 ml','Morango/Limão',6.3105);
INSERT INTO tb_produtos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('723457','Festival de Sabores - 700 ml - Maracujá','Garrafa','700 ml','Maracujá',4.912);
INSERT INTO tb_produtos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('812829','Clean - 350 ml - Laranja','Lata','350 ml','Laranja',2.808);
INSERT INTO tb_produtos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('290478','Videira do Campo - 350 ml - Melância','Lata','350 ml','Melância',4.56);
INSERT INTO tb_produtos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('783663','Sabor da Montanha - 700 ml - Morango','Garrafa','700 ml','Morango',7.709);
INSERT INTO tb_produtos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('235653','Frescor do Verão - 350 ml - Manga','Lata','350 ml','Manga',3.8595);
INSERT INTO tb_produtos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1002334','Linha Citros - 1 Litro - Lima/Limão','PET','1 Litro','Lima/Limão',7.004);
INSERT INTO tb_produtos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1013793','Videira do Campo - 2 Litros - Cereja/Maça','PET','2 Litros','Cereja/Maça',24.01);
INSERT INTO tb_produtos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1096818','Linha Refrescante - 700 ml - Manga','Garrafa','700 ml','Manga',7.7105);
INSERT INTO tb_produtos (PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1022450','Festival de Sabores - 2 Litros - Açai','PET','2 Litros','Açai',38.012);

/*Selecione todos os campos da tabela de clientes, vai mostrar os registros da tabela cliente*/
SELECT * FROM tb_cliente;


SELECT CPF, NOME, ENDERECO1, ENDERECO2, BAIRRO, CIDADE, ESTADO, CEP, DATA_NASCIMENTO, IDADE, SEXO, LIMITE_CREDITO, VOLUME_COMPRA, PRIMEIRA_COMPRA FROM tb_cliente;

/*Nesse caso quero que somente apareça na tela os campos nome e cpf da tabela cliente*/
SELECT cpf, nome FROM tb_cliente;

/*Nesse caso quero que somente apareça na tela os 5 primeiros registros do campos nome e cpf da tabela cliente*/
SELECT cpf, nome FROM tb_cliente LIMIT 5;

/*Nesse caso eu quero que apareca na tela os registros dos campos cpf e nome, no caso estou dando um apelido para o campo "cpf" de "cpf_cliente" e para o campo "nome" estou apelidando para "nome_cliente"*/
/*Nesse caso estou dando um alians que e um nome fantasia que eu vou atribuir ao campo*/
SELECT cpf AS cpf_cliente, nome AS nome_cliente FROM tb_cliente;

/*Não e preciso selecionar os campos na ordem que foi criado a tabela para que sejá mostrado os registros na tela*/
/*O comando "select" permite selecionar/mostrar os campos na ordem que eu coloquei*/
SELECT nome, cpf, sexo, idade, data_nascimento from tb_cliente;

SELECT * FROM tb_produtos;

SELECT matricula, nome FROM tb_de_vendedores;

/*Estou filtrando, ou seja, quero mostrar na tela somente o registro que tenha o numero de matricula igual a "544931"*/
SELECT * FROM tb_produtos WHERE produto = '544931';

/*Estou filtrando, ou seja, quero mostrar na tela somente o registro que seja da cidade "Rio de Janeiro"*/
SELECT * FROM tb_cliente WHERE cidade = 'Rio de Janeiro';

/*Estou filtrando, ou seja, quero mostrar na tela somente o registro que tenham o sabor igual a "Limão"*/
SELECT * FROM tb_produtos WHERE sabor = 'Limão';

/*Alterando o registros que tem sabor de "Limão" para o sabor "Citrico", só alterei os sabores*/
UPDATE tb_produtos SET sabor = 'Cítricos' WHERE sabor = 'Limão';

/*Estou filtrando, ou seja, quero mostrar na tela somente o registro que tenham o sabor igual a "Cítricos"*/
SELECT * FROM tb_produtos WHERE sabor = 'Cítricos';

SELECT * FROM tb_de_vendedores;

/*Estou filtrando, ou seja, quero mostrar na tela somente o registro que tenham o nome igual a Cláudia Morais */
SELECT * FROM tb_de_vendedores WHERE nome = 'Cláudia Morais';

/*Estou filtrando, ou seja, quero mostrar na tela somente o registro que tenham a idade igual a 22 anos */
SELECT * FROM tb_cliente WHERE idade = 22;  /*Como o número 22 e inteiro não e necessario colocar aspas*/

/*Estou filtrando, ou seja, quero mostrar na tela somente o registro dos clientes que tenham a idade maior que 22 anos */
SELECT * FROM tb_cliente WHERE idade > 22;

/*Estou filtrando, ou seja, quero mostrar na tela somente o registro dos clientes que tenham a idade menor que 22 anos */
SELECT * FROM tb_cliente WHERE idade < 22;

/*Estou filtrando, ou seja, quero mostrar na tela somente o registro dos clientes que tenham a idade menor e igual a  22 anos */
SELECT * FROM tb_cliente WHERE idade <= 22;

/*Estou filtrando, ou seja, quero mostrar na tela somente o registro dos clientes que a idade seja diferente de 22 anos
Vai mostrar todas as idades menos a idade de 22 anos */
SELECT * FROM tb_cliente WHERE idade <> 22; /* O simbolo "<>" significa diferente*/

/*Para o mysql existe internamente uma ordem não somente dos números, mas das letras também que seria na ordem alfabetica. Para o mysql o "b" e maior que "a" , o "c" e maior
que "b", o "x" e maior que "r".
Quando o Mysql encontra dois nomes que inicia com a mesma letra, ele usa com criterio a segunda letra;
Quando o Mysql encontra dois nomes que inicia com a mesma letra e a segunda letra também e igual, ele usa com criterio a terceira letra;*/
SELECT * FROM tb_cliente WHERE nome > 'Fernando Cavalcante'; /*Vai ser mostrado na tela todos os nomes que começam com "F" para cima, ou seja, "F", "G", "H", "I"  e etc.
															 /*Caso tenha o nome "Fatima" não será mostrado na tela, pois empataria com o "F" de Fernando, quando comparasse
                                                             a letra "A" de F"A"TIMA  com a letra "E" F"E"RNANDO, o nome fatima ficaria antes então não entraria na condição, 
                                                             ou seja, não seria mostrado na tela*/
                                                             
                                                             
SELECT * FROM tb_cliente WHERE nome >= 'Fernando Cavalcante'; 

/*Estou filtrando, ou seja, quero mostrar na tela somente o registro dos clientes que tenham o nome diferente de "'Fernando Cavalcante", ou seja, não vai aparecer o nome 
"Fernando" na consulta */
SELECT * FROM tb_cliente WHERE nome <> 'Fernando Cavalcante'; 


/*Ao executar esse comando  o resultado é vazio, isso acontece pelo fato do campo "preco_lista" ser do tipo FLOAT, 
um ponto flutuante e, em razão disso, não é possível encontrar exatamente o resultado inserido na condição. 
O recomendado para trabalhar com condições de igual (=), menor ou igual (<=) ou, maior ou igual (>=) e diferente
 (<>) seria o tipo DECIMAL, visto que o MySQL consegue encontrar o número exato na busca.
Para números do tipo FLOAT, é possível usar apenas os símbolos de maior (>) e menor (<) e diferente (<>), porém o produto com o preço 16.008 também irá constar justamente pelo fato do MySQL não encontrar o valor exato.*/
SELECT * FROM tb_produtos WHERE preco_de_lista  = 16.008;

/*Aqui vai mostrar todos os precos dos produtos que forem maior que "16.008"*/
SELECT * FROM tb_produtos WHERE preco_de_lista  > 16.008;

/*Aqui vai mostrar todos os precos dos produtos que forem menor que "16.008"*/
SELECT * FROM tb_produtos WHERE preco_de_lista  < 16.008;

/*Vou listar todos os produtos que o preço esteja entre 16.007 e 16.009*/
SELECT * FROM tb_produtos WHERE preco_de_lista between 16.007 and 16.009;

SELECT * FROM tb_de_vendedores;

DESCRIBE tb_de_vendedores;

/*Vou listar todos os vendedores que possuem comissão maior que 10%.*/
SELECT * FROM tb_de_vendedores WHERE percentual_comissao > 0.10;

/*Filtrando os clientes que nasceram no dia 13 de janeiro de 1995*/
SELECT * FROM tb_cliente WHERE data_nascimento = '1995-01-13';

/*Filtrando os clientes que nasceram depois da data 13 de janeiro de 1995*/
SELECT * FROM tb_cliente WHERE data_nascimento > '1995-01-13';

/*Filtrando os clientes que nasceram antes da data 13 de janeiro de 1995*/
SELECT * FROM tb_cliente WHERE data_nascimento < '1995-01-13';

/*Filtrando os clientes que nasceram antes da data ou igual 13 de janeiro de 1995*/
SELECT * FROM tb_cliente WHERE data_nascimento <= '1995-01-13';

/*Quero listar todos os cliente, exceto os clientes que nasceram na data 13 de janeiro de 1995*/
SELECT * FROM tb_cliente WHERE data_nascimento <> '1995-01-13';

/*Aqui estou pegando o ano de uma data utilizando uma função*/
/*Vai retornar somente clientes que nasceram no ano de 1995*/
SELECT * FROM tb_cliente WHERE YEAR(data_nascimento) = 1995; /*O resultado dessa função e um número inteiro, por isso que o "1995" está sem aspas*/

/*Vai listar todos os clientes que fazem nasceram no mês outubro*/
SELECT * FROM tb_cliente WHERE MONTH(data_nascimento) = 10;

SELECT * FROM tb_de_vendedores;

/*Mostrar na tela todos os vendedores que foram admitidos na empresa a partir de 2016*/
SELECT * FROM tb_de_vendedores WHERE YEAR(data_admissao) >= 2016;

/*--------FILTROS COMPOSTOS--------*/

/*Vou listar todos os produtos que o preço esteja entre 16.007 e 16.009, ou seja, quero todos os produtos que tiverem o preco maior ou igual 16.007 e menor ou igual  16.009*/
SELECT * FROM tb_produtos WHERE preco_de_lista BETWEEN 16.007 AND 16.009;

/*Vou listar todos os produtos que o preço esteja entre 16.007 e 16.009, ou seja, quero todos os produtos que tiverem o preco maior ou igual 16.007 e menor ou igual  16.009*/
SELECT * FROM tb_produtos WHERE preco_de_lista >= 16.007 AND preco_de_lista <= 16.009;

/*Quero listar na tela todos os clientes que tenham a idade maior ou igual a 18 anos e menor igual a 22 anos*/
SELECT * FROM tb_cliente WHERE idade BETWEEN 18 AND 22;

/*Quero listar na tela todos os clientes que tenham a idade maior ou igual a 18 anos e menor igual a 22 anos*/
SELECT * FROM tb_cliente WHERE idade >= 18 AND idade <= 22;

/*Quero listar na tela todos os clientes que tenham a idade maior ou igual a 18 anos e menor igual a 22 anos e seja do sexo masculino*/
SELECT * FROM tb_cliente WHERE idade >= 18 AND idade <= 22 AND sexo = 'M';

/*Vai listar todos os clientes que mora na cidade do Rio de Janeiro e todos os clientes que moram  no bairro Jardins em São Paulo.Vai mostra os dois resultados*/
SELECT * FROM tb_cliente WHERE cidade = 'Rio de Janeiro' OR bairro = 'Jardins'; /*O "OR" significa "OU", na consulta vai retorna os dois requisitos  */

SELECT * FROM tb_cliente WHERE cidade = 'Rio de Janeiro' AND bairro = 'Jardins';/*O "AND" significa "E", vai retornar na consulta  clientes que moram no Rio de Janeiro e
																				clientes que moram no bairro Jardins. No caso como não existe na cidade do Rio de Janeiro 
                                                                                um bairro chamado Jardins, vai retornar vazio a consulta*/
                                                                                
																			
SELECT * FROM tb_cliente WHERE (idade >= 18 AND idade <= 22 AND sexo = 'M')
OR
('Rio de Janeiro' AND bairro = 'Jardins');

SELECT * FROM tb_de_vendedores WHERE de_ferias = 1 and YEAR(data_admissao) < 2016 ;

SELECT * FROM tb_de_vendedores WHERE YEAR(data_admissao) < 2016 AND de_ferias = 1;

describe tb_de_vendedores;


                                                                                