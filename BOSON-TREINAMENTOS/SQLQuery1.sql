--Criar um banco de dados chamado "db_Biblioteca"

-- ON PRIMARY indica a utilização do grupo de arquivos primarios do sql
--NO SQL SERVER sempre utilize aspas simples, para digitar textos strings

CREATE DATABASE db_Biblioteca ON PRIMARY (
NAME = db_Biblioteca,  --Nome
FILENAME ='C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\db_Biblioteca.MDF', --Localização do arquivo no disco e o nome do arquivo
SIZE = 6MB, --Tamanho do banco de dados, vai começar em 6MB
MAXSIZE=15MB, --Tamanho maximo do banco de dados
FILEGROWTH=10% --O banco de dados vai crescer de 10 em 10 por cento
);

--Deletando um Banco de Dados
DROP DATABASE db_Biblioteca;

--Selecionando o banco de dados
USE db_Biblioteca;

--Comando que informa o tamanho, taxa de crescimento e local do banco de dados
sp_helpdb db_Biblioteca;