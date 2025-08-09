CREATE DATABASE DB_TESTE;

DROP TABLE TBL_CLIENTES;

CREATE TABLE TBL_CLIENTES(
ID INT PRIMARY KEY IDENTITY(1,1),
NOME VARCHAR(50),
email VARCHAR(50),
data_nascimento DATE
);

USE DB_TESTE;

INSERT INTO TBL_CLIENTES ( NOME, email, data_nascimento)
VALUES
('João Fernando', '	joao@gmail.com','2000-01-01'),
('Maria Carvalho','maria@gmail.com','2001-10-01'),
('Bruna dos Santos','bruna@gmail.com','2001-10-01'),
('Pedro da Silva','pedro@gmail.com','2001-11-01'),
('Tiago','tiago@gmail.com','2001-10-02'),
('Bruno Henrique', 'bruno@gmail.com','2000-01-01'),
('Pedro Pereira','pedro@gmail.com','2001-10-01'),
('Fernando Luiz','fernando@gmail.com','1999-02-03'),
('Luana Pereira','luana@gmail.com','2005-01-30'),
('Bruno Henrique', 'bruno@gmail.com','1970-07-09'),
('Alan Dias','alan@gmail.com','1963-04-01'),
('Michele Braga','michele@gmail.com','1999-11-01');

SELECT * FROM TBL_CLIENTES;

/*Suponhamos que seja necessário trazer na consulta todos os clientes 
ordenados pelo nome.
As informações foram ordenadas de forma ascendente/ALFABETICAS, ou seja,
ao não informar o parâmetro de ordenação, por padrão o valor ASC é acionado*/
SELECT * FROM TBL_CLIENTES
ORDER BY NOME;

/*Suponhamos que seja necessário trazer na consulta todos os clientes 
ordenados pelo nome.
As informações foram ordenadas de forma descendente/ALFABETICAS de forma inversa, ou seja,
vai primeiro mostrar os nome com Z e por ultimo os que começam com A */
SELECT * FROM TBL_CLIENTES
ORDER BY NOME DESC;

/*Neste exemplo o resultado será ordenado de forma ascendente,ou sejá,
do menor ID para o Maior*/
SELECT * FROM TBL_CLIENTES
ORDER BY ID ASC;

/*Neste exemplo o resultado será ordenado de forma descendente,ou sejá,
do maior ID para o Menor*/
SELECT * FROM TBL_CLIENTES
ORDER BY ID DESC;

--Consulta onde o resultado será ordenado tanto pelo nome quanto pela data de nascimento.
/*Consulta onde iremos primeiramente ordenar as consultas pelo nome em seguida pela data de 
nascimento*/
SELECT NOME, data_nascimento
FROM TBL_CLIENTES
ORDER BY NOME, data_nascimento ASC;

SELECT NOME, data_nascimento
FROM TBL_CLIENTES
ORDER BY NOME ASC;

SELECT NOME, data_nascimento
FROM TBL_CLIENTES
ORDER BY data_nascimento ASC;
