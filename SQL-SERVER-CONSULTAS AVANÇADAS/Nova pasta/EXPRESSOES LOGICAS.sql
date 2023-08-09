USE SUCOS_FRUTAS;

-- OR  OU
-- AND E
-- REGRAS:


SELECT * FROM TABELA_DE_PRODUTOS;

/*eu quero saber qual produto tem o sabor manga e o tamanho 470 ml
Aqui nesse caso quero o resultado do produto que tenha o tamanho de
470 ml e ao mesmo tempo, seja do sabor manga*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Manga' AND TAMANHO = '470 ml';

/*Nessa consulta abaixo quero saber qual produto e do tamanho de 470 ml
ou e de sabor manga.
Vai retornar um produto que tenha sabor de manga ou um produto que seja de tamanho 470 ml*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Manga' OR TAMANHO = '470 ml';

/*Aqui vai mostrar todos os produtos que n�o do sabor de Manga e que sejam do tamanho de 470 ml
Nessa situa��o abaixo, o NOT esta sendo aplicado somente no "SABOR = 'Manga'"*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE NOT SABOR = 'Manga' AND TAMANHO = '470 ml';

--Aqui vai mostrar todos os produtos que n�o s�o do sabor de manga  ou os produtos que tenham tamanho de 470 ml
SELECT * FROM TABELA_DE_PRODUTOS WHERE NOT SABOR = 'Manga' OR TAMANHO = '470 ml';

/*N�s colocamos aqui um abre e um fecha par�nteses, para mostrar para o SQL que o not est� 
sendo aplicado sobre esta express�o toda e n�o somente sobre a primeira parcela da express�o:
Aqui vai aparecer todos os produtos, menos os que sejam do tamanho 470 ml e ao mesmo tempo sejam do sabor de manga*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE NOT (SABOR = 'Manga' AND TAMANHO='470 ml');

/*Aqui vai aparecer todos os produtos, menos os produtos que seja do sabor de manga ou que tenham o tamanho de 470 ml*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE NOT (SABOR = 'Manga' OR TAMANHO='470 ml');

/*Comparando os resultados*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE NOT (SABOR = 'Manga' AND TAMANHO='470 ml');
SELECT * FROM TABELA_DE_PRODUTOS WHERE NOT SABOR = 'Manga' AND TAMANHO = '470 ml';

--Mostre na tela os produtos que seja do sabor de Manga OU sabor de Laranja OU sabor de Melancia
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Manga' OR SABOR = 'Laranja' OR SABOR = 'Melancia';

/*Quando eu tenho uma consulta com varios OR, igual essa consulta acima, posso fazer da seguinte maneira
Quanto essa consulta abaixo, quanto essa consulta acima s�o iguais*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR IN ('Manga', 'Laranja', 'Melancia');

/*Quero mostrar na tela todos os produtos que sejam do sabor manda OU laranja OU Melancia E que sejam do tamanho de 1 Litro*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE (SABOR  in ('Manga', 'Laranja', 'Melancia')) AND TAMANHO = '1 Litro';

--Quero que mostre na tela todos os clientes que morem na cidade do Rio de Janeiro ou que morem na cidade de S�o Paulo
SELECT * FROM TABELA_DE_CLIENTES WHERE CIDADE IN ('Rio de Janeiro', 'Sao Paulo');

--Quero que mostre na tela todos os clientes que morem na cidade do Rio de Janeiro ou que morem na cidade de S�o Paulo E que tenham a idade maior ou igual a 20 anos
SELECT * FROM TABELA_DE_CLIENTES WHERE CIDADE IN ('Rio de Janeiro', 'Sao Paulo') AND IDADE >= 20;

--Quero que mostre na tela todos os clientes que morem na cidade do Rio de Janeiro ou que morem na cidade de S�o Paulo E que tenham  idade entre 20 a 25
SELECT * FROM TABELA_DE_CLIENTES WHERE CIDADE IN ('Rio de Janeiro', 'Sao Paulo') AND (IDADE >= 20 AND IDADE <= 25);

-- Tamb�m e poss�vel utilizar o between, pois ele permite eu fazer a mesma consulta de cima, ou seja, vou ter os mesmos resultados
SELECT * FROM TABELA_DE_CLIENTES WHERE CIDADE IN ('Rio de Janeiro', 'Sao Paulo') AND (IDADE BETWEEN 20 AND 25);
