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

--O having é usado quando nós queremos usar o resultado de uma agregação no nosso filtro.

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


--SUBCONSULTAS SUBSTITUINDO O HAVING

--Quando usamos sub query dentro de um from, eu sou obrigado a colocar alias.

--Média do preço de lista por embalagens
SELECT EMBALAGEM, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO
FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM;

--Quero saber as embalagens que são menores do que o preço médio igual a 10
SELECT EMBALAGEM, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO
FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM
HAVING AVG(PRECO_DE_LISTA) <= 10;

--Quero saber as embalagens que são menores do que o preço médio igual a 10
--CONSULTA UTILIZANDO SUBQUERY
SELECT MEDIA_EMBALAGENS.EMBALAGEM,
MEDIA_EMBALAGENS.PRECO_MEDIO FROM
(SELECT EMBALAGEM, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO 
FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM) AS MEDIA_EMBALAGENS
WHERE MEDIA_EMBALAGENS.PRECO_MEDIO <= 10;

--DESAFIO TRANSFORMANDO HAVING EM SUBCONSULTAS

--Antes de qualquer coisa, vamos separar a consulta que nos dá o valor das quantidades agrupadas.

SELECT INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM ITENS_NOTAS_FISCAIS  INF
INNER JOIN TABELA_DE_PRODUTOS TP 
ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
GROUP BY INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO;

--Observação importante: Não se esqueça de incluir um apelido para SUM(QUANTIDADE) e outro para a consulta que ficará dentro do FROM.
SELECT SC.CODIGO_DO_PRODUTO, SC.NOME_DO_PRODUTO, SC.QUANTIDADE_TOTAL
FROM
(SELECT INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO, SUM(INF.QUANTIDADE) AS QUANTIDADE_TOTAL FROM ITENS_NOTAS_FISCAIS  INF
INNER JOIN TABELA_DE_PRODUTOS TP 
ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
GROUP BY INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO) SC;

--Finalmente, portanto, aplicamos a ordenação e o filtro.

SELECT SC.CODIGO_DO_PRODUTO, SC.NOME_DO_PRODUTO, SC.QUANTIDADE_TOTAL
FROM
(SELECT INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO, SUM(INF.QUANTIDADE) AS QUANTIDADE_TOTAL FROM ITENS_NOTAS_FISCAIS  INF
INNER JOIN TABELA_DE_PRODUTOS TP 
ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
GROUP BY INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO) SC
WHERE SC.QUANTIDADE_TOTAL > 394000 
ORDER BY SC.QUANTIDADE_TOTAL DESC;

------ VISÃO - VIEW


USE SUCOS_FRUTAS;

--Criando uma View/ Recomendado deixar essa view na primeira linha do seu Script
CREATE VIEW MEDIA_EMBALAGENS AS 
SELECT EMBALAGEM, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO 
FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM

SELECT * FROM MEDIA_EMBALAGENS;

--Quero saber as embalagens que são menores do que o preço médio igual a 10
--CONSULTA UTILIZANDO SUBQUERY
SELECT MEDIA_EMBALAGENS.EMBALAGEM,
MEDIA_EMBALAGENS.PRECO_MEDIO FROM
(SELECT EMBALAGEM, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO 
FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM) AS MEDIA_EMBALAGENS
WHERE MEDIA_EMBALAGENS.PRECO_MEDIO <= 10;

--Quero saber as embalagens que são menores do que o preço médio igual a 10
--CONSULTA UTILIZANDO VISÃO/VIEW, e a mesma consulta acima, só muda que utilizo view
SELECT  EMBALAGEM, PRECO_MEDIO
FROM MEDIA_EMBALAGENS
WHERE PRECO_MEDIO <= 10;

--DESAFIO USANDO VISÃO PARA SUBSTITUIR O HAVING

--Redesenhe esta consulta criando uma visão para a lista de quantidades totais por produto e aplicando a condição e ordenação sobre esta mesma visão.
SELECT INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO, SUM(INF.QUANTIDADE) AS QUANTIDADE FROM ITENS_NOTAS_FISCAIS  INF
INNER JOIN TABELA_DE_PRODUTOS TP 
ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
GROUP BY INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO HAVING SUM(INF.QUANTIDADE) > 394000 
ORDER BY SUM(INF.QUANTIDADE) DESC;

--1° Passo: Vamos criar a visão com a consulta que retorna as quantidade agregadas. Não se esqueça de criar um apelido para o agregador SUM(QUANTIDADE).
CREATE VIEW VW_QUANTIDADE_PRODUTOS AS SELECT INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO, 
SUM(INF.QUANTIDADE) AS QUANTIDADE_TOTAL FROM ITENS_NOTAS_FISCAIS  INF
INNER JOIN TABELA_DE_PRODUTOS TP 
ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
GROUP BY INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO;

--2° Passo: Consulta redesenhada, utilizando a visão
SELECT * FROM VW_QUANTIDADE_PRODUTOS
WHERE QUANTIDADE_TOTAL > 394000 
ORDER BY QUANTIDADE_TOTAL DESC;

--FUNÇÕES NO SQL

--Tipos de Funções

--Strings (Textos)
--Datas
--Matematicas
--Conversão de dados

--Funções no SQL do tipo Texto

 --A função "LOWER" pega um string ou uma expressão de caracteres 
 --e vai converter essa expressão de caracteres apenas para caracteres
 --minúsculos. Para usar a função, coloco lower e entre aspas simples
 --o campo ou o texto que eu quero aplicar a função.

 SELECT NOME, LOWER(NOME) AS NOME_MINUSCULO FROM TABELA_DE_CLIENTES;

 --A próxima função é a "UPPER", que é o inverso do LOWER. Essa função vai
 --pegar uma expressão de caracteres e vai converter tudo que é minúsculo
 --em maiúsculo.

  SELECT NOME, LOWER(NOME) AS NOME_MINUSCULO, UPPER(NOME) AS NOME_MAIUSCULO FROM TABELA_DE_CLIENTES;

  SELECT NOME,UPPER(NOME) AS NOME_MAIUSCULO FROM TABELA_DE_CLIENTES;

 --A função CONCAT vai retornar uma cadeia de caracteres ou uma string,
 --resultante da concatenação, ou seja, da junção de dois ou mais outros 
 --valores de caracteres.
 --Uma observação: o SQL Server também aceita que eu pegue esses strings 
 --e coloque entre eles o símbolo de somar.

 SELECT NOME, CONCAT(ENDERECO_1, ' ', BAIRRO, ' ',CIDADE, ' ', ESTADO, ' - ', CEP) AS ENDERECO_COMPLETO
 FROM TABELA_DE_CLIENTES;

 --Outra maneira de fazer a mesma consulta acima
  SELECT NOME, ENDERECO_1 + ' ' + BAIRRO + ' ' + CIDADE + ' ' + ESTADO + ' - ' + CEP AS ENDERECO_COMPLETO
 FROM TABELA_DE_CLIENTES;

 --A função RIGHT vai retornar a parte direita de uma cadeia de caracteres, 
 --usando como parâmetro o número de caracteres especificados na segunda parte da função.

 --A função LEFT faz o inverso do RIGHT, retornando a parte esquerda de uma cadeia de caracteres,
 --sempre usando o número de caracteres especificados no segundo parâmetro da função. 

 --Consulta que vai retornar os três primeiros caracteres
 SELECT NOME_DO_PRODUTO, LEFT(NOME_DO_PRODUTO,3) AS TRES_PRIMEIROS_CHAR FROM TABELA_DE_PRODUTOS;

 --A função REPLICATE vai repetir o valor de caracteres que está na função, usando como parâmetro 
 --o número especificado como número de vezes.

 --O replace vai substituir um conjunto de caracteres por outro especificado.

 --Aonde tiver Litros será substituido por L
 SELECT TAMANHO, REPLACE(TAMANHO, 'Litros', 'L') AS TAMANHO_MODIFICADO FROM TABELA_DE_PRODUTOS;

--Utilizando função dentro de uma função
--Aonde tiver Litros será substituido por L
--Aonde tiver Litro "no singular" também será substituido por L
  SELECT TAMANHO, REPLACE((REPLACE(TAMANHO, 'Litros', 'L')), 'Litro', 'L') AS TAMANHO_MODIFICADO FROM TABELA_DE_PRODUTOS;


 --A função SUBSTRING vai retornar uma parte da expressão de caracteres, partindo do ponto inicial 
 --que será passado como parâmetro para a função e o número de caracteres a serem extraídos.

 --A função LTRIM remove os caracteres que são espaços

 --A função RTRIM faz a mesma coisa que o ltrim, porém do lado direito.

 --A função TRIM remove tanto os espaços da esquerda quanto os espaços da direita:

 --O REPLACE vai substituir um conjunto de caracteres por outro especificado.

 --O LEN retorna o número de caracteres do texto que está sendo especificado, excluindo os espaços que possam haver à direita.

 ----- DESAFIO - BUSCANDO UM PEDAÇO DE UM TEXTO

 USE SUCOS_FRUTAS;

--Conforme vimos nas aulas sobre funções de texto, observe a seguinte frase abaixo:
--CIDADE DO RIO DE JANEIRO
--Como seria a função para retirar deste texto somente a palavra RIO?
--Resposta
SUBSTRING('CIDADE DO RIO DE JANEIRO', 11, 3)


----------------- Desafio: separando nome e sobrenome

SELECT * FROM TABELA_DE_CLIENTES;

--Nas aulas relacionadas às funções de texto, observamos a tabela de 
--cliente onde podemos listar os nomes.

--Note que os nomes e sobrenomes são separados por um espaço.

--Sendo assim, faça uma consulta que traga somente o primeiro nome de 
--cada cliente.

--Dica: Como foi dito pelo instrutor existem diversas funções do SQL Server 
--e muitas vezes não sabemos todas. Por isso, para resolver este problema 
--pesquise sobre a função CHARINDEX, veja como ela funciona, e aplique para 
--resolver este problema.

--1° PASSO:
--Primeiro, vamos localizar o primeiro espaço do nome. Sua posição. 
--Para isso, basta executar a função CHARINDEX
-- Isso ' ' que dizer que estou procurando aonde tem espaço
-- Estou procurando na coluna "NOME"
-- A pesquisa vai iniciar da posição "1"
SELECT NOME, CHARINDEX(' ',NOME, 1) FROM TABELA_DE_CLIENTES;

--2° PASSO:
--Usando a função SUBSTRING podemos buscar parte do texto que compõe 
--o nome completo buscando da posição 1 a posição do primeiro espaço.

SELECT NOME, SUBSTRING(NOME, 1, CHARINDEX(' ', NOME, 1)) FROM TABELA_DE_CLIENTES;

SELECT NOME,SUBSTRING(NOME, 1, CHARINDEX(' ',NOME)) AS PRIMEIRO_NOME FROM TABELA_DE_CLIENTES;

--3° Passo
--Quero que retorne, o primeiro e o segundo nome
SELECT NOME, LEFT(NOME, CHARINDEX(' ', NOME)) AS [PRIMEIRO NOME],
RIGHT(NOME, LEN(NOME) - CHARINDEX(' ', NOME)) AS [SOBRENOME]
FROM TABELA_DE_CLIENTES;

--Utilizei a função LEFT para retornar o primeiro nome em conjunto com a função CHARINDEX. 
--De quebra ainda adicionei na query o último nome também.
--O número 20 indica o tamanho da string retornada da função da substring. 
--Então, a função charindex localiza o primeiro espaço dentro da coluna nome 
--e com a função substring eu começo a contar a quantidade de caracteres depois da
--localização até no máximo 20. Dessa forma não fica limitado somente o retorno da 
--quantidade de caracteres contados pela função charindex.

SELECT CPF, LEFT(NOME,CHARINDEX(' ',NOME)) AS PRIMEIRO_NOME,
SUBSTRING(NOME, CHARINDEX(' ',NOME), 20 ) AS ULTIMO_NOME,
NOME AS NOME_COMPLETO
FROM TABELA_DE_CLIENTES;

-------- FUNÇÕES DE DATA E HORA

/*DATEADD - Essa função adiciona um número (um inteiro com sinal positivo
ou negativo) a um datepart de uma data de entrada e retorna um valor de 
data/hora modificado*/

/*DATEPART é uma parte da data, o datepart pode ser a palavra year, quarter,
month, dayofyear, day, week, hour, minute, second, milisecond, microsecond, 
nanosecond*/

/*DATEPART pode ser usada sobre as funções "dateadd" e "datediff"*/

/*EXEMPLO:

Eu escrevo dateadd e escolho um datepart que nesse caso e o "day". 
Então se eu escrever day, passar como parâmetro um número inteiro positivo 
ou negativo, no caso eu escolhi um positivo, o valor 30, e uma data, ele vai somar 30 dias àquela data:

DATEADD(DAY, 30, '2022-01-01')

Então, o resultado será aquela mesma data 30 dias para frente:

2022-01-31

Se eu tivesse escolhido o datepart month, ele irá somar 30 meses à data, então ele vai sempre somar ou diminuir, 
dependendo se o valor passado como parâmetro for positivo ou negativo.
*/

/*DATEDIFF - Essa função retorna a contagem (como um valor inteiro com sinal)
dos limites de datepart especificados cruzados entre os parâmetros especificados
startdate e enddate

Função datediff vai retornar um número, que é um valor inteiro, que pode ser positivo ou negativo, que expressa
os dateparts da diferença entre duas datas.

EXEMPLO:

DATA INICIAL '2022-01-01'
DATA FINAL   '2022-04-12'
DATEDIFF(DAY, '2022-01-01', '2022-04-12')

A função DATEDIFF calculará a diferença entre essas duas datas e mostrará 
o resultado expresso em dias, porque o datepart escolhido foi day. 
Se eu tivesse escrito month, o resultado da diferença entre essas duas 
datas seria expresso em meses, e assim por diante.

Logo, o resultado do exemplo seria 101 dias.
*/


/*DATEPART - Essa função retorna um inteiro que representa o datepart
especificado do argumento date especificado

Com a função datepart, passamos uma data e posso ver o ano, o mês, o dia, 
a hora, o minuto dessa data. Então se eu escrevo:

DATEPART(DAY, '2022-01-01')

Nos será retornado o dia dessa data, logo o resultado será 1.
*/

/*GETDATE - Retorna o carimbo de data/hora do sistema do banco de dados atual
 como um valor de datetime sem o deslocamento de fuso horário do banco de dados
 Esse valor é derivado do sistema operacional do computador no qual a instância
 do SQL Server está sendo executada
 
 A função getdate vai retornar a data do computador de onde a instância do banco de 
 dados está rodando. Então se eu executo a função GETDATE(), por exemplo, eu vou ter a
 data, a hora, o minuto, o segundo e o milissegundo do momento em que eu executei a função.*/

 /*
 DAY - Esta função retorna um inteiro que representa o dia (dia do mês) 
 da data especificada.
 MONTH - Retorna um inteiro que representa o mês da data especificada
 YEAR - Retorna um inteiro que representa o ano da data especificada

 A função day, se eu colocar DAY(DATE), eu vou ver o dia da data. Semelhante à função datepart,
 quando eu uso day como parâmetro.

Na função month, eu vou ver o mês da data e na função year, verei o ano da data.*/

/*
ISDATE - Retornará 1 se a expressão for um valor datetime, válido; caso
contrário, 0.

 A função isdate testa para saber se a expressão passada por parâmetro é uma data 
 válida ou não. Então por exemplo, se eu escrevo:

 ISDATE('2022-02-31')

 A data 31 de fevereiro de 2022 não existe, então o resultado vai ser o número 0, de falso.

Se a data fosse válida, a função isdate retornaria o número 1.
*/

/*DATETIMEFROMPARTS - Essa função retorna um valor datetime para os
argumentos de data e hora especificados

A função datetimefromparts vai retornar uma data baseado em inteiros 
separados por vírgula, onde eu vou expressar o ano, o mês, o dia, 
a hora, o minuto, o segundo e o milissegundo:

DATETIMEFROMPARTS( year, month, day, hour, minute, seconds, milliseconds)

Então se eu escrevo:

DATETIMEFROMPARTS(2022, 12, 14, 15, 34, 22, 30)

Ou seja, eu quero que essa função retorne uma data onde o ano é 2022, o mês é 12, o dia 
é 14 e assim por diante:

2022-12-14 15:34:22.030

*/

USE SUCOS_FRUTAS;

/*


Executando essa consulta, o resultado será a data e hora do computador*/
SELECT GETDATE();

--Vamos pegar o dia atual e somar dez dias:
SELECT DATEADD(DAY, 10, GETDATE());

--Vamos pegar o dia atual e somar dez dias:
SELECT GETDATE() AS DATA_HOJE, DATEADD(DAY, 10, GETDATE()) AS DATA_DAQUI_10_DIAS;

--Se eu quiser saber qual data representa 48 dias atrás, basta eu fazer:
SELECT DATEADD(DAY,-48, GETDATE()) AS DATA_48_DIAS_ATRAS

SELECT DATEADD(DAY,-48, GETDATE()) AS DATA_48_DIAS_ATRAS,
DATEDIFF(DAY, '2023-01-01', GETDATE()) AS DIAS_DESDE_INICIO_ANO;

--Eu quero saber por exemplo quantos dias se passaram desde o primeiro dia do ano:
SELECT DATEDIFF(DAY, '2023-01-01', GETDATE()) AS DIAS_DESDE_INICIO_ANO;

--então se eu quiser ver o número de horas desde o primeiro dia do ano:
SELECT DATEDIFF(HOUR, '2023-01-01', GETDATE()) AS HORAS_DESDE_INICIO_ANO;

--então se eu quiser ver o número de meses desde o primeiro mês do ano:
SELECT DATEDIFF(MONTH, '2023-01-01', GETDATE()) AS MESES_DESDE_INICIO_ANO;

--Com a função datepart, posso pegar o dia de hoje, do momento que eu executo a função:
SELECT DATEPART(DAY, GETDATE()) AS DIA_DE_HOJE;

SELECT GETDATE() AS DATA_HOJE, DATEPART(DAY, GETDATE()) AS DIA_DE_HOJE;

--Eu posso, por exemplo, testar para saber se uma data é válida ou não:
SELECT ISDATE(DATETIMEFROMPARTS(2022, 02, 28, 00, 00, 00, 00));

--Calculando o número de anos que uma pessoa viveu desde o seu nascimento?
SELECT NOME, 
DATEDIFF(YEAR, DATA_DE_NASCIMENTO, GETDATE()) AS NUMERO_DE_ANOS_DE_VIDA 
FROM TABELA_DE_CLIENTES;

--Calculando o número de anos que a pessoa de cpf  1471156710 viveu desde o seu nascimento?
SELECT NOME, 
DATEDIFF(YEAR, DATA_DE_NASCIMENTO, GETDATE()) AS NUMERO_DE_ANOS_DE_VIDA 
FROM TABELA_DE_CLIENTES
WHERE CPF = '1471156710';

--DESAFIO DATA POR EXTENSO

--Consulta que retornar o nome do cliente e sua data de nascimento por 
--extenso dia, dia da semana, mês e ano
SELECT NOME + ' nasceu em ' + 
DATENAME (WEEKDAY,DATA_DE_NASCIMENTO) + ',' +
DATENAME (DAY,DATA_DE_NASCIMENTO) + ' de ' +
DATENAME(MONTH, DATA_DE_NASCIMENTO) + ' de ' +
DATENAME(YEAR, DATA_DE_NASCIMENTO) AS DATA_EXTENSO
FROM TABELA_DE_CLIENTES;

-----------FUNÇÕES NUMÉRICAS

/*
ROUND - Retorna um valor numérico, arredondado, para o comprimento ou
precisão especificados
O ROUND, que retorna um valor numérico arredondado, usando o comprimento 
de precisão de arredondamento, passado como segundo parâmetro da função. 
Então por exemplo, se eu quiser arredondar o número 32,23332 com duas casas decimais:

ROUND(32.23332, 2)

Ele vai me retornar o número 32,23.As outras casas decimais ele vai zerar.


O CEILING retorna o menor inteiro maior que ou igual à expressão numérica
identificada. Então, se eu tiver o número 32,23332 e eu aplicar o CEILING:

CEILING(32.23332)

A parte inteira é 32, então o resultado vai ser 33, que é o menor inteiro,
maior do que o inteiro existente.
Então se o inteiro existente é 32, o resultado vai ser 33.

Já a função CEILING() desempenha a função oposta, arredondando um número 
para cima e aproximando-o ao inteiro subsequente. Por exemplo, ao empregar 
CEILING(1.6), o retorno será 2.


O FLOOR vai fazer o contrário do CEILING, ele vai retornar o maior inteiro,
menor ou igual que a expressão numérica especificada. Então se eu tenho:

FLOOR(32,23332)

O menor inteiro vai ser o próprio 32.

A função FLOOR() realiza um arredondamento para baixo, levando o número 
ao inteiro imediatamente inferior. Por exemplo, ao aplicar FLOOR(1.6), 
o resultado será 1.


O POWER vai retornar a potência, vai ser um número elevado a um fator.
Então se eu fizer:

POWER(2, 10)

É a mesma coisa que 2 elevado a 10, que vai dar o resultado de 1024.


EXP - Retorna o valor  exponencial da expressão float especificada.
O EXP vai retornar o valor exponencial da expressão passada por parâmetro
para a função. É baseada na constante e (2,71828182845905), que é a base dos
logaritmos naturais.
O expoente de um número é a constante e elevada à potência do número passado por parâmetro.
E aí se eu colocar, por exemplo:

EXP(10)

Eu vou pegar aquele o número 2,71828182845905 e elevá-lo a 10, 
tendo 22026,4657948067 como resultado. Então, para fórmulas matemáticas, 
essa função é super importante.


A função SQRT resolve a raiz quadrada, então ele resolve a raiz quadrada 
do valor flutuante que foi passado por parâmetro para a função. Então, se eu fizer:

SQRT(144)

O resultado será 12, porque a raiz quadrada de 144 é 12.


SIGN - Retorna o sinal positivo (+1), zero (0) ou sinal negativo (-1) da
expressão especificada
O SIGN vai retornar um sinal positivo ou negativo, dependendo do sinal do 
número passado por parâmetro para a função. Então se o número for positivo,
ele vai retornar 1, se o número é negativo ele vai retornar -1:

SIGN(-10)

Como -10 é negativo, essa função retornará o número -1.



O ABS vai retornar o valor absoluto(valor positivo do número) e sempre positivo da expressão 
numérica que foi passada por parâmetro para a função.
ABS altera valores negativos para valores positivos.
ABS não tem efeito em valores zero ou positivos
Então se eu tenho:

ABS(-10)

A função vai retornar o número 10. Então, sempre vai ser o valor absoluto,
o valor positivo do número.

O PERCENT é uma função que calcula o resto da divisão entre dois números:

dividendo % divisor

Assim, eu tenho resto.
Por exemplo: 10 % 3 é o resto da divisão de 10 por 3, que será 1.


Eu tenho uma série de outras funções que eu posso usar no SQL Server, relacionados com outras partes da matemática ou geometria:

LOG, que retorna o logaritmo natural de uma expressão float, passada por parâmetro para a função.
LOG10, que retorna o logaritmo na base 10 da expressão float passada por parâmetro para a função.
Funções aritméticas como: ACOS, ATAN, ASIN, COS, TAN e SIN.
PI, que retorna o número PI, que é muito importante na geometria, principalmente para calcular raios ou áreas de círculo, etc.
*/

/*Estou fazendo o arredondamento dos números*/
SELECT ROUND(3.437,2),ROUND(3.433,2);

/*Consulta que vai retornar o maior inteiro, depois do inteiro do número
O inteiro do número e 3, então ele exibe 4*/
SELECT CEILING(3.433);

--Consulta que vai retornar o próprio número inteiro do número, ou sejá,
--nesse caso vai retornar o 3*/
SELECT FLOOR(3.433);

SELECT POWER(12, 2);

SELECT EXP(3);

--Raiz quadrada de 300
SELECT SQRT(300);

--Converter qualquer número negativo em positivo
SELECT ABS(-10);

/*DESAFIO: formato do faturamento
Na tabela de notas fiscais, temos o valor do imposto. 
Já na tabela de itens, temos a quantidade e o faturamento. 
Calcule o valor do imposto pago no ano de 2016, arredondando 
para o menor inteiro.*/

SELECT * FROM NOTAS_FISCAIS;
SELECT * FROM ITENS_NOTAS_FISCAIS;

SELECT YEAR(DATA_VENDA) AS ANO, FLOOR(SUM(IMPOSTO * (QUANTIDADE * PRECO))) 
FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY YEAR(DATA_VENDA);

SELECT YEAR(NF.DATA_VENDA) AS ANO,
FLOOR(SUM((INF.QUANTIDADE * INF.PRECO) * NF.IMPOSTO)) AS IMPOSTO_PAGO
FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO
WHERE DATA_VENDA BETWEEN '2016-01-01' AND '2016-12-31'
GROUP BY YEAR(DATA_VENDA);

SELECT YEAR(NF.DATA_VENDA), FLOOR(SUM(NF.IMPOSTO*INF.QUANTIDADE*INF.PRECO)) AS IMPOSTO_TOTAL
FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA)=2016
GROUP BY YEAR(NF.DATA_VENDA)

---------- Funções de Conversão ---------



/*

CAST e CONVERT - Essas funções convertem uma expressão de um tipo de dados
em outro.

Conversão de data para texto

No caso da conversão de data para texto, eu uso a função CONVERT.
E por que a conversão de data para texto é importante? 
Porque muitas vezes eu quero representar a data de uma maneira 
diferente do que a data é representada dentro do SQL Server. 
Lembra que a data no SQL Server é representada da seguinte forma:
ANO (4 dígitos)-MÊS (2 dígitos)-DIA (2 dígitos).

E nem sempre, quando eu quero executar uma consulta SQL,
eu quero exibir a data neste formato. Eu quero mudar o formato 
de exibição, então isso é uma conversão de data para texto, 
usando uma determinada máscara. 
E como é que eu defino essa máscara para o SQL Server?
Através de uma numeração.
Existe um número que pode começar do 1 ou do 100 e ele vai crescente,
e cada número desse vai representar uma máscara de saída.

Link para consultar
https://learn.microsoft.com/pt-br/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver16

O CAST eu posso usar para fazer conversão de números para números.
Então eu posso pegar um número, converter de inteiro para money, de money 
para decimal, de decimal para float e assim por diante.

OBSERVAÇÕES:
Para conversões explícitas, a própria instrução determina o tipo 
de dado resultante, então, quando eu faço a conversão explícita, 
eu não preciso dizer qual é o tipo de dado que está sendo convertido.

Já para conversões implícitas, eu tenho que atribuir qual 
é o tipo de dado que eu quero converter.

*/


/*
Estou convertendo a data atual em texto

Como eu estou convertendo uma data para texto, 
eu preciso especificar o tipo desse texto, 
por exemplo VARCHAR(10).
E especificamos a máscara 121 (yyyy-mm-dd hh:mi:ss.mmm).

Note que eu só estou vendo o dia, por quê? 
Porque o tamanho da máscara é de 23  caracteres "(yyyy-mm-dd hh:mi:ss.mmm)", 
mas nós definimos um VARCHAR(10), então ele só exibiu os 
dez primeiros caracteres dessa máscara.*/
SELECT CONVERT(VARCHAR(10), GETDATE(), 121);

/*Para utilizar essa máscara 121, preciso aumentar o tamanho do VARCHAR,
como, por exemplo, 25 caracteres:
Quando eu vou converter uma data para texto, 
é importante que eu coloque a definição do texto com o número 
de caracteres que coincida com o tamanho final da máscara.*/
SELECT CONVERT(VARCHAR(25), GETDATE(), 121);

USE SUCOS_FRUTAS;
GO
SELECT * FROM TABELA_DE_CLIENTES;

/*Nós temos o campo DATA_DE_NASCIMENTO, que é a data de nascimento do cliente. 
Podemos converter essa data:

Se eu executar isso daqui, teremos um resultado diferente do esperado. 
Aí você pode perguntar: "mas colocamos o tamanho do VARCHAR como 25, então por
que a hora, o minuto e o segundo não foram exibidos?". 
Porque se nós olharmos o tipo original desse campo "DATA_DE_NASCIMENTO", ele é um campo date e não datetime.

Então, essa data de nascimento que está na tabela, ela não tem hora, 
minuto e segundo gravada, porque o tipo date não comporta hora, minuto,
segundo e milissegundo. Então não adianta usar uma máscara para exibir hora,
minuto, segundo e milissegundo, se o campo que está gravado na tabela não tem isso.


*/
SELECT DATA_DE_NASCIMENTO, CONVERT(VARCHAR(25), DATA_DE_NASCIMENTO, 121)
FROM TABELA_DE_CLIENTES;


/*Nós temos o campo DATA_DE_NASCIMENTO, que é a data de nascimento do cliente. 
Podemos converter essa data:
Agora, se nós escolhermos uma outra máscara, por exemplo, a 106 (dd mon yyyy):
Eu consigo ver então a data de nascimento do cliente no formato escolhido, olhando o mês em três letras.
*/
SELECT DATA_DE_NASCIMENTO, CONVERT(VARCHAR(25), DATA_DE_NASCIMENTO, 106) 
FROM TABELA_DE_CLIENTES;

/* Outra coisa, por exemplo, eu tenho o nome do produto e o preço de lista na tabela de produtos:
*/
SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA FROM TABELA_DE_PRODUTOS;

/*Digamos que eu queira escrever um texto, em vez de exibir apenas 
o preço do produto, eu vou escrever um texto dizendo "O preço de lista é tal preço",
um texto mais bonito para aparecer na tabela.

Então eu poderia usar a função CONCAT, onde eu escreverei:

Ao executar, note que foi feita uma conversão implícita. Ele automaticamente converteu o 
preço de lista, que é um float, em texto.
*/
SELECT NOME_DO_PRODUTO, CONCAT('O preço de lista é: ', PRECO_DE_LISTA) AS PRECO 
FROM TABELA_DE_PRODUTOS;


/*Mas se eu quisesse converter de forma explícita, bastaria eu ter feito:

Então eu estou convertendo o preço de lista em um VARCHAR(10). 
Isso é uma conversão onde eu estou dizendo qual é o tipo que eu quero escrever. 
Não preciso usar o cast, porque se olharmos novamente a tabela de conversões, 
o float é convertido implicitamente para texto.

Na conversão implícita, eu posso fazer essa conversão de forma automática. 
Essa regra às vezes não funciona direito, não no caso de data, mas pode ser
um tipo especial que não funciona, então a primeira coisa que você pode estar 
testando é usar o concat: se der erro e não funcionar, você usa o cast,
pegando o campo e convertendo para o novo tipo que quiser.
*/

SELECT NOME_DO_PRODUTO, 
CONCAT('O preço de lista é: ', CAST(PRECO_DE_LISTA AS VARCHAR(10))) AS PRECO 
FROM TABELA_DE_PRODUTOS;

---=========Desafio: listando expressão natural
/*
Queremos construir um SQL cujo resultado seja para cada cliente:

"O cliente João da Silva comprou R$ 121222,12 no ano de 2016".
Faça isso somente para o ano de 2016.

Dica: Procure na documentação como se usa a função STR para converter um número FLOAT em texto.

Depois de entender a função SRT podemos construir a seguinte consulta:
*/
SELECT 'O cliente ' + TC.NOME + ' comprou R$ ' + 
TRIM(STR(SUM(INF.QUANTIDADE * INF.PRECO) ,10,2)) + ' no ano de ' + DATENAME(YEAR, NF.DATA_VENDA)
FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF ON NF.NUMERO = INF.NUMERO
INNER JOIN TABELA_DE_CLIENTES TC ON NF.CPF = TC.CPF
WHERE YEAR(NF.DATA_VENDA) = '2016'
GROUP BY TC.NOME, NF.DATA_VENDA;


------VENDAS VALIDAS --------------

/* Eu quero fazer um relatório para poder ver, dentro de um determinado mês, quais foram os 
clientes que ultrapassaram ou não esse volume de compra. 
Então esse é o meu problema, alguém chegou para mim e disse: "olha, me vê dentro de um 
mês quais foram os clientes que compraram mais do que o volume de compra especificado para eles".

Inicialmente calculando o volume de venda por cliente.

Então a primeira coisa que eu vou fazer: eu vou selecionar o CPF, que é o cliente, e a data da venda, 
ambos campos da tabela de notas fiscais, e vou selecionar a quantidade que eu vendi, que estão na tabela
de itens das notas fiscais. Logo, como eu preciso selecionar três campos, sendo que um deles está em uma 
tabela e dois em outra, o que eu preciso fazer um inner join.

O campo em comum entre essas duas tabelas? É o campo NUMERO, é o que liga essas duas tabelas, 
então ele vai ser o critério do join:
Na tabela de notas fiscais, eu quero ver o CPF e a data da venda e da tabela de itens, eu quero ver a quantidade

Tenho quantas vendas foi realizada na data e por qual pessoa*/

SELECT NF.CPF, NF.DATA_VENDA, INF.QUANTIDADE
FROM NOTAS_FISCAIS AS NF
INNER JOIN ITENS_NOTAS_FISCAIS AS INF
ON NF.NUMERO = INF.NUMERO;

/*Eu preciso ter essa informação dentro do mês e do ano. 
Então a primeira coisa que eu vou fazer é escrever a data
só com mês e ano. Nós podemos usar o "convert" para isso,
utilizando a máscara 120 (yyyy-mm-dd hh:mi:ss) e limitando 
o tamanho do VARCHAR para 7, assim que só exibirei o ano e o mês:*/

SELECT NF.CPF,
CONVERT (VARCHAR(7),NF.DATA_VENDA, 120) AS MES_ANO, --Nesse caso quero que mostre somente o mês e o ano da venda 
INF.QUANTIDADE
FROM NOTAS_FISCAIS AS NF
INNER JOIN ITENS_NOTAS_FISCAIS AS INF
ON NF.NUMERO = INF.NUMERO;

/*Mas eu preciso ter isso agrupado, porque eu preciso calcular 
a soma total das quantidades dentro do mês e do ano, porque eu 
preciso comparar com o volume do cadastro, que é o volume que está,
por contrato, acertado para o cliente comprar no mês.


 Nós vamos fazer aqui um SUM, eu vou somar a quantidade, 
 chamando de quantidade total:
 
 A partir do momento que eu coloquei um SUM, eu sou obrigado
 a usar um group by, mas por quais campos? 
 Pela chave, que é onde eu vou somar, que é o CPF e pela 
 data da venda, convertida para mês e ano.*/

 SELECT NF.CPF, 
CONVERT(VARCHAR(7), NF.DATA_VENDA, 120) AS MES_ANO, 
SUM(INF.QUANTIDADE) AS QUANTIDADE_TOTAL 
FROM NOTAS_FISCAIS AS NF 
INNER JOIN ITENS_NOTAS_FISCAIS AS INF 
ON NF.NUMERO = INF.NUMERO
GROUP BY
NF.CPF, CONVERT(VARCHAR(7), NF.DATA_VENDA, 120);

--O cpf 9283760794 comprou no mes_ ano de 2016-04 a quantidade total de 23352 litros de suco

/*Vamos olhar a tabela de clientes, onde eu tenho o CPF, 
o nome do cliente e o volume de compra:*/

SELECT CPF, NOME, VOLUME_DE_COMPRA FROM TABELA_DE_CLIENTES;

/*

Preciso comparar o volume de compra que foi acertado com o cliente no
inicio do contraro.
Nesse caso estou verificando com a consulta abaixo essa situação

SELECT CPF, NOME, VOLUME_DE_COMPRA FROM TABELA_DE_CLIENTES;

Com essa consulta abaixo estou verificando a quantidade de vendas que o cliente fez no meses e anos.

  SELECT NF.CPF, 
CONVERT(VARCHAR(7), NF.DATA_VENDA, 120) AS MES_ANO, 
SUM(INF.QUANTIDADE) AS QUANTIDADE_TOTAL 
FROM NOTAS_FISCAIS AS NF 
INNER JOIN ITENS_NOTAS_FISCAIS AS INF 
ON NF.NUMERO = INF.NUMERO
GROUP BY
NF.CPF, CONVERT(VARCHAR(7), NF.DATA_VENDA, 120);

Isso tudo para verificar se o cliente não comprou mais que o combinado no 
inicio do contrato

Para fazer uma consulta que retorne o volume de compra que foi combinado
no contrato, com a quantidade de vendas que o cliente está comprando.
Utilizamos as subqueries e fazemos um join de subqueries. 
O campo em comum das duas consultas e o CPF do cliente.


O inner join não será com uma tabela, mas com a query que fizemos anteriormente:
Eu preciso dar um alias a esta subquery, então eu vou chamar de TV, de total de vendas:

No join, o campo que vai fazer a ligação será o CPF, mas não podemos chamar por NF.CPF,
porque como o on está sendo visualizado fora da subquery, ele tem como alias TV
Vamos selecionar primeiro os campos da tabela de clientes: CPF, NOME, VOLUME_DE_COMPRA.
E da tabela que é subquery, que tem o alias TV, eu vou selecionar os campos MES_ANO e QUANTIDADE_TOTAL*/

SELECT 
TC.CPF, TC.NOME, TC.VOLUME_DE_COMPRA, TV.MES_ANO, TV.QUANTIDADE_TOTAL 
FROM TABELA_DE_CLIENTES AS TC 
INNER JOIN (
    SELECT NF.CPF, 
    CONVERT(VARCHAR(7), NF.DATA_VENDA, 120) AS MES_ANO, 
    SUM(INF.QUANTIDADE) AS QUANTIDADE_TOTAL 
    FROM NOTAS_FISCAIS NF 
    INNER JOIN ITENS_NOTAS_FISCAIS INF 
    ON NF.NUMERO = INF.NUMERO 
    GROUP BY NF.CPF, CONVERT(VARCHAR(7), NF.DATA_VENDA, 120)
) AS TV
ON TV.CPF = TC.CPF;

/*Depois de executar a consulta percebemos que no mês 04 do ano 2016
no contrato (VOLUME_DE_COMPRA) era 25000, o cliente comprou nesse mês
23352 litros de suco, ou sejá, menos do que foi combinado no contrato

Alguns compraram menos outros mais do que foi estipulado no contrato

Vamos fazer uma classificação para especificar quais são os clientes 
que estão dentro ou que estão fora do limite especificado no contrato.

Se o volume total (QUANTIDADE_TOTAL) for maior que o volume de compra(VOLUME_DE_COMPRA)
,eu vou dizer, por exemplo, que as vendas foram inválidas. 
Se o volume de compra(VOLUME_DE_COMPRA)  for maior ou igual que o volume total (QUANTIDADE_TOTAL)
 as vendas foram válidas:*/

 SELECT 
TC.CPF, TC.NOME, TC.VOLUME_DE_COMPRA, TV.MES_ANO, TV.QUANTIDADE_TOTAL, 
(CASE WHEN TC.VOLUME_DE_COMPRA >= TV.QUANTIDADE_TOTAL THEN 'VENDAS VÁLIDAS' 
ELSE 'VENDAS INVÁLIDAS' END) AS RESULTADO 
FROM TABELA_DE_CLIENTES AS TC 
INNER JOIN (
    SELECT NF.CPF, 
    CONVERT(VARCHAR(7), NF.DATA_VENDA, 120) AS MES_ANO, 
    SUM(INF.QUANTIDADE) AS QUANTIDADE_TOTAL 
    FROM NOTAS_FISCAIS AS NF 
    INNER JOIN ITENS_NOTAS_FISCAIS AS INF 
    ON NF.NUMERO = INF.NUMERO 
    GROUP BY NF.CPF, CONVERT(VARCHAR(7), NF.DATA_VENDA, 120)
) AS TV
ON TV.CPF = TC.CPF;

/*Vamos filtrar essa consulta por mês e ano, porque eu não vou fazer isso para o ano todo.

Se rodarmos essa consulta, vamos ver que, dentro do mês de Janeiro 
de 2015, os clientes que compraram produtos e eu consigo ver quais 
foram válidos e quais foram inválidos. Agora, eu vou apresentar esse
relatório para o meu cliente e aí ele vai conseguir determinar quais
foram os clientes que compraram dentro do volume de compras estipulado
pelo contrato e os que compraram fora daquele volume de compras 
estipulado pelo contrato.*/


SELECT 
TC.CPF, TC.NOME, TC.VOLUME_DE_COMPRA, TV.MES_ANO, TV.QUANTIDADE_TOTAL, 
(CASE WHEN TC.VOLUME_DE_COMPRA >= TV.QUANTIDADE_TOTAL THEN 'VENDAS VÁLIDAS' 
ELSE 'VENDAS INVÁLIDAS' END) AS RESULTADO 
FROM TABELA_DE_CLIENTES AS TC 
INNER JOIN (
    SELECT NF.CPF, 
    CONVERT(VARCHAR(7), NF.DATA_VENDA, 120) AS MES_ANO, 
    SUM(INF.QUANTIDADE) AS QUANTIDADE_TOTAL 
    FROM NOTAS_FISCAIS AS NF 
    INNER JOIN ITENS_NOTAS_FISCAIS AS INF 
    ON NF.NUMERO = INF.NUMERO 
    GROUP BY NF.CPF, CONVERT(VARCHAR(7), NF.DATA_VENDA, 120)
) AS TV
ON TV.CPF = TC.CPF 
WHERE TV.MES_ANO = '2015-01';

--=========Desafio: complementando o relatório
/*Construímos um relatório que apresentou os clientes que tiveram 
vendas válidas e inválidas.

Nesse sentido, nosso compromisso agora é que você complemente este
relatório, isto é, listando somente os que tiveram vendas inválidas
e calculando a diferença entre o limite de venda máximo e o realizado,
em percentuais.

Vamos fazer um filtro especial para somente os que tiveram seus 
limites estourados, ou sejá, vai mostrar somente os que tiveram 
vendas inválidas,que ultrapassaram o valor combinado no contrato.*/

SELECT
TC.CPF, TC.NOME, TC.VOLUME_DE_COMPRA, TV.MES_ANO, TV.QUANTIDADE_TOTAL,
(CASE WHEN TC.VOLUME_DE_COMPRA >= TV.QUANTIDADE_TOTAL THEN 'VENDAS VÁLIDAS'
ELSE 'VENDAS INVÁLIDAS' END) AS RESULTADO
FROM TABELA_DE_CLIENTES TC
INNER JOIN
(
SELECT 
NF.CPF
,CONVERT(VARCHAR(7), NF.DATA_VENDA, 120) AS MES_ANO
,SUM(INF.QUANTIDADE) AS QUANTIDADE_TOTAL
FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO
GROUP BY
NF.CPF
, CONVERT(VARCHAR(7), NF.DATA_VENDA, 120)
) TV
ON TV.CPF = TC.CPF
WHERE TV.MES_ANO = '2015-01'
AND (TC.VOLUME_DE_COMPRA - TV.QUANTIDADE_TOTAL) < 0

--E finalmente, então, inserimos o novo indicador.

SELECT
TC.CPF, TC.NOME, TC.VOLUME_DE_COMPRA, TV.MES_ANO, TV.QUANTIDADE_TOTAL,
(CASE WHEN TC.VOLUME_DE_COMPRA >= TV.QUANTIDADE_TOTAL THEN 'VENDAS VÁLIDAS'
ELSE 'VENDAS INVÁLIDAS' END) AS RESULTADO,
(1 - (TC.VOLUME_DE_COMPRA/TV.QUANTIDADE_TOTAL)) * 100 AS PERCENTUAL
FROM TABELA_DE_CLIENTES TC
INNER JOIN
(
SELECT 
NF.CPF
,CONVERT(VARCHAR(7), NF.DATA_VENDA, 120) AS MES_ANO
,SUM(INF.QUANTIDADE) AS QUANTIDADE_TOTAL
FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO
GROUP BY
NF.CPF
, CONVERT(VARCHAR(7), NF.DATA_VENDA, 120)
) TV
ON TV.CPF = TC.CPF
WHERE TV.MES_ANO = '2015-01'
AND (TC.VOLUME_DE_COMPRA - TV.QUANTIDADE_TOTAL) < 0;

/*
Arredondar o resultado para duas casas decimais.*/

SELECT
TC.CPF, TC.NOME, TC.VOLUME_DE_COMPRA, TV.MES_ANO, TV.QUANTIDADE_TOTAL,
(CASE WHEN TC.VOLUME_DE_COMPRA >= TV.QUANTIDADE_TOTAL THEN 'VENDAS VÁLIDAS'
ELSE 'VENDAS INVÁLIDAS' END) AS RESULTADO,
ROUND((1 - (TC.VOLUME_DE_COMPRA/TV.QUANTIDADE_TOTAL)) * 100, 2) AS PERCENTUAL
FROM TABELA_DE_CLIENTES TC
INNER JOIN
(
SELECT 
NF.CPF
,CONVERT(VARCHAR(7), NF.DATA_VENDA, 120) AS MES_ANO
,SUM(INF.QUANTIDADE) AS QUANTIDADE_TOTAL
FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO
GROUP BY
NF.CPF
, CONVERT(VARCHAR(7), NF.DATA_VENDA, 120)
) TV
ON TV.CPF = TC.CPF
WHERE TV.MES_ANO = '2015-01'
AND (TC.VOLUME_DE_COMPRA - TV.QUANTIDADE_TOTAL) < 0;


--======= Vendas por sabor =========

/*
O usuário pediu um outro relatório, ele quer ver as vendas anuais,
ou seja, as vendas dentro do ano, dos meus sucos de frutas por sabor.
Mas não é só isso que ele quer não, ele quer que eu apresente esse
relatório ordenado, do que mais vendeu para o que menos vendeu.

Para eu ter as vendas por sabor, eu preciso ter o sabor, 
que está na tabela de produtos, preciso ter a quantidade,
que está na tabela dos itens das notas fiscais e preciso ter a 
data da venda, que está na tabela de notas fiscais.
Afinal, eu quero ver essa venda fechada no ano.

Eu tenho um campo em cada tabela,
então têm três tabelas que eu tenho que fazer o meu join. 
Nós podemos fazer join entre mais do que duas tabelas.
Então precisamos juntar essas três tabelas e pegar esses três campos,

Eu vou criar uma nova consulta e nós vamos fazer 
um join entre três tabelas

Primeira coisa: a tabela de produtos tem uma ligação com a tabela 
de itens de notas fiscais, através do campo CODIGO_DO_PRODUTO,
que é o campo em comum entre essas duas tabelas:

 Mas agora eu preciso ligar a tabela de itens com a tabela de 
 notas. O campo em comum é o NUMERO:

Eu preciso buscar o campo SABOR da tabela de produtos, o campo 
QUANTIDADE da tabela de itens e o campo DATA_VENDA de notas fiscais:
*/

SELECT TP.SABOR, NF.DATA_VENDA, INF.QUANTIDADE 
FROM TABELA_DE_PRODUTOS AS TP 
INNER JOIN ITENS_NOTAS_FISCAIS AS INF 
ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO 
INNER JOIN NOTAS_FISCAIS AS NF  
ON INF.NUMERO = NF.NUMERO;

/*o meu usuário quer ver isso por ano. Então eu preciso agrupar:
Eu tenho a minha venda agora por ano,*/

SELECT TP.SABOR, 
YEAR(NF.DATA_VENDA) AS ANO, 
SUM(INF.QUANTIDADE) AS VENDA_ANO 
FROM TABELA_DE_PRODUTOS AS TP 
INNER JOIN ITENS_NOTAS_FISCAIS AS INF 
ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO 
INNER JOIN NOTAS_FISCAIS AS NF 
ON INF.NUMERO = NF.NUMERO
GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA);

/*
 MAS preciso filtrar isso para um ano específico, 
 porque ele não quer ver todos os anos,
 ele quer ver isso ano a ano.

Então vamos supor que eu vá selecionar o ano de 2015, 
eu preciso colocar um where, lembrando que o where não
fica depois do group by, ele fica antes
*/

SELECT TP.SABOR, 
YEAR(NF.DATA_VENDA) AS ANO, 
SUM(INF.QUANTIDADE) AS VENDA_ANO 
FROM TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF 
ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO 
INNER JOIN NOTAS_FISCAIS NF 
ON INF.NUMERO = NF.NUMERO 
WHERE YEAR(NF.DATA_VENDA) = 2015 
GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA);

/*Só que o usuário quer isso ordenado da maior venda para a menor venda.
Então para nós chegarmos a essa posição, colocamos um order by:*/

SELECT TP.SABOR, 
YEAR(NF.DATA_VENDA) AS ANO, 
SUM(INF.QUANTIDADE) AS VENDA_ANO 
FROM TABELA_DE_PRODUTOS TP 
INNER JOIN ITENS_NOTAS_FISCAIS INF 
ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO 
INNER JOIN NOTAS_FISCAIS NF 
ON INF.NUMERO = NF.NUMERO 
WHERE YEAR(NF.DATA_VENDA) = 2015 
GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA) 
ORDER BY SUM(INF.QUANTIDADE) DESC;

/*[Então eu tenho um ranking, no ano de 2015,
manga foi o sabor que mais vendeu, vendeu 601 mil, 
depois vem laranja, melancia e assim por diante.

Eu entreguei isso para o meu cliente, só que ele falou: 
"gostei, mas eu queria uma coisa mais rebuscada, 
eu quero colocar ter um percentual da participação 
desta venda em relação à venda total do ano".

Então por exemplo, se eu vender 1 milhão de litros 
e se laranja vender 100 mil, laranja representou 
10% das vendas do ano.

Então o relatório voltou para mim, 
porque tenho que colocar agora um percentual, 
como é que eu vou colocar e calcular esse percentual?
Vamos fazer o seguinte: primeiro vamos nos preocupar 
em calcular esse total, eu vou agora fazer uma segunda query,
onde eu vou calcular o total do ano:

Para calcular o total do ano, preciso ter a quantidade,
que estão na tabela de itens, e preciso ter a data da venda,
que está na tabela de notas fiscais, e aí juntar essas duas 
tabelas através do campo NUMERO:

Como eu fiz um SUM, eu preciso de um group by

E eu vou colocar o where, para filtrar o ano, para mostrar somente 2015:
Se eu rodar essa segunda seleção, eu tenho aqui o total do ano.*/

SELECT YEAR(NF.DATA_VENDA) AS ANO, 
SUM(INF.QUANTIDADE) AS VENDA_TOTAL_ANO 
FROM NOTAS_FISCAIS NF 
INNER JOIN ITENS_NOTAS_FISCAIS INF 
ON NF.NUMERO = INF.NUMERO 
WHERE YEAR(NF.DATA_VENDA) = 2015 
GROUP BY YEAR(NF.DATA_VENDA);

/*Eu tenho duas consultas separadas, uma que me mostra o
ranking do valor e outra que mostra o total.

Para eu calcular a participação, eu preciso pegar o número
de vendas por sabor no ano, dividir pelo número de vendas 
totais do ano e multiplicar por 100, aí eu vou ter a 
participação do sabor em relação ao total.

Como é que eu consigo colocar juntar esses dois números?
Com o join 
E por qual campo em comum? 
O campo ano.

Então vamos lá, vamos fazer agora aqui um outro join,
onde meu primeiro from será a primeira query que fizemos:
E o inner join será a segunda query, que acabamos de fazer:
Eu vou chamar a primeira query de VS, que tem a ver com venda 
por sabor e a segunda query eu vou chamar de VA, que é a venda
no ano. E o campo em comum é o campo ano, da consulta VS, com o
campo ano, da consulta VA:
Da tabela VS, eu vou selecionar os campos SABOR, ANO e VENDA_ANO, 
e da tabela VA, eu vou selecionar o campo VENDA_TOTAL_ANO*/

/* Note o erro, pois eu estou usando um order by dentro de uma subquery,
isso não pode ser feito.*/

SELECT VS.SABOR, VS.ANO, VS.VENDA_ANO, VA.VENDA_TOTAL_ANO 
FROM (
    SELECT TP.SABOR, 
    YEAR(NF.DATA_VENDA) AS ANO, 
    SUM(INF.QUANTIDADE) AS VENDA_ANO 
    FROM TABELA_DE_PRODUTOS TP 
    INNER JOIN ITENS_NOTAS_FISCAIS INF 
    ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO 
    INNER JOIN NOTAS_FISCAIS NF 
    ON INF.NUMERO = NF.NUMERO 
    WHERE YEAR(NF.DATA_VENDA) = 2015 
    GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA) 
    ORDER BY SUM(INF.QUANTIDADE) DESC
) VS 
INNER JOIN (
    SELECT YEAR(NF.DATA_VENDA) AS ANO, 
    SUM(INF.QUANTIDADE) AS VENDA_TOTAL_ANO 
    FROM NOTAS_FISCAIS NF 
    INNER JOIN ITENS_NOTAS_FISCAIS INF 
    ON NF.NUMERO = INF.NUMERO 
    WHERE YEAR(NF.DATA_VENDA) = 2015 
    GROUP BY YEAR(NF.DATA_VENDA)
) VA 
ON VS.ANO = VA.ANO;

/*vou tirar o order by da subquery e ordenar a query final,
porém não vamos mais ordenar pelo campo que estávamos ordenando
antes, e sim ordenar pelo campo VS.VENDA_ANO:*/

SELECT VS.SABOR, VS.ANO, VS.VENDA_ANO, VA.VENDA_TOTAL_ANO 
FROM (
    SELECT TP.SABOR, 
    YEAR(NF.DATA_VENDA) AS ANO, 
    SUM(INF.QUANTIDADE) AS VENDA_ANO 
    FROM TABELA_DE_PRODUTOS TP 
    INNER JOIN ITENS_NOTAS_FISCAIS INF 
    ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO 
    INNER JOIN NOTAS_FISCAIS NF 
    ON INF.NUMERO = NF.NUMERO 
    WHERE YEAR(NF.DATA_VENDA) = 2015 
    GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA) 
) VS 
INNER JOIN (
    SELECT YEAR(NF.DATA_VENDA) AS ANO, 
    SUM(INF.QUANTIDADE) AS VENDA_TOTAL_ANO 
    FROM NOTAS_FISCAIS NF 
    INNER JOIN ITENS_NOTAS_FISCAIS INF 
    ON NF.NUMERO = INF.NUMERO 
    WHERE YEAR(NF.DATA_VENDA) = 2015 
    GROUP BY YEAR(NF.DATA_VENDA)
) VA 
ON VS.ANO = VA.ANO 
ORDER BY VS.VENDA_ANO DESC;

/* Agora, para calcular o percentual, eu tenho que dividir 
VENDA_ANO por VENDA_TOTAL_ANO e multiplicar por 100:

Ao executar, vemos a coluna inteira com o valor 0, 
por que isso está acontecendo? 
É um problema de tipo de campo, pois eu estou dividindo 
VS.VENDA_ANO por VA.VENDA_TOTAL_ANO, e esses dois valores
estão vindo do campo INF.QUANTIDADE.

O que acontece é que o campo QUANTIDADE é um inteiro. 
Então o que acontece? Ele deveria ter sido criado como float,
quando eu pego um inteiro e divido por outro inteiro, o SQL,
se der um número menor do que 1, que é o nosso caso, porque eu
estou dividindo a venda do sabor pela venda total, então sempre
o numerador vai ser menor que o denominador nessa divisão, logo,
o valor vai estar sempre o que? Menor que um.

[16:59] Como não tem número inteiro, o SQL obrigatoriamente me dá
como resultado um outro inteiro. E aí como esse valor dá menor que 
1, eu só vejo 0. */

SELECT VS.SABOR, VS.ANO, VS.VENDA_ANO, VA.VENDA_TOTAL_ANO, 
    (VS.VENDA_ANO/VA.VENDA_TOTAL_ANO) * 100 AS PERCENTUAL 
FROM (
    SELECT TP.SABOR, 
    YEAR(NF.DATA_VENDA) AS ANO, 
    SUM(INF.QUANTIDADE) AS VENDA_ANO 
    FROM TABELA_DE_PRODUTOS TP 
    INNER JOIN ITENS_NOTAS_FISCAIS INF 
    ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO 
    INNER JOIN NOTAS_FISCAIS NF 
    ON INF.NUMERO = NF.NUMERO 
    WHERE YEAR(NF.DATA_VENDA) = 2015 
    GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA) 
) VS 
INNER JOIN (
    SELECT YEAR(NF.DATA_VENDA) AS ANO, 
    SUM(INF.QUANTIDADE) AS VENDA_TOTAL_ANO 
    FROM NOTAS_FISCAIS NF 
    INNER JOIN ITENS_NOTAS_FISCAIS INF 
    ON NF.NUMERO = INF.NUMERO 
    WHERE YEAR(NF.DATA_VENDA) = 2015 
    GROUP BY YEAR(NF.DATA_VENDA)
) VA 
ON VS.ANO = VA.ANO 
ORDER BY VS.VENDA_ANO DESC;

/*Para resolver esse problema, eu tenho que converter este campo para float:*/

SELECT VS.SABOR, VS.ANO, VS.VENDA_ANO, VA.VENDA_TOTAL_ANO, 
    (CONVERT(FLOAT, VS.VENDA_ANO) / CONVERT(FLOAT, VA.VENDA_TOTAL_ANO)) * 100 AS PERCENTUAL 
FROM (
    SELECT TP.SABOR, 
    YEAR(NF.DATA_VENDA) AS ANO, 
    SUM(INF.QUANTIDADE) AS VENDA_ANO 
    FROM TABELA_DE_PRODUTOS TP 
    INNER JOIN ITENS_NOTAS_FISCAIS INF 
    ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO 
    INNER JOIN NOTAS_FISCAIS NF 
    ON INF.NUMERO = NF.NUMERO 
    WHERE YEAR(NF.DATA_VENDA) = 2015 
    GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA) 
) VS 
INNER JOIN (
    SELECT YEAR(NF.DATA_VENDA) AS ANO, 
    SUM(INF.QUANTIDADE) AS VENDA_TOTAL_ANO 
    FROM NOTAS_FISCAIS NF 
    INNER JOIN ITENS_NOTAS_FISCAIS INF 
    ON NF.NUMERO = INF.NUMERO 
    WHERE YEAR(NF.DATA_VENDA) = 2015 
    GROUP BY YEAR(NF.DATA_VENDA)
) VA 
ON VS.ANO = VA.ANO 
ORDER BY VS.VENDA_ANO DESC;

/*Se eu rodar agora a minha consulta, vemos que resolveu. 
Só que o meu usuário quer ver o percentual de participação 
só com duas casas decimais. Então, sobre o valor todo, eu 
vou aplicar o meu round com duas casas decimais:*/

SELECT VS.SABOR, VS.ANO, VS.VENDA_ANO, VA.VENDA_TOTAL_ANO, 
    ROUND((CONVERT(FLOAT, VS.VENDA_ANO) / CONVERT(FLOAT, VA.VENDA_TOTAL_ANO)) * 100, 2) AS PERCENTUAL 
FROM (
    SELECT TP.SABOR, 
    YEAR(NF.DATA_VENDA) AS ANO, 
    SUM(INF.QUANTIDADE) AS VENDA_ANO 
    FROM TABELA_DE_PRODUTOS TP 
    INNER JOIN ITENS_NOTAS_FISCAIS INF 
    ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO 
    INNER JOIN NOTAS_FISCAIS NF 
    ON INF.NUMERO = NF.NUMERO 
    WHERE YEAR(NF.DATA_VENDA) = 2015 
    GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA) 
) VS 
INNER JOIN (
    SELECT YEAR(NF.DATA_VENDA) AS ANO, 
    SUM(INF.QUANTIDADE) AS VENDA_TOTAL_ANO 
    FROM NOTAS_FISCAIS NF 
    INNER JOIN ITENS_NOTAS_FISCAIS INF 
    ON NF.NUMERO = INF.NUMERO 
    WHERE YEAR(NF.DATA_VENDA) = 2015 
    GROUP BY YEAR(NF.DATA_VENDA)
) VA 
ON VS.ANO = VA.ANO 
ORDER BY VS.VENDA_ANO DESC;

/*[18:59] O indicador VA.VENDA_TOTAL_ANO não precisa aparecer mais,
pois eu não preciso ter o valor da venda total do ano repetido na
coluna, então esse aqui eu tirar, ficando o resultado final da 
seguinte forma:*/

SELECT VS.SABOR, VS.ANO, VS.VENDA_ANO, 
    ROUND((CONVERT(FLOAT, VS.VENDA_ANO) / CONVERT(FLOAT, VA.VENDA_TOTAL_ANO)) * 100, 2) AS PERCENTUAL 
FROM (
    SELECT TP.SABOR, 
    YEAR(NF.DATA_VENDA) AS ANO, 
    SUM(INF.QUANTIDADE) AS VENDA_ANO 
    FROM TABELA_DE_PRODUTOS TP 
    INNER JOIN ITENS_NOTAS_FISCAIS INF 
    ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO 
    INNER JOIN NOTAS_FISCAIS NF 
    ON INF.NUMERO = NF.NUMERO 
    WHERE YEAR(NF.DATA_VENDA) = 2015 
    GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA) 
) VS 
INNER JOIN (
    SELECT YEAR(NF.DATA_VENDA) AS ANO, 
    SUM(INF.QUANTIDADE) AS VENDA_TOTAL_ANO 
    FROM NOTAS_FISCAIS NF 
    INNER JOIN ITENS_NOTAS_FISCAIS INF 
    ON NF.NUMERO = INF.NUMERO 
    WHERE YEAR(NF.DATA_VENDA) = 2015 
    GROUP BY YEAR(NF.DATA_VENDA)
) VA 
ON VS.ANO = VA.ANO 
ORDER BY VS.VENDA_ANO DESC;

/* Então eu tenho para 2015, manga representou 16,78% das vendas totais,
laranja 13,34%, melancia 13,23% e assim por diante.

Se eu quiser ver isso para o ano de 2016, basta eu colocar 
2016 nos dois where e aí executar a consulta de novo.*/

--==========Desafio: vendas percentuais por tamanho==========

/*Agora, a ideia é focar neste relatório novamente, porém que você modifique o relatório tendo como objetivo ver o
ranking das vendas por tamanho.
*/

SELECT
VS.SABOR, VS.ANO, VS.VENDA_ANO,
ROUND((CONVERT( FLOAT, VS.VENDA_ANO) / CONVERT( FLOAT, VA.VENDA_TOTAL_ANO)) * 100, 2) AS PERCENTUAL
FROM 
(
SELECT
TP.SABOR
,YEAR(NF.DATA_VENDA) AS ANO
,SUM(INF.QUANTIDADE) AS VENDA_ANO
FROM TABELA_DE_PRODUTOS TP
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF
ON INF.NUMERO = NF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA)
) VS
INNER JOIN
(
SELECT 
YEAR(NF.DATA_VENDA) AS ANO
, SUM(INF.QUANTIDADE) AS VENDA_TOTAL_ANO
FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY YEAR(NF.DATA_VENDA)
) VA
ON VS.ANO = VA.ANO
ORDER BY VS.VENDA_ANO DESC;

/*Logo, faça um FIND/REPLACE na consulta substituindo onde temos SABOR por TAMANHO. Ficando assim.*/

SELECT
VS.TAMANHO, VS.ANO, VS.VENDA_ANO,
ROUND((CONVERT( FLOAT, VS.VENDA_ANO) / CONVERT( FLOAT, VA.VENDA_TOTAL_ANO)) * 100, 2) AS PERCENTUAL
FROM 
(
SELECT
TP.TAMANHO
,YEAR(NF.DATA_VENDA) AS ANO
,SUM(INF.QUANTIDADE) AS VENDA_ANO
FROM TABELA_DE_PRODUTOS TP
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS NF
ON INF.NUMERO = NF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY TP.TAMANHO, YEAR(NF.DATA_VENDA)
) VS
INNER JOIN
(
SELECT 
YEAR(NF.DATA_VENDA) AS ANO
, SUM(INF.QUANTIDADE) AS VENDA_TOTAL_ANO
FROM NOTAS_FISCAIS NF
INNER JOIN ITENS_NOTAS_FISCAIS INF
ON NF.NUMERO = INF.NUMERO
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY YEAR(NF.DATA_VENDA)
) VA
ON VS.ANO = VA.ANO
ORDER BY VS.VENDA_ANO DESC;

/*Pronto, agora podemos dar por finalizada nossa demanda de modificar o relatório por ranking das vendas por tamanho.*/