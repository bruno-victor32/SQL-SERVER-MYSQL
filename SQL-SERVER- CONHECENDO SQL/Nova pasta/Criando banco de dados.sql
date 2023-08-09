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