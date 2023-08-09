					--CONSULTA SIMPLES DE UMA TABELA

USE SUCOS_FRUTAS;

/*Para visuzalizar todos os campos da tabela de clientes.*/
SELECT * FROM TABELA_DE_CLIENTES;

/*Visualizando somente os campos CPF, NOME, BAIRRO E CIDADE*/
SELECT CPF, NOME, BAIRRO, CIDADE FROM TABELA_DE_CLIENTES;

/*Utilizando um "alias/apelido" no campo CPF, NOME, BAIRRO e CIDADE*/
SELECT CPF AS IDENTIFICADOR, NOME AS NOME_DE_CLIENTE, BAIRRO, CIDADE FROM TABELA_DE_CLIENTES;

/*Outra maneira de fazer a mesma consulta acima
Na consulta abaixo eu tenho nome de cliente com o espaço entre as palavras, porque eu coloquei aqui meu abre e fecha colchetes*/
SELECT CPF AS IDENTIFICADOR, NOME AS [NOME DE CLIENTE], BAIRRO, CIDADE FROM TABELA_DE_CLIENTES;

/*Dando um apelido/alias chamado "TDC" a tabela de clientes
Para o campo eu uso a palavra "as", mas quando eu construo um alias para a tabela, eu tenho que suprimir/excluir o "as".*/
SELECT CPF AS IDENTIFICADOR, NOME AS [NOME DE CLIENTE], 
BAIRRO, CIDADE FROM TABELA_DE_CLIENTES  TDC;

/*Outra forma de utilizar apelidos/alias nas tabelas
Quando eu crio um alias para tabela, eu posso colocar o alias depois o nome do campo, por exemplo:*/
SELECT TDC.CPF, TDC.NOME, TDC. BAIRRO FROM TABELA_DE_CLIENTES TDC;

/*OBSERVAÇÃO:
Qual a diferença de usar com alias e sem alias aqui?
Nesse caso nenhuma, mas nós vamos ver lá na frente que eu posso ter uma consulta 
que utilize mais de uma tabela e haja campos em comum nessas tabelas, então o alias
nesse caso vai ser importante para eu poder diferenciar o campo que tem nome igual em tabelas diferentes.*/

/*E se eu quiser ver todo mundo, todos os campos, usando o asterisco e o alias, eu posso colocar assim:
Eu consigo olhar todos os campos da tabela TDC, porque eu estou usando aqui o alias*/
SELECT TDC.* FROM TABELA_DE_CLIENTES TDC;

/*eu não preciso, por exemplo, sempre usar o alias para diferenciar o campo de uma tabela ou outra, eu poderia, por exemplo, fazer isso daqui:
Aqui no caso eu não estou usando alias, mas eu estou colocando o próprio nome da tabela como se fosse um alias.*/
SELECT TABELA_DE_CLIENTES.CPF, TABELA_DE_CLIENTES.NOME 
FROM TABELA_DE_CLIENTES;


								--CONSULTA COM FILTRO

--WHERE  e como si fosse um filtro*/

/*Fazendo uma consulta e utilizando o filtro para que retorne somente o produto de codigo 290478*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE CODIGO_DO_PRODUTO = 290478;

/*Vai retornar somente os produtos que tem o sabor de laranja*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Laranja';

/*Consulta que vai retornar os produtos que a embalagem seja do tipo PET*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE EMBALAGEM = 'PET';



								--FILTROS QUANTITATIVOS

-- BETWEEN - Ver um valor entre um e outro

/*Vamos supor que eu queira ver somente os clientes que têm mais de 20 anos de idade*/
SELECT * FROM TABELA_DE_CLIENTES WHERE IDADE > 20;

/*ver quais são os clientes que têm menos de 20 anos de idade,*/
SELECT * FROM TABELA_DE_CLIENTES WHERE IDADE < 20;

/*Se eu quiser saber quantos clientes têm menos de 20 anos de idade, incluindo o 20, basta eu colocar o menor ou igual:*/
SELECT * FROM TABELA_DE_CLIENTES WHERE IDADE <= 20;

/*Se eu quiser saber quantos clientes têm menos de 18 anos de idade, incluindo o 18, basta eu colocar o menor ou igual:*/
SELECT * FROM TABELA_DE_CLIENTES WHERE IDADE < = 18;

/*ver quais são os clientes que têm menos de 18 anos de idade,*/
SELECT * FROM TABELA_DE_CLIENTES WHERE IDADE < 18;

/*E se eu quiser ver todo mundo exceto os que têm 18 anos, ou seja, quero ver todo mundo menos quem tem 18 anos.*/
SELECT * FROM TABELA_DE_CLIENTES WHERE IDADE <> 18;

/*
Para eu representar a data no SQL Server, basta eu escrever essa data no seguinte formato: ano, um traço, mês e um traço dia. 
Sempre o mês com dois dígitos e o dia com dois dígitos, ou seja, se eu quiser colocar uma data que represente janeiro, no lugar do MM eu vou colocar 01, não posso colocar 1, 01.

[07:42] Se for um dia, por exemplo, menor que 10, por exemplo, dia 8, eu tenho que colocar 08.*/

/*Vamos supor que eu queira saber todos os clientes que nasceram depois do dia 14 de novembro de 1995.*/
SELECT * FROM TABELA_DE_CLIENTES WHERE DATA_DE_NASCIMENTO >= '1995-11-14';

--Se eu quiser ver todos que nasceram antes do dia 14, eu venho aqui e coloco o menor
SELECT * FROM TABELA_DE_CLIENTES WHERE DATA_DE_NASCIMENTO <= '1995-11-14';

--Quero selecionar todo mundo na tabela de clientes onde o bairro seja maior ou igual que Lapa:
--O que isso significa? Que todos os bairros cuja ordem alfabética começarem depois da palavra Lapa, vão aparecer nessa consulta.
SELECT * FROM TABELA_DE_CLIENTES WHERE BAIRRO >= 'Lapa';


							--EXPRESSÕES LOGICAS

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

/*Aqui vai mostrar todos os produtos que não do sabor de Manga e que sejam do tamanho de 470 ml
Nessa situação abaixo, o NOT esta sendo aplicado somente no "SABOR = 'Manga'"*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE NOT SABOR = 'Manga' AND TAMANHO = '470 ml';

--Aqui vai mostrar todos os produtos que não são do sabor de manga  ou os produtos que tenham tamanho de 470 ml
SELECT * FROM TABELA_DE_PRODUTOS WHERE NOT SABOR = 'Manga' OR TAMANHO = '470 ml';

/*Nós colocamos aqui um abre e um fecha parênteses, para mostrar para o SQL que o not está 
sendo aplicado sobre esta expressão toda e não somente sobre a primeira parcela da expressão:
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
Quanto essa consulta abaixo, quanto essa consulta acima são iguais*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR IN ('Manga', 'Laranja', 'Melancia');

/*Quero mostrar na tela todos os produtos que sejam do sabor manda OU laranja OU Melancia E que sejam do tamanho de 1 Litro*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE (SABOR  in ('Manga', 'Laranja', 'Melancia')) AND TAMANHO = '1 Litro';

--Quero que mostre na tela todos os clientes que morem na cidade do Rio de Janeiro ou que morem na cidade de São Paulo
SELECT * FROM TABELA_DE_CLIENTES WHERE CIDADE IN ('Rio de Janeiro', 'Sao Paulo');

--Quero que mostre na tela todos os clientes que morem na cidade do Rio de Janeiro ou que morem na cidade de São Paulo E que tenham a idade maior ou igual a 20 anos
SELECT * FROM TABELA_DE_CLIENTES WHERE CIDADE IN ('Rio de Janeiro', 'Sao Paulo') AND IDADE >= 20;

--Quero que mostre na tela todos os clientes que morem na cidade do Rio de Janeiro ou que morem na cidade de São Paulo E que tenham  idade entre 20 a 25
SELECT * FROM TABELA_DE_CLIENTES WHERE CIDADE IN ('Rio de Janeiro', 'Sao Paulo') AND (IDADE >= 20 AND IDADE <= 25);

-- Também e possível utilizar o between, pois ele permite eu fazer a mesma consulta de cima, ou seja, vou ter os mesmos resultados
SELECT * FROM TABELA_DE_CLIENTES WHERE CIDADE IN ('Rio de Janeiro', 'Sao Paulo') AND (IDADE BETWEEN 20 AND 25);



						 ---USANDO O LIKE

USE SUCOS_FRUTAS;

--Vamos selecionar dois sabores específicos da nossa tabela de produtos:
SELECT * FROM TABELA_DE_PRODUTOS 
WHERE SABOR IN ('Lima/Limao', 'Morango/Limao');

-- Eu podia fazer essa mesma consulta acima da seguinte maneira:
--Vai retornar todos os produtos que tenham sabores que terminam com a palavra limão
SELECT  * FROM TABELA_DE_PRODUTOS 
WHERE SABOR LIKE '%Limao';

/*Estou fazendo uma consulta que retorne todos os produtos de sabores que terminem com a palavra Maca*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR LIKE '%Maca';

/*Estou fazendo uma consulta que retorne todos os produtos de sabores que iniciem com a palavra Morango*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR LIKE 'Morango%';

/*Estou fazendo uma consulta que retorne todos os produtos de sabores que iniciem com a palavra Morango e que sejam do tamanho PET*/
SELECT * FROM TABELA_DE_PRODUTOS 
WHERE (SABOR LIKE 'Morango%') AND (EMBALAGEM = 'PET');

--consulta que diga quantos clientes possuem o sobrenome Silva.
--Para mim não importa o nome que vem antes de 'Silva' e nem o nome que vem depois de 'Silva'
select * from TABELA_DE_CLIENTES where  NOME LIKE '%Silva%';


						--USANDO O DISTINCT


/*
O SELECT DISTINCT instrução é usada para retornar apenas valores distintos (diferentes).

Dentro de uma tabela, uma coluna geralmente contém muitos valores duplicados; 
e às vezes você deseja apenas listar os valores diferentes (distintos).

Trata-se de uma cláusula para eliminar repetições em consultas
*/

USE SUCOS_FRUTAS;

SELECT * FROM TABELA_DE_PRODUTOS;

/*Essa consulta vai retornar o campo embalagem da tabela de produtos*/
SELECT EMBALAGEM FROM TABELA_DE_PRODUTOS;

/*Saber quantas embalagens diferentes tem meus produtos*/
SELECT DISTINCT EMBALAGEM FROM TABELA_DE_PRODUTOS;

/*Vai retornar todos os tipos de embalagens que o produto de sabor maça tem */
SELECT DISTINCT EMBALAGEM FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Maca';


SELECT DISTINCT EMBALAGEM, SABOR FROM TABELA_DE_PRODUTOS;

/* Executando uma consulta para obter o número de sabores existentes*/
SELECT DISTINCT SABOR FROM TABELA_DE_PRODUTOS;


				--LIMITANDO A SAIDA DA CONSULTA

-- O comando TOP mostra os primeiros registros de uma tabela.

-- O comando TOP  limita sempre, mostrando as primeiras linhas daquela seleção que você está aplicando.
USE SUCOS_FRUTAS;

SELECT * FROM TABELA_DE_CLIENTES;

/*Dessa maneira vai mostrar na tela os 4 primeiros clientes */
SELECT TOP 4 * FROM TABELA_DE_CLIENTES;

SELECT * FROM TABELA_DE_PRODUTOS;

/*Quero que mostre na tela somente os 5 primeiros produtos que estão cadastrados na tabela de produtos*/
SELECT TOP 5 * FROM TABELA_DE_PRODUTOS;

/*Quero que mostre na tela somente os 2 primeiros produtos que estão cadastrados na tabela de produtos e que sejam do sabor Maça*/
SELECT TOP 2 * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Maca';

SELECT * FROM NOTAS_FISCAIS;

/*Listando as 10 primeiras vendas do dia 01/10/2017*/
SELECT TOP 10 * FROM NOTAS_FISCAIS WHERE DATA_VENDA = '2017-10-01';


								--ORDENANDO A SAIDA

-- ASC ASCENDENTE -   vai vir do menor para o maior
-- Quando eu estiver ordenando textos, menor para maior seria no sentido alfabético das letras, começando no A, terminando no Z.
-- Por padrão quando não colocamos "ASC" ou "DESC", significa que vai ser ASC

-- DESC DESCENDENTE - vai vir do maior para o menor
-- Quando eu estiver ordenando textos,maior para o menor começa no Z e termina no A

USE SUCOS_FRUTAS;

SELECT * FROM TABELA_DE_PRODUTOS;

/*Estou fazendo uma consulta que vai ser ordenada pelo preço do produto, como
não coloquei "Asc" ou "Desc", por padrão a consulta vai ser Asc, ou seja,
do menor preço para o maior preço*/
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY PRECO_DE_LISTA;

/*Estou fazendo uma consulta que vai ser ordenada pelo preço do produto, como
coloquei "Asc" a consulta vai ser do menor preço para o maior preço*/
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY PRECO_DE_LISTA ASC;

/*Estou fazendo uma consulta que vai ser ordenada pelo preço do produto, como
coloquei "Desc" a consulta vai ser do produto de maior preço para o menor preço*/
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY PRECO_DE_LISTA DESC;

/*Estou fazendo uma consulta que vai ser ordenada pelo nome do produto de forma descendente "Desc", e como o
campo que vou ordenar e do tipo texto vai ser do Z até o A*/
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY NOME_DO_PRODUTO DESC;

/*Estou fazendo uma consulta que vai ser ordenada pelo nome do produto de forma ascendente "ASC", e como o
campo que vou ordenar e do tipo texto vai ser do A até o Z,ou seja, no sentido alfabético das letras*/
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY NOME_DO_PRODUTO ;

/*Essa consulta terá o mesmo resultado da consulta de cima, porque mesmo
que não colocamos ASC, por padrão a consulta sempre será do
maior para o menor ou do sentido alfabetico das letras*/
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY NOME_DO_PRODUTO ASC;

/*Essa consulta vai ser da seguinte maneira.
Estou ordenando primeiro por embalagem de forma Ascendente,
nesse caso vai retornar primeiro os produtos que tiverem embalagem
do tipo "Garrafa" em seguida do tipo "Lata" e por ultimo "PET" porque
estou ordenando no sentido alfabetico das letras.
Dentro dos produtos que tem as embalagens do tipo Garrafa vou ordenar o 
nome deles de forma alfabetica ou seja do A ao Z
*/
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY EMBALAGEM, NOME_DO_PRODUTO;


/*Estou ordenando tanto as embalagens dos produtos do Z ate A,
quanto o nome do produto do Z ao A
Para ver o resultado inverso da consulta acima*/
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY EMBALAGEM DESC, NOME_DO_PRODUTO DESC;

/*Quero fazer uma consulta para saber os 5 produtos mais caros dentro dos produtos oferecidos pela empresa de suco de frutas.*/
SELECT TOP 5 * FROM TABELA_DE_PRODUTOS ORDER BY PRECO_DE_LISTA DESC;

/*Quero fazer uma consulta para saber os 5 produtos mais baratos dentro dos produtos oferecidos pela empresa de suco de frutas.*/
SELECT TOP 5 * FROM TABELA_DE_PRODUTOS ORDER BY PRECO_DE_LISTA ASC;


/*Desafio
Qual foi a maior venda do produto "Linha Refrescante - 1 Litro - Morango/Limao" em quantidade?*/
--1º Passo:buscar o código do produto "Linha Refrescante - 1 Litro - Morango/Limão":
SELECT * FROM TABELA_DE_PRODUTOS WHERE NOME_DO_PRODUTO = 'Linha Refrescante - 1 Litro - Morango/Limao';

--Com a consulta acima obtemos o resultado do código deste produto: '1101035'. Com esta informação em mãos, fazemos a consulta para achar a maior quantidade vendida deste produto:
SELECT * FROM ITENS_NOTAS_FISCAIS
WHERE CODIGO_DO_PRODUTO = 1101035 ORDER BY QUANTIDADE DESC;

--Constatou que a maior quantidade foi 99

-- Pergunto: Quantas vendas foram feitas com quantidade igual a 99 litros para o produto '1101035'?
SELECT COUNT(*) FROM ITENS_NOTAS_FISCAIS WHERE CODIGO_DO_PRODUTO = '1101035' AND QUANTIDADE = 99;

/*O total foi de 79.

Portanto, essa foi a quantidade de vendas feitas para o produto 1101035.*/

SELECT CODIGO_DO_PRODUTO FROM ITENS_NOTAS_FISCAIS;

--Verifique as quantidades totais de vendas de cada produto e ordene do maior para o menor.
-- Para obter o resultado esperado, nós podemos realizar uma consulta na tabela de itens notas fiscais, utilizando a função de agregação SUM para somar a quantidade e ordenar a saída utilizando o GROUP BY:
SELECT CODIGO_DO_PRODUTO, SUM(QUANTIDADE) AS SOMA_DAS_QUANTIDADES FROM ITENS_NOTAS_FISCAIS
 GROUP BY CODIGO_DO_PRODUTO 
 ORDER BY SUM(QUANTIDADE);

 --Agora, liste somente os produtos que venderam mais que 394000 unidades.
SELECT CODIGO_DO_PRODUTO, SUM(QUANTIDADE) AS SOMA_DAS_QUANTIDADES FROM ITENS_NOTAS_FISCAIS
GROUP BY CODIGO_DO_PRODUTO  HAVING SUM(QUANTIDADE) > 394000
ORDER BY SUM(QUANTIDADE) DESC;



						--AGRUPANDO LINHAS DA TABELA

						--GROUP BY - agrupar os resultados da saída da consulta.
-- SUM - Soma
-- AVG - Média
-- MAX - Máximo
-- MIN - Mínimo

USE SUCOS_FRUTAS

SELECT * FROM TABELA_DE_CLIENTES;

SELECT CIDADE, IDADE FROM TABELA_DE_CLIENTES ORDER BY CIDADE, IDADE;

/*Dentro do GROUP BY, o campo que está sendo somado não entra, só vai 
entrar aqui depois do group by os campos que são critérios de junção, de soma das linhas.
Nessa consulta abaixo quero saber a soma das idades dos clientes que moram 
em cada cidade*/
SELECT CIDADE, SUM(IDADE) AS SOMA_DAS_IDADE FROM TABELA_DE_CLIENTES GROUP BY CIDADE;

/*Nessa consulta abaixo quero saber a soma das idades e a soma dos limites de credito dos clientes que moram 
em cada cidade*/
SELECT CIDADE, SUM(IDADE) AS SOMA_IDADE, SUM(LIMITE_DE_CREDITO)  AS SOMA_DO_LIMITE_DE_CREDITO
FROM TABELA_DE_CLIENTES GROUP BY CIDADE;

/*Quero ver a media das idades dos clientes de cada cidade e a soma dos limites de creditos dos clientes de cada estado
Nesse caso a média de idade é 21 anos no Rio de Janeiro
e a media de idade e 27 em São Paulo*/
SELECT CIDADE, AVG(IDADE) AS MEDIA_DAS_IDADES, SUM(LIMITE_DE_CREDITO) AS SOMA_DOS_LIMITES_DE_CREDITO 
FROM TABELA_DE_CLIENTES GROUP BY CIDADE;

/*Contador de Linhas - Permite eu contar o número de clientes
que existem em uma cidade*/
SELECT CIDADE, COUNT(*) AS NUMERO_DE_CLIENTES FROM TABELA_DE_CLIENTES GROUP BY CIDADE;

/*Estou contando o numero de produtos  por embalagem, somente do sabor laranja*/
SELECT EMBALAGEM, COUNT(*) AS NUMERO_DE_PRODUTOS FROM TABELA_DE_PRODUTOS
WHERE SABOR = 'Laranja' GROUP BY EMBALAGEM;


					-- HAVING para filtrar campos agregados

USE SUCOS_FRUTAS;

SELECT * FROM TABELA_DE_CLIENTES;

--Quero listar os estado e saber a soma do limite de credito de todos os clientes de cada estado
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS SOMA_DO_LIMITE_DE_CREDITO
FROM TABELA_DE_CLIENTES GROUP BY ESTADO;

-- Quero listar os estados cuja a soma do limite de credito e maior que 900 000 
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS SOMA_LIMITE_DE_CREDITO
FROM TABELA_DE_CLIENTES
GROUP BY ESTADO
HAVING SUM(LIMITE_DE_CREDITO) >= 900000;

-- Na tabela de produtos quero ver o maior preco e o menor preco de todos os produtos por tipo de embalagem
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO, MIN(PRECO_DE_LISTA) AS MENOR_PRECO
FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM;

SELECT * FROM TABELA_DE_PRODUTOS;

-- Na tabela de produtos quero ver o maior preco e o menor preco dos produtos por tipo de embalagem e que o preço seja maior/igual a 10
SELECT EMBALAGEM,  MAX(PRECO_DE_LISTA) AS MAIOR_PRECO , MIN(PRECO_DE_LISTA) AS MENOR_PRECO  
FROM TABELA_DE_PRODUTOS WHERE PRECO_DE_LISTA >= 10 GROUP BY EMBALAGEM;

-- Na tabela de produtos quero ver o maior preco e o menor preco dos produtos por tipo de embalagem e que o preço seja menor/igual a 5
SELECT EMBALAGEM,  MAX(PRECO_DE_LISTA) AS MAIOR_PRECO , MIN(PRECO_DE_LISTA) AS MENOR_PRECO  
FROM TABELA_DE_PRODUTOS WHERE PRECO_DE_LISTA <= 5 GROUP BY EMBALAGEM;

--Nesta consulta somente quero os produtos que possuem o maior preço de lista mais do que 20 unidade monetária, 
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAXIMO_PRECO , MIN(PRECO_DE_LISTA) AS MENOR_PRECO  
FROM TABELA_DE_PRODUTOS WHERE PRECO_DE_LISTA >= 10 
GROUP BY EMBALAGEM HAVING MAX(PRECO_DE_LISTA) >=20;


					--CLASSIFICANDO OS CAMPOS

					/*
ESTRUTURA DE CLASSIFICAÇÃO

CASE WHEN <CONDIÇÃO> THEN <VALOR>
     WHEN <CONDIÇÃO> THEN <VALOR>
     WHEN <CONDIÇÃO> THEN <VALOR>
     ELSE <VALOR> END

Eu coloco CASE WHEN, uma condição lógica, 
que eu posso usar as mesmas coisas que eu 
utilizo lá no where, então eu posso colocar
várias condições lógicas entre and, entre or,
not, maior, menor, igual e assim por diante

 O else é: se nenhuma condição for satisfeita, 
 esse vai ser o valor final.

 WHEN = QUANDO
 THEN = ENTAO
 ELSE = SENÃO
*/

USE SUCOS_FRUTAS;

/*Quero que mostre na tela somente os produtos que sejam do sabor de Manga*/
SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA FROM TABELA_DE_PRODUTOS
WHERE SABOR = 'Manga';

/*Quero que mostre na tela somente os produtos que sejam do sabor de Manga
Quando o preco do produto for maior/igual a 12 então será considerado um produto caro
Quando o preco do produto for maior/igual a 7 e menor que 12 então será considerado um produto em conta
Se o produto não for "PRODUTO CARO" ou " PRODUTO EM CONTA" ele será um "PRODUTO BARATO"*/
SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
(CASE WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
	  WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
      ELSE 'PRODUTO BARATO' END) AS CLASSIFICACAO
FROM TABELA_DE_PRODUTOS
WHERE SABOR = 'Manga'
ORDER BY CLASSIFICACAO;

/*Quero que mostre na tela todos os produtos e 
quando o preco do produto for maior/igual a 12 então será considerado um produto caro
Quando o preco do produto for maior/igual a 7 e menor que 12 então será considerado um produto em conta
Se o produto não for "PRODUTO CARO" ou " PRODUTO EM CONTA" ele será um "PRODUTO BARATO"*/
SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
(CASE WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
	  WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
      ELSE 'PRODUTO BARATO' END) AS CLASSIFICACAO
FROM TABELA_DE_PRODUTOS
ORDER BY CLASSIFICACAO;  -- aqui esta sendo ordenado de forma alfabetica, estou utilizando o alias

/*Estou contando quantos produtos baratos, caros e em conta eu tenho*/
SELECT 
(CASE WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
	  WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
      ELSE 'PRODUTO BARATO' END) AS CLASSIFICACAO, COUNT(*) AS NUMERO_DE_PRODUTOS
FROM TABELA_DE_PRODUTOS
GROUP BY (CASE WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
	  WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
      ELSE 'PRODUTO BARATO' END);

-- O GROUP BY não aceita Alias

--DESAFIO
/*
Para cada cliente temos seus limites de crédito
mensais. Liste somente o nome dos clientes e os
classifique por:

Acima ou igual a 150.000 - Clientes grandes
Entre 150.000 e 110.000 - Clientes médios
Menores que 110.000 Clientes pequenos
*/

SELECT * FROM TABELA_DE_CLIENTES;

SELECT CPF, NOME, LIMITE_DE_CREDITO,
(CASE WHEN LIMITE_DE_CREDITO >= 150000 THEN 'CLIENTE GRANDE'
      WHEN LIMITE_DE_CREDITO >= 110000 AND LIMITE_DE_CREDITO < 150000 THEN 'CLIENTE MÉDIO'
	  ELSE 'CLIENTE PEQUENO' END) AS CLASSIFICACAO_DO_CLIENTE
FROM TABELA_DE_CLIENTES
ORDER BY LIMITE_DE_CREDITO DESC;

							--INNER JOIN
							
/*JOIN "JUNÇÃO"
Os INNER JOIN têm mais performance quando eu tenho índices nos campos 
que eu estou juntando.
E quando eu tenho uma chave estrangeira, esse índice já é naturalmente criado pelo banco de dados.
Então inner joins entre chaves estrangeiras têm mais performance, porém eu posso fazer inner joins 
entre dois campos que não têm uma chave estrangeira, desde que sejam campos com o mesmo conteúdo e do mesmo tipo.
*/
USE SUCOS_FRUTAS;

SELECT * FROM TABELA_DE_VENDEDORES;

SELECT * FROM NOTAS_FISCAIS;

-- Si eu estou usando COUNT, estou usando uma função de agrupamento então tem que colocar o Group By
-- Contando quantas matriculas temos, ou seja, contar quantas notas fiscais cada vendedor vendeu
SELECT MATRICULA, COUNT(*) AS NUMERO_DE_VENDAS FROM NOTAS_FISCAIS GROUP BY MATRICULA;

/*Quero que mostre na tela o campo matricula dos vendedores da tabela notas fiscais
  Quero que mostre na tela o campo nome dos vendedores  da tabela de vendedores
  e quero que contabilize quantas vendas cada vendedor fez*/
SELECT NOTAS_FISCAIS.MATRICULA, TABELA_DE_VENDEDORES.NOME, COUNT(*) AS NUMERO_DE_VENDAS
FROM NOTAS_FISCAIS
INNER JOIN TABELA_DE_VENDEDORES
ON NOTAS_FISCAIS.MATRICULA = TABELA_DE_VENDEDORES.MATRICULA
GROUP BY NOTAS_FISCAIS.MATRICULA, TABELA_DE_VENDEDORES.NOME;

--Fazendo a mesma consulta acima, mas utilizando o Alias/Apelido
SELECT NF.MATRICULA, TV.NOME, COUNT(*) AS NUMERO_DE_VENDAS
FROM NOTAS_FISCAIS AS NF
INNER JOIN TABELA_DE_VENDEDORES AS TV
ON NF.MATRICULA = TV.MATRICULA
GROUP BY NF.MATRICULA, TV.NOME;

--Posso inverter as ordens da tabela
SELECT NF.MATRICULA, TV.NOME, COUNT(*) AS NUMERO_DE_VENDAS
FROM TABELA_DE_VENDEDORES  AS TV
INNER JOIN  NOTAS_FISCAIS AS NF
ON NF.MATRICULA = TV.MATRICULA
GROUP BY NF.MATRICULA, TV.NOME;


								--LEFT JOIN

/*LEFT JOIN eu vou buscar todo mundo que está à 
esquerda do join e somente os em comuns na direita de join

o Right Join, vai pegar somente quem tem em comum na tabela da esquerda e todo mundo da tabela da direita.

o Full Join vai pegar todo mundo da esquerda e todo mundo da direita.

o Cross Join vai pegar a análise combinatória de todo mundo. Então ele vai pegar a primeira linha da tabela da esquerda e cruzar com as quatro da direita*/



USE SUCOS_FRUTAS;

/*Consulta para verificar os clientes que tiveram vendas, nesse caso
vai ter dados repetidos, porque um cliente pode ter feito varias compras*/
SELECT TC.CPF AS CPF_DO_CADASTRO, TC.NOME AS NOME_DO_CLIENTE,
NF.CPF AS CPF_DA_TABELA_NOTA
FROM TABELA_DE_CLIENTES AS TC
INNER JOIN
NOTAS_FISCAIS AS NF
ON TC.CPF = NF.CPF;

/*Consulta que permite ver quantos clientes compraram na minha empresa,
não vai vim dados repetidos*/
SELECT DISTINCT
TC.CPF AS CPF_DO_CADASTRO, TC.NOME AS NOME_DO_CLIENTE,
NF.CPF AS CPF_DA_TABELA_NOTA
FROM TABELA_DE_CLIENTES AS TC
INNER JOIN
NOTAS_FISCAIS AS NF
ON TC.CPF = NF.CPF;


/*Quando estou usando o count estou contando o número de linhas da tabela
Quando estou usando o count de forma isolada eu não preciso utilizar o group by,
pois não tem nenhum campo para agrupar*/
SELECT COUNT(*) FROM TABELA_DE_CLIENTES;

-- Incluindo um cliente novo
INSERT INTO TABELA_DE_CLIENTES
(CPF, NOME, ENDERECO_1, ENDERECO_2, BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO,
IDADE, GENERO, LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA)
VALUES ('23412632331', 'Juliana Silva', 'Rua Tramandaí', ' ', 'Bangu', 'Rio de
Janeiro', 'RJ', '23400000', '1989-02-04', 33, 'F', 180000, 24500, 0);

--PRATICANDO O LEFT JOIN

/*Ver os clientes que pelo menos fizeram uma venda*/

/*A esquerda do "LEFT JOIN" e a tabela de clientes e
a esquerda do "LEFT JOIN" e a tabela de notas fiscais, logo
que estou usando o "LEFT JOIN" vou ver todo mundo que está a 
esquerda e só quem tem combinação na direita, ou seja, vou trazer todos os clientes da tabela
de clientes e só os que compraram da tabela de notas fiscais*/
SELECT DISTINCT
TC.CPF AS CPF_DO_CADASTRO, TC.NOME AS NOME_DO_CLIENTE,
NF.CPF AS CPF_DA_TABELA_NOTA
FROM TABELA_DE_CLIENTES AS TC LEFT JOIN NOTAS_FISCAIS AS NF
ON TC.CPF = NF.CPF;

/*Qual foi o cliente que não fez nenhuma venda*/
SELECT DISTINCT
TC.CPF AS CPF_DO_CADASTRO,
TC.NOME AS NOME_DO_CLIENTE
FROM TABELA_DE_CLIENTES AS TC
LEFT JOIN
NOTAS_FISCAIS AS NF
ON TC.CPF = NF.CPF
WHERE NF.CPF IS NULL;


							--OUTROS JOIN

USE SUCOS_FRUTAS;

--Contar quantos clientes eu tenho
SELECT COUNT(*) FROM TABELA_DE_CLIENTES;
--Nesse caso tenho 16 clientes

--Contar quantos vendedores eu tenho
SELECT COUNT(*) FROM TABELA_DE_VENDEDORES;
--Nesse caso tenho 4 vendedores

--Consulta que permite verificar quais os clientes e os vendedores que moram em
--determinados bairros
SELECT DISTINCT
TV.NOME AS NOME_DO_VENDEDOR,
TV.BAIRRO AS BAIRRO_DO_VENDEDOR,
TC.NOME AS NOME_DO_CLIENTE,
TC.BAIRRO AS BAIRRO_DO_CLIENTE
FROM
TABELA_DE_CLIENTES AS TC
INNER JOIN
TABELA_DE_VENDEDORES AS TV
ON TC.BAIRRO = TV.BAIRRO;

/*Consulta que permite verificar qual e o vendedor que não tem cliente no seu bairro*/
SELECT DISTINCT
TV.NOME AS NOME_DO_VENDEDOR,
TV.BAIRRO AS BAIRRO_DO_VENDEDOR,
TC.NOME AS NOME_DO_CLIENTE,
TC.BAIRRO AS BAIRRO_DO_CLIENTE
FROM TABELA_DE_CLIENTES AS TC RIGHT JOIN TABELA_DE_VENDEDORES AS TV
ON TC.BAIRRO = TV.BAIRRO;

SELECT DISTINCT
TV.NOME AS NOME_DO_VENDEDOR,
TV.BAIRRO AS BAIRRO_DO_VENDEDOR,
TC.NOME AS NOME_DO_CLIENTE,
TC.BAIRRO AS BAIRRO_DO_CLIENTE
FROM TABELA_DE_CLIENTES AS TC RIGHT JOIN TABELA_DE_VENDEDORES AS TV
ON TC.BAIRRO = TV.BAIRRO
WHERE TC.NOME IS NULL;
--Vendedor que tiver nome do cliente e bairro do cliente nulo e um cliente que n tem nenhum vendedor no seu bairro
--Nenhum cliente mora no bairro de copacabana

/*Qual e o cliente  que n possuem vendedores no seu bairro*/
--Quero trazer todos os clientes mas somente alguns vendedores
SELECT DISTINCT
TV.NOME AS NOME_DO_VENDEDOR,
TV.BAIRRO AS BAIRRO_DO_VENDEDOR,
TC.NOME AS NOME_DO_CLIENTE,
TC.BAIRRO AS BAIRRO_DO_CLIENTE
FROM TABELA_DE_CLIENTES AS TC LEFT JOIN TABELA_DE_VENDEDORES AS TV
ON TC.BAIRRO = TV.BAIRRO
WHERE TV.NOME IS NULL;
--Essa consulta vai retornar todos os clientes que não estão em bairros que tenham vendedores

SELECT DISTINCT
TV.NOME AS NOME_DO_VENDEDOR,
TV.BAIRRO AS BAIRRO_DO_VENDEDOR,
TC.NOME AS NOME_DO_CLIENTE,
TC.BAIRRO AS BAIRRO_DO_CLIENTE
FROM TABELA_DE_CLIENTES AS TC FULL JOIN TABELA_DE_VENDEDORES AS TV
ON TC.BAIRRO = TV.BAIRRO;


									--UNION

-- Union   Union All
Use SUCOS_FRUTAS;

/*Consulta para verificar quantos bairros tem relação com os clientes*/
SELECT DISTINCT BAIRRO FROM TABELA_DE_CLIENTES;

/*Consulta para verificar quantos bairros tem relação com os vendedores*/
SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES;


--Union permite fazer consultas
SELECT DISTINCT BAIRRO FROM TABELA_DE_CLIENTES
UNION
SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES;

--Essa consulta e a mesma da de cima como si fosse um distinct
--Ele não vai mostrar nada repetido
SELECT BAIRRO FROM TABELA_DE_CLIENTES
UNION
SELECT BAIRRO FROM TABELA_DE_VENDEDORES;

-- Union All não aplica o distinct sobre o resultado,
--O resultado final vai vim com dados repetidos
SELECT BAIRRO FROM TABELA_DE_CLIENTES
UNION ALL
SELECT BAIRRO FROM TABELA_DE_VENDEDORES;

--Nesse caso estou dizendo a origem desse dado
SELECT DISTINCT BAIRRO, 'CLIENTE' AS ORIGEM FROM TABELA_DE_CLIENTES --Aqui estou colocando uma constante que vai aparecer em cada linha
UNION ALL
SELECT DISTINCT BAIRRO, 'FORNECEDOR' AS ORIGEM FROM TABELA_DE_VENDEDORES;

SELECT DISTINCT BAIRRO, 'CLIENTE' AS ORIGEM FROM TABELA_DE_CLIENTES --Aqui estou colocando uma constante que vai aparecer em cada linha
UNION 
SELECT DISTINCT BAIRRO, 'FORNECEDOR' AS ORIGEM FROM TABELA_DE_VENDEDORES;


									--HAVING

USE SUCOS_FRUTAS;

SELECT * FROM TABELA_DE_CLIENTES;

--Quero listar os estado e saber a soma do limite de credito de todos os clientes de cada estado
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS SOMA_DO_LIMITE_DE_CREDITO
FROM TABELA_DE_CLIENTES GROUP BY ESTADO;

-- Quero listar os estados cuja a soma do limite de credito e maior que 900 000 
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS SOMA_LIMITE_DE_CREDITO
FROM TABELA_DE_CLIENTES
GROUP BY ESTADO
HAVING SUM(LIMITE_DE_CREDITO) >= 900000;

-- Na tabela de produtos quero ver o maior preco e o menor preco de todos os produtos por tipo de embalagem
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO, MIN(PRECO_DE_LISTA) AS MENOR_PRECO
FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM;

SELECT * FROM TABELA_DE_PRODUTOS;

-- Na tabela de produtos quero ver o maior preco e o menor preco dos produtos por tipo de embalagem e que o preço seja maior/igual a 10
SELECT EMBALAGEM,  MAX(PRECO_DE_LISTA) AS MAIOR_PRECO , MIN(PRECO_DE_LISTA) AS MENOR_PRECO  
FROM TABELA_DE_PRODUTOS WHERE PRECO_DE_LISTA >= 10 GROUP BY EMBALAGEM;

-- Na tabela de produtos quero ver o maior preco e o menor preco dos produtos por tipo de embalagem e que o preço seja menor/igual a 5
SELECT EMBALAGEM,  MAX(PRECO_DE_LISTA) AS MAIOR_PRECO , MIN(PRECO_DE_LISTA) AS MENOR_PRECO  
FROM TABELA_DE_PRODUTOS WHERE PRECO_DE_LISTA <= 5 GROUP BY EMBALAGEM;

--Nesta consulta somente quero os produtos que possuem o maior preço de lista mais do que 20 unidade monetária, 
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAXIMO_PRECO , MIN(PRECO_DE_LISTA) AS MENOR_PRECO  
FROM TABELA_DE_PRODUTOS WHERE PRECO_DE_LISTA >= 10 
GROUP BY EMBALAGEM HAVING MAX(PRECO_DE_LISTA) >=20;

-- DESAFIO: NOME DOS PRODUTOS


--Em exercícios anteriores, 
--pretendíamos obter os produtos que 
--venderam mais que 394000 litros 
SELECT CODIGO_DO_PRODUTO, SUM(QUANTIDADE) AS QUANTIDADE FROM ITENS_NOTAS_FISCAIS 
GROUP BY CODIGO_DO_PRODUTO HAVING SUM(QUANTIDADE) > 394000 
ORDER BY SUM(QUANTIDADE) DESC;


/*Dito isso, e levando em consideração os comandos da consulta,
desejamos que na resposta desta consulta apareça não somente o 
código do produto, mas também o nome do produto.*/
SELECT ITENS_NOTAS_FISCAIS.CODIGO_DO_PRODUTO, TABELA_DE_PRODUTOS.NOME_DO_PRODUTO,  SUM(ITENS_NOTAS_FISCAIS.QUANTIDADE) AS QUANTIDADE 
FROM ITENS_NOTAS_FISCAIS 
INNER JOIN TABELA_DE_PRODUTOS
ON TABELA_DE_PRODUTOS.CODIGO_DO_PRODUTO = ITENS_NOTAS_FISCAIS.CODIGO_DO_PRODUTO
GROUP BY ITENS_NOTAS_FISCAIS.CODIGO_DO_PRODUTO, TABELA_DE_PRODUTOS.NOME_DO_PRODUTO  HAVING SUM(ITENS_NOTAS_FISCAIS.QUANTIDADE) > 394000 
ORDER BY SUM(ITENS_NOTAS_FISCAIS.QUANTIDADE) DESC;


SELECT ITENS_NOTAS_FISCAIS.CODIGO_DO_PRODUTO, TABELA_DE_PRODUTOS.NOME_DO_PRODUTO
FROM TABELA_DE_PRODUTOS
INNER JOIN ITENS_NOTAS_FISCAIS
ON TABELA_DE_PRODUTOS.CODIGO_DO_PRODUTO = ITENS_NOTAS_FISCAIS.CODIGO_DO_PRODUTO;


									--Subconsultas no comando IN

-- Sub Query pode ser usada como se fosse uma tabela
--Exemplo:
/*
SELECT SUBTABELA. * FROM
(
	SELECT CLIENTE, CIDADE, ESTADO
	FROM CLIENTE
	UNION
	SELECT FORNECEDOR, CIDADE, ESTADO
	FROM FORNECEDOR
)
SUBTABELA
*/

-- Neste caso é obrigatório usar um ALIAS para a SubQuery, nesse caso o alias é "SUBTABELA"

USE SUCOS_FRUTAS;

/*Consulta que vai retornar todos os bairros onde os meus vendedores possuem escritórios,não vai repetir bairro*/
SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES;

--Listando os bairros dos clientes onde eu tenho vendedores
SELECT BAIRRO FROM TABELA_DE_CLIENTES
WHERE BAIRRO IN ('Copacabana', 'Jardins', 'Santo Amaro', 'Tijuca');

--PARA UTILIZAR UMA SUBQUERY DENTRO DO "IN" E OBRIGATORIO
-- QUE O RESULTADO DA SUBQUERY TENHA SOMENTE UM CAMPO
--EXEMPLO: A SUBQUERY SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES 
--TEM SOMENTE O CAMPO "BAIRRO"

SELECT BAIRRO FROM TABELA_DE_CLIENTES
WHERE BAIRRO IN (SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES);