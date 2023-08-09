SELECT * FROM TABELA_DE_CLIENTES;

INSERT INTO TABELA_DE_CLIENTES 
VALUES 
    ('00384393555', 'Maria Clara', 'Rua Projetada A1', 'Numero 233', 'Copacabana', 'Rio de janeiro', 'RJ', '20000000', '1975-03-21', 47, 'F', 20000, 30000.30, 'TRUE');

INSERT INTO TABELA_DE_CLIENTES  
VALUES 
    ('00384399999', 'Bruno da Silva', 'Rua Projetada 29', 'Numero 273', 'Caricica', 'Rio de janeiro', 'RJ', '20050000', '1975-03-21', 62, 'M', 30000, 40000.30, 1);

INSERT INTO TABELA_DE_CLIENTES
VALUES 
    ('00384393666', 'M�rcia Pereira', 'Rua Projetada A1', 'Numero 233', 'Copacabana', 'Rio de janeiro', 'RJ', '20000000', '1975-03-21', 47, 'F', 20000, 30000.30, 'FALSE');


/*O campo "primeira_compra" � do tipo bit, podemos represent�-lo tanto com 0 ou 1, quanto com True or False.
Lembrando que esta segunda op��o precisa estar escrita em letras mai�sculas e aspas simples.
Quando escrevemos a palavra "True" no campo bit, ele entende que significa verdadeiro e usa o n�mero 1 na tabela.
Ao escrevermos "False" no comando, no banco, ele ser� representado por zero.

Ent�o, no campo l�gico bit, podemos usar os n�meros �1 ou 0� ou as palavras �True ou False�, entre aspas simples e em letras mai�sculas.*/