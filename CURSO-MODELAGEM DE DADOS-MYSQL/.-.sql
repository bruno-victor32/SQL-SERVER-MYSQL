/*Criando um banco de dados*/
CREATE DATABASE db_Biblioteca;

/*Verificando os bancos de dados existentes*/
SHOW DATABASES; 

/*O comando USE instrui o SGBDR a utilizar o banco de dados especificado para rodar os comandos.*/
USE db_Biblioteca;

/*Comando para visualizar o banco de dados selecionado no momento*/
SELECT DATABASE();

/*Exluindo o banco de dados*/
DROP DATABASE db_Biblioteca;

/*Criando tabelas no Banco de Dados para os livros*/
CREATE TABLE IF NOT EXISTS tbl_livro (/*Crie essa tabela caso ela não exista*/ 
ID_Livro SMALLINT AUTO_INCREMENT PRIMARY KEY,
nome_Livro VARCHAR(70) NOT NULL,/*Not Null e uma coluna que não aceitas valores nulos,o campo deve possuir um valor*/
ISBN13 CHAR(13),
ISBN10 CHAR(10),
ID_Categoria SMALLINT,
ID_Autor SMALLINT NOT NULL,
Data_Pub DATE NOT NULL,
Preco_Livro DECIMAL(6,2) NOT NULL
);

/*Criando tabelas no Banco de Dados para armazenar os dados dos Autores*/
CREATE TABLE tbl_autores (
ID_Autor SMALLINT PRIMARY KEY,
Nome_Autor VARCHAR(50) NOT NULL,
sobrenome_Autor VARCHAR(60) NOT NULL
);

/*Criando tabelas no Banco de Dados para armazenar as categorias de livros*/
CREATE TABLE tbl_categorias (
ID_Categoria SMALLINT PRIMARY KEY,
Categoria VARCHAR(30) NOT NULL
);

/*Criando tabela no Banco de Dados para armazenar os dados das editoras*/
CREATE TABLE tbl_editoras (
ID_Editora SMALLINT PRIMARY KEY AUTO_INCREMENT,
Nome_Editora VARCHAR(50) NOT NULL
);

/*O auto incremento permite que um número único seja gerado quando um novo 
registro é inserido em uma tabela.*/

/*Tabela de Teste para Estudar a utilização do "auto incremento"*/

CREATE TABLE tbl_teste_incremento (
Codigo SMALLINT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(20) NOT NULL
) AUTO_INCREMENT = 15;/*Quero que o valor da coluna "Codigo" inicie em 15*/

INSERT INTO tbl_teste_incremento (Nome) VALUES ('Ana');
INSERT INTO tbl_teste_incremento (Nome) VALUES ('Maria');
INSERT INTO tbl_teste_incremento (Nome) VALUES ('Julia');
INSERT INTO tbl_teste_incremento (Nome) VALUES ('Joana');

SELECT * FROM tbl_teste_incremento;

/*verificar o valor de auto_incremento mais atual armazenado na tabela tbl_teste_incremento no banco de dados*/
SELECT MAX(Codigo)
FROM tbl_teste_incremento;

/*Alterando o valor do auto_incremento do proximo registro a ser armazendo na tabela para o valor 90*/
ALTER TABLE tbl_teste_incremento
AUTO_INCREMENT = 90;

INSERT INTO tbl_teste_incremento (Nome) VALUES ('Bruno');

/*Atributo UNSIGNED na criação da tabela impede que valores negativos sejam armazenados na coluna
  Atributo ZEROFILL faz com que o número seja exibido com preenchimento de zeros à esquerda em uma consulta*/

/*Excluindo a coluna ID_autor da tabela tbl_livro;*/
ALTER TABLE tbl_livro
DROP COLUMN ID_autor;

SELECT * FROM tbl_livro;

