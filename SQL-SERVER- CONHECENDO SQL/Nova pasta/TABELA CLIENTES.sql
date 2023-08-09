USE SUCOS_VENDAS;

SELECT * FROM TABELA_DE_CLIENTES;

/*Alterar a coluna "CPF" para que ela não aceite nulos.*/
ALTER TABLE TABELA_DE_CLIENTES ALTER COLUMN CPF CHAR(11) NOT NULL; 

/*Criar a chave primária.*/
ALTER TABLE TABELA_DE_CLIENTES ADD CONSTRAINT PK_TABELA_DE_CLIENTES
PRIMARY KEY CLUSTERED (CPF);

/*Incluindo dados na tabela. Não colocaremos o nome dos campos, nós adicionaremos os dados na mesma ordem em que os campos estão declarados. */
INSERT INTO TABELA_DE_CLIENTES
VALUES 
    ('00384393431', 'João da Silva', 'Rua Projetada A1', 'Numero 233', 'Copacabana', 'Rio de janeiro', 'RJ', '20000000', '1965-03-21', 57, 'M', 20000, 30000.30, 1);

