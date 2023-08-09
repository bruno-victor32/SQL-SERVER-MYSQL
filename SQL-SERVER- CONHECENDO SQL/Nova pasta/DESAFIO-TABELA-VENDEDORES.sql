USE SUCOS_VENDAS;

SELECT * FROM TABELA_DE_VENDEDORES;

/*1) Apague a tabela existente.*/
DROP TABLE TABELA_DE_VENDEDORES;

/*2) Crie uma nova TABELA_DE_VENDEDORES. Algumas informações:

Nome da tabela deve ser TABELA DE VENDEDORES.

Vendedor tem como chave o número interno da matrícula (Nome do campo MATRICULA) 
que deve ser um texto de 5 posições que não pode ser NULL.

O nome do vendedor (Nome do campo NOME) deve ser um texto de 100 posições.

Cidade de atuação (Nome do campo CIDADE) deve ser um texto de 100 posições.

% de comissão. Este campo (Nome do campo PERCENTUAL COMISSÃO) representa quantos % 
de comissão o vendedor ganha sobre cada venda e não pode ser NULL.

Crie um campo chamado DATA INICIO que será a data em que o vendedor começou a trabalhar na empresa.
Este campo não pode ser NULL.

Crie um campo lógico chamado TEM_DEPENDENTE que será TRUE se o vendedor possuir dependentes e FALSE se não possuir dependentes.
*/

CREATE TABLE TABELA_DE_VENDEDORES(
    MATRICULA varchar(5) NOT NULL,
    NOME varchar(100) NULL,
    CIDADE varchar(100) NULL,
    PERCENTUAL_COMISSÃO FLOAT NOT NULL,
    DATA_INICIO date NOT NULL,
    TEM_DEPENDENTE BIT);


/*3) Inclua o vendedor Alberto de Sá Verneck, matrícula 00239, atua na cidade de São Paulo, 
com comissão de 8%, admitido em 05/06/2020 e possui dependentes.*/
INSERT INTO TABELA_DE_VENDEDORES (NOME, MATRICULA, CIDADE,PERCENTUAL_COMISSÃO, DATA_INICIO,TEM_DEPENDENTE)
VALUES
('Alberto de Sá Verneck','00239','São Paulo', 0.08,'2020-06-05',1);

/*inclua um novo vendedor usando no campo lógico a forma alternativa.
Nome Marcela Almeida, matrícula 00240, atua no Rio de Janeiro, com comissão de 7%, admitido em 12/01/2021 e não possui dependentes.*/
INSERT INTO TABELA_DE_VENDEDORES (NOME, MATRICULA, CIDADE,PERCENTUAL_COMISSÃO, DATA_INICIO,TEM_DEPENDENTE)
VALUES
('Marcela Almeida','00240','Rio de Janeiro', 0.07,'2021-01-12','FALSE');

/*4) Visualize a tabela.*/
SELECT * FROM TABELA_DE_VENDEDORES;


