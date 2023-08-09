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


