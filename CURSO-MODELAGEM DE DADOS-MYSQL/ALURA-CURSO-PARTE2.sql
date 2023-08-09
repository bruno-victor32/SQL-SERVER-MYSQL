CREATE DATABASE sucos_vendas;

/*Fazendo a comunicação com o banco de dados,selecionando o banco de dados*/
USE sucos_vendas;

SELECT * FROM itens_notas_fiscais;

SELECT cpf, nome, endereco_1, endereco_2, bairro, cidade, estado, cep, data_de_nascimento, idade, sexo, limite_de_credito, volume_de_compra,primeira_compra FROM tabela_de_clientes;

SELECT * FROM tabela_de_clientes;

SELECT nome, cpf FROM tabela_de_clientes;

/*Vou apelidar o campo "CPF" de "Identificador" e o campo "nome" vou apelidar de "Cliente"*/
SELECT cpf AS IDENTIFICADOR, nome AS CLIENTE FROM tabela_de_clientes;

SELECT * FROM tabela_de_produtos;

SELECT * FROM tabela_de_produtos WHERE codigo_do_produto = '1000889'; /*O campo "codigo_do_produto" e uma chave primaria, ou seja, tem indices.
																		Ao consultar vai retornar o resultado da consulta mais rapido do que 
                                                                        uma consulta utilizando um campo não chave, pois o mesmo não vai ter indices*/

SELECT * FROM tabela_de_produtos WHERE sabor = 'Manga'; /*Aqui vai ser uma consulta utilizando um campo não chave, ou seja, a consulta vai retornar o resultado de 
														forma mais lenta, em comparação de uma consulta com chave primaria.Esse campo não tem indices, pois ele não e uma
                                                        chave primaria*/

/*Quando você consulta utilizando chave primaria significa que essa chave primaria tem indices, tornando a busca mais rapida.
Quando você está consultando utilizando um campo que não e chave primaria, ou seja, que não tem indice a busca vai ser mais lenta em comparação a uma consulta
utilizando chave primaria*/

/*Quando você diz que um campo e chave primaria, automaticamente o mysql gera um indice para esse campo, possibilitando consultas mais rapidas em comparação ao 
um campo não chave*/

SELECT * FROM tabela_de_produtos WHERE embalagem = 'pet';

SELECT * FROM tabela_de_produtos WHERE embalagem = 'PET';

SELECT * FROM tabela_de_produtos WHERE preco_de_lista = 19.51;/*Essa consulta vai retornar vazio, devido o campo preco_de_lista ser do tipo 
																float e devido ser esse tipo o MYSQL não consegue achar o valor exato*/
                                                                
SELECT * FROM tabela_de_produtos WHERE preco_de_lista BETWEEN 19.50 and 19.52;

/*A consulta vai retornar produtos de sabor manga "OU" produtos que tem tamanho 470 ml, vai retornar um ou outro*/
SELECT * FROM tabela_de_produtos WHERE sabor = 'Manga' 
OR tamanho =  '470 ml';

/*A consulta vai retornar produtos de sabor manga "E" produtos que tem tamanho 470 ml, vai retornar os produtos que sejam sabor de manga e do tamanho de 470 ml*/
SELECT * FROM tabela_de_produtos WHERE sabor = 'Manga' 
AND tamanho =  '470 ml';

/*Aqui nesse caso devido o "NOT" vai mostrar todos os produtos menos os que tenham sabor de manga e ao mesmo tempo sejam do tamanho de 470 ml*/
SELECT * FROM tabela_de_produtos WHERE NOT (sabor = 'Manga' 
AND tamanho =  '470 ml');

/*Nesse caso não vai retornar  nenhum produto que tenha sabor de manga OU que tenham o  tamanho de 470 ml*/
SELECT * FROM tabela_de_produtos WHERE NOT (sabor = 'Manga' 
OR tamanho =  '470 ml');

/*Quero que mostre um produto de sabor de manga e que o tamanho não seja 470 ml */
SELECT * FROM tabela_de_produtos WHERE sabor = 'Manga' 
AND NOT (tamanho =  '470 ml');

/*Quero que mostre um produto de sabor de manga ou que o tamanho não seja 470 ml, ou seja, vai mostrar um "ou" outro produto*/
SELECT * FROM tabela_de_produtos WHERE sabor = 'Manga' 
OR NOT (tamanho =  '470 ml');

/*Vou listar todos os produtos que sejam do sabor de manga OU do sabor de laranja*/
SELECT * FROM tabela_de_produtos WHERE sabor IN ('Laranja', 'Manga');

/*Essa maneira e a mesma coisa que a linha de cima*, ou seja, vai retornar produtos que sejam do sabor de manga OU do sabor de laranja*/
SELECT * FROM tabela_de_produtos WHERE sabor = 'Laranja' OR sabor = 'Manga';

/*Vou listar todo mundo que mora no "Rio de Janeiro ou em São Paulo" e que tenham uma idade maior ou igual a 20 anos*/
SELECT * FROM tabela_de_clientes WHERE cidade IN ('Rio de Janeiro', 'São Paulo')
AND idade >=20;

/*Vou listar todo mundo que mora no "Rio de Janeiro ou em São Paulo" e que tenham uma idade maior ou igual a 19 anos e a idade menor igual a 21 anos*/
SELECT * FROM tabela_de_clientes WHERE cidade IN ('Rio de Janeiro', 'São Paulo')
AND (idade >= 19 AND idade <= 21);

/*Vou listar todo mundo que mora no "Rio de Janeiro ou em São Paulo" e que tenham uma idade maior ou igual a 20 anos e a idade menor igual a 22 anos*/
SELECT * FROM tabela_de_clientes WHERE cidade IN ('Rio de Janeiro', 'São Paulo')
AND (idade >= 20 AND idade <= 22);

/*Vai retornar todos os produtos que tenham o sabor "Maça", independente si seja no inicio do nome, no meio ou no fim do nome*/
SELECT * FROM tabela_de_produtos WHERE sabor LIKE '%Maça%';

/*Vai retornar todos os produtos que tenham o sabor "Maça", independente si seja no inicio do nome, no meio ou no fim do nome E que sejam de embalagem do tipo PET*/
SELECT * FROM tabela_de_produtos WHERE sabor LIKE '%Maça%'
AND embalagem = 'PET';

/*Vai retornar todos os clientes que possuem o último sobrenome Mattos*/
SELECT * FROM tabela_de_clientes WHERE nome LIKE '%Mattos';

SELECT * FROM tabela_de_clientes;

SELECT embalagem, tamanho, sabor FROM tabela_de_produtos;

/*O distinct vai selecionar a "EMBALAGEM" e "TAMANHO" dos produtos na tabela produtos  e vai mostrar apenas uma vez
Exemplo:Pode ter nessa tabela 10 produtos com a embalagem do tipo PET e do tamanho de 2 Litros  , mas só vai mostrar uma vez esse produto do tipo PET  e do tamanho de 2 Litros
Aqui vai ser mostrado as combinações que não se repetem*/
SELECT DISTINCT embalagem, tamanho FROM tabela_de_produtos;

/*Vai retornar as embalagens e os tamanhos disponíveis para o sabor de laranja*/
/*Como estou utilizando o distinct pode ter varios produtos que tenham o sabor laranja, com a embalagem do tipo PET e o tamanho de 2 litros, mas só vai retonar uma vez esse produto*/
SELECT DISTINCT embalagem, tamanho, sabor FROM tabela_de_produtos
WHERE sabor = 'Laranja';

/*O distinct vai selecionar a "EMBALAGEM", "TAMANHO" e "SABOR" dos produtos na tabela produtos  e vai mostrar apenas uma vez
Exemplo:Pode ter nessa tabela 10 produtos com a embalagem do tipo PET e do tamanho de 2 Litros e do sabor de maça , mas só vai mostrar uma vez esse produto do tipo PET,do tamanho de 2 Litros e do sabor de maça
Aqui vai ser mostrado as combinações que não se repetem*/
SELECT DISTINCT embalagem, tamanho, sabor FROM tabela_de_produtos;

select * from tabela_de_clientes;

/*Vai retornar os bairros da cidade do Rio de Janeiro que possuem clientes*/
SELECT DISTINCT bairro FROM tabela_de_clientes
WHERE cidade = 'Rio de Janeiro';

/*Comando "LIMIT" - Limita o número de linhas exibidas*/

select * from tabela_de_clientes;

select * from tabela_de_clientes LIMIT 2;/*Vai mostrar na tela as duas primeiras linhas/registros da tabela*/

/*Essa consulta utilizando o "LIMIT 2,3" vai retornar da seguinte maneira, vai pular as duas primeiras linhas e vai mostrar na tela os registros 
da terceira,quarta e quinta linhas da tabela de clientes */
SELECT * FROM tabela_de_clientes LIMIT 2,3;

SELECT * FROM tabela_de_produtos;

/*Vai retornar na tela os 5 primeiros registros/linhas da tabela de produtos*/
SELECT * FROM tabela_de_produtos LIMIT 5;

/*Essa consulta utilizando o "LIMIT 2,3" vai retornar da seguinte maneira, vai pular as duas primeiras linhas e vai mostrar na tela os registros 
da terceira,quarta e quinta linhas da tabela de clientes */
SELECT * FROM tabela_de_produtos LIMIT 2,3;

/*Vai mostrar a primeira linha da tabela devido ela ser o número "0" e vai mostrar a segunda linha da tabela que e o número "1", totalizando 2 linhas da tabela*/
SELECT * FROM tabela_de_produtos LIMIT 0,2;

SELECT * FROM tabela_de_vendedores;

SELECT * FROM notas_fiscais;

/*Queremos obter as 10 primeiras vendas do dia 01/01/2017.*/
SELECT * FROM notas_fiscais  WHERE DATA_VENDA = '2017-01-01' limit 10;

/*Apresenta o resultado da consulta ordenado pelo campo determinado no ORDER BY, quando estamos colocando somente "ORDER BY", significa que ele está ordenando automaticamente 
de ordem "CRESCENTE" do "maior para o menor" ou do "A" ao "Z",ou seja, de modo ASC(Ascendente)
Podemos também determinar que a consulta seja ordenada de modo DESC(Descendente), ou seja, do menor para o maior ou do "Z" ao "A"*/

SELECT * FROM tabela_de_produtos;

/*Como o ORDER BY quando a gente não coloca "ASC" OU "DESC", ele automaticamente por padrão ordenar os campos da tabela de forma Crescente, ou seja, do menor 
"preco_de_lista" para o maior "preco_de_lista"*/
SELECT * FROM tabela_de_produtos ORDER BY preco_de_lista;

/*Estou ordenando os campos da tabela de forma decrescente, ou seja, do maior 
"preco_de_lista" para o menor "preco_de_lista"*/
SELECT * FROM tabela_de_produtos ORDER BY  preco_de_lista DESC;

/*Como o ORDER BY quando a gente não coloca "ASC" OU "DESC", ele automaticamente por padrão ordenar os campos da tabela de forma Crescente, ou seja, do "A" ao "Z" no campo "nome_do_produto"*/
SELECT * FROM tabela_de_produtos ORDER BY nome_do_produto;

/*Estou ordenando os campos da tabela de forma decrescente, ou seja, do "Z" ao "A"*/
SELECT * FROM tabela_de_produtos ORDER BY nome_do_produto DESC;

/*Como o ORDER BY quando a gente não coloca "ASC" OU "DESC", ele automaticamente por padrão ordenar os campos da tabela de forma Crescente, ou seja, do "A" ao "Z" 
no campo "embalagem" e no campo "nome_do_produto"*/
SELECT * FROM tabela_de_produtos ORDER BY embalagem, nome_do_produto;

/*O campo "EMBALAGEM" vai ser ordenado do "Z" ao "A", e o campo "nome_do_produto" vai ser ordenado do "A" ao "Z"*/
SELECT * FROM tabela_de_produtos ORDER BY embalagem DESC, nome_do_produto ASC;

SELECT * FROM tabela_de_produtos;
SELECT * FROM notas_fiscais;
SELECT * FROM itens_notas_fiscais;

/*1º Passo Buscar o código do produto "Linha Refrescante - 1 Litro - Morango/Limão"*/
SELECT * FROM tabela_de_produtos WHERE nome_do_produto = 'Linha Refrescante - 1 Litro - Morango/Limão';

/*2º Com a consulta acima obtemos o resultado do código deste produto: ‘1101035’*/
/*Com esta informação fazemos a consulta para achar a maior quantidade vendida deste produto.*/
SELECT * FROM itens_notas_fiscais WHERE codigo_do_produto = '1101035' ORDER BY QUANTIDADE DESC;

/*	No "GROUP BY" podemos utilizar 
	"SUM" : Soma	
	"MAX" : Máximo	
	"MIN" : Mínimo	
	"AVG" : Média	 
"COUNT" :Contas ocorrencias*/

SELECT * FROM tabela_de_clientes;

SELECT estado, limite_de_credito FROM tabela_de_clientes;

/*Quero agrupar, saber o limite de credito que eu tenho em São Paulo e no Rio de Janeiro 
Nesse caso quero que mostre os campos "Estado" e "limite de credito, vou agrupar utilizando o campo "estado".Foi realizado a soma de todos
os "limites_de_creditos" dos funcionarios de São Paulo e Rio de Janeiro*/
/*Quando utilizamos o "SUM" que e uma formula, o nome do campo tenho que colocar um alians, ou seja, um apelido.
Nesse caso apelidei o campo "limite_de_credito" de "LIMITE_TOTAL"*/
SELECT estado, SUM(limite_de_credito) AS LIMITE_TOTAL FROM tabela_de_clientes GROUP BY estado;

SELECT embalagem, preco_de_lista FROM tabela_de_produtos;

/*Quero que mostre os campos "embalagem" e " preco_de_lista", esse ultimo campo recebeu um apelido de "maior_preco".
Vou agrupar utilizando o campo "embalagem"
Quero que mostre os maiores precos dos produtos conforme suas embalagens*/
SELECT embalagem, MAX(preco_de_lista) AS maior_preco FROM tabela_de_produtos GROUP BY embalagem;

/*Quero contar quantidade de embalagens do tipo PET, Garrafa, Lata tem no banco de dados*/
SELECT embalagem, COUNT(*) AS contador FROM tabela_de_produtos GROUP BY embalagem;

SELECT estado, bairro, limite_de_credito FROM tabela_de_clientes;

/*Quero que essa consulta agrupe as informações utilizando o campo "bairro" e mostre a soma do "limite_de_credito" de todos os clientes que tem casas nesses bairros especificos*/
SELECT bairro, SUM(limite_de_credito) AS limite FROM tabela_de_clientes GROUP BY bairro;

/*Quero que essa consulta agrupe as informações utilizando o campo "bairro" e mostre a soma do "limite_de_credito" de todos os clientes que tem casas nos bairros localizado na cidade do Rio de Janeiro*/
SELECT bairro, SUM(limite_de_credito) AS limite FROM tabela_de_clientes 
WHERE cidade = 'Rio de Janeiro' GROUP BY bairro;

/*Quero que essa consulta agrupe as informações utilizando o campo "bairro" e o campo "estado" e mostre a soma do "limite_de_credito" de todos os clientes que tem casas nesses bairros especificos*/
SELECT estado, bairro, SUM(limite_de_credito) AS limite FROM tabela_de_clientes 
GROUP BY estado, bairro; /*Aqui estou agrupando os dados por estado e por bairro*/
/*Quero que essa consulta agrupe as informações utilizando o campo "bairro" e o campo "estado" e mostre a soma do "limite_de_credito" de todos os clientes que tem casas nesses bairros especificos*/

SELECT  estado, bairro, SUM(limite_de_credito) AS limite FROM tabela_de_clientes  
WHERE cidade = 'Rio de Janeiro' GROUP BY estado, bairro; 	/*Aqui estou agrupando os dados por estado e por bairro*/

/*Quero que essa consulta agrupe as informações utilizando o campo "bairro" e "estado" e mostre a soma do "limite_de_credito" de todos os clientes que tem casas nos bairros localizado na cidade do Rio de Janeiro*/
SELECT  estado, bairro, SUM(limite_de_credito) AS limite FROM tabela_de_clientes  WHERE cidade = 'Rio de Janeiro'
GROUP BY estado, bairro		/*Aqui estou agrupando os dados por estado e por bairro*/
ORDER BY bairro;            /*Estou ordenando por bairro, ou seja, vai mostrar conforme ordem alfabetica do "A" ao "Z"*/ 	

select * from tabela_de_produtos;

select * from itens_notas_fiscais;

select * from itens_notas_fiscais where `CODIGO_DO_PRODUTO` = '1101035';

 /*quantos itens de venda existem para o produto '1101035' ?*/

/*1º Passo: Estou verificando qual foi a maior quantidade do produto "1101035" foi pedido em uma venda*/
SELECT MAX(`QUANTIDADE`) as 'MAIOR QUANTIDADE' FROM itens_notas_fiscais WHERE `CODIGO_DO_PRODUTO` = '1101035' ;

/*2ºPasso: Estou contabilizando quantas vezes o produto "1101035" vendeu o total de 99 itens*/
SELECT COUNT(*) FROM itens_notas_fiscais WHERE codigo_do_produto = '1101035' AND QUANTIDADE = 99;

SELECT COUNT(QUANTIDADE) FROM ITENS_NOTAS_FISCAIS
WHERE CODIGO_DO_PRODUTO = '1101035'
AND QUANTIDADE = (SELECT MAX(QUANTIDADE) FROM ITENS_NOTAS_FISCAIS 
WHERE CODIGO_DO_PRODUTO = '1101035');

/*Quero que seja mostrado na tela a soma do limite de credito de todos os clientes de todos estados armazenados no banco de dados
O campo "estado" será agrupado*/
SELECT estado, SUM(limite_de_credito) AS soma_limite FROM tabela_de_clientes
GROUP BY estado;

/*Quero que seja mostrado na tela a soma do limite de credito de todos os clientes que sejam maior de "900000" 
O campo "estado" será agrupado
*/
SELECT estado, SUM(limite_de_credito) AS soma_limite FROM tabela_de_clientes
GROUP BY estado HAVING SUM(limite_de_credito) > 900000;

/*Quero que mostre o maior e o menor preço dos produtos conforme o tipo de embalagem do produto "PET,Garrafa,Lata", nesse caso vou agrupar por "EMBALAGEM"*/
SELECT embalagem, MAX(preco_de_lista) AS maior_preco,
MIN(preco_de_lista) AS menor_preco FROM tabela_de_produtos
GROUP BY embalagem;

/*Quero que mostre o maior e o menor preço dos produtos conforme o tipo de embalagem do produto "PET,Garrafa,Lata" que a soma do preço de lista seja menor que 80 reais
, nesse caso vou agrupar por "EMBALAGEM"*/
SELECT embalagem, MAX(preco_de_lista) AS maior_preco,
MIN(preco_de_lista) AS menor_preco FROM tabela_de_produtos
GROUP BY embalagem HAVING SUM(preco_de_lista) <= 80;

/*Quero que mostre o maior e o menor preço dos produtos conforme o tipo de embalagem do produto "PET,Garrafa,Lata" 
que a soma do preço de lista seja menor que 80 reais e que o maior preco de lista seja maior ou igual a 5, nesse caso vou agrupar por "EMBALAGEM"*/
SELECT embalagem, MAX(preco_de_lista) AS maior_preco,
MIN(preco_de_lista) AS menor_preco FROM tabela_de_produtos
GROUP BY embalagem HAVING SUM(preco_de_lista) <= 80 AND MAX(preco_de_lista) >= 5;

/*Quais foram os clientes que fizeram mais de 2000 compras em 2016?*/
/*1ºPasso: Mostre na tela de forma agrupada os campos "cpf" e contabilizar qual foi o total de vendas feita no ano de 2016*/
SELECT CPF, COUNT(*) AS total_vendas FROM notas_fiscais
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY CPF;

/*2ºPasso: Mostre na tela de forma agrupada os campos "cpf" e que mostre somente o total de vendas que sejá acima de 2000 vendas no ano de 2016*/
SELECT CPF, COUNT(*) AS total_vendas FROM notas_fiscais
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY CPF
HAVING COUNT(*) > 2000;

/*Outra maneira de fazer o mesmo select*/
SELECT CPF, COUNT(*) AS NUM_COMPRAS FROM NOTAS_FISCAIS 
WHERE YEAR(DATA_VENDA) = '2016' GROUP BY CPF
HAVING NUM_COMPRAS > 2000;

select * from tabela_de_produtos;

/*Quero que mostre na tela os campos "nome_do_produto" e o "preco_de_lista" quando o preço do produto for maior igual a 12 , esse produto e caro
Quando o produto tiver o preço maior ou igual a 7 e menor que 12 e um produto em conta
Quando o produto não for nem caro e nem em conta, ele será um produto barato
Também coloquei chamado "status_preco"*/
SELECT nome_do_produto, preco_de_lista,
CASE
	WHEN preco_de_lista >= 12 THEN 'Produto Caro'
    WHEN preco_de_lista >= 7 AND preco_de_lista < 12 THEN 'Produto em Conta'
    ELSE 'Produto Barato' 
END AS status_preco 
FROM tabela_de_produtos;

/*Nesse caso estou agrupando os campo "embalagem" e declarando si um produto e caro,barato ou em conta.
Também estou fazendo a media dos produtos que são considerados em conta, produtos que são considerados baratos e caros*/
SELECT embalagem,
CASE
	WHEN preco_de_lista >= 12 THEN 'Produto Caro'
    WHEN preco_de_lista >= 7 AND preco_de_lista < 12 THEN 'Produto em Conta'
    ELSE 'Produto Barato' 
END AS status_preco, AVG(preco_de_lista) AS preco_medio
FROM tabela_de_produtos
GROUP BY embalagem,
CASE
	WHEN preco_de_lista >= 12 THEN 'Produto Caro'
    WHEN preco_de_lista >= 7 AND preco_de_lista < 12 THEN 'Produto em Conta'
    ELSE 'Produto Barato' 
END
ORDER BY embalagem;

/*Nesse caso estou agrupando os campo "embalagem" e declarando si um produto e caro,barato ou em conta.
Também estou fazendo a media dos produtos que sejam do sabor manga e  que são considerados em conta, produtos que são considerados baratos e caros*/
SELECT embalagem,
CASE
	WHEN preco_de_lista >= 12 THEN 'Produto Caro'
    WHEN preco_de_lista >= 7 AND preco_de_lista < 12 THEN 'Produto em Conta'
    ELSE 'Produto Barato' 
END AS status_preco, AVG(preco_de_lista) AS preco_medio
FROM tabela_de_produtos
WHERE sabor = 'Manga'
GROUP BY embalagem,
CASE
	WHEN preco_de_lista >= 12 THEN 'Produto Caro'
    WHEN preco_de_lista >= 7 AND preco_de_lista < 12 THEN 'Produto em Conta'
    ELSE 'Produto Barato' 
END
ORDER BY embalagem;

/* Explicação de utilizar esses dois CASES 		

O CASE também foi utilizado no Group by, para que o agrupamento também levasse em consideração o resultado do CASE.

Veja bem, quando não utilizamos o CASE, apenas seria agrupado pelo campo EMBALAGEM, 
não levando em consideração todos os resultados retornados no CASE. Por exemplo, se a em 
EMBALAGEM GARRAFA tiver produtos que se enquadrem em PRODUTO BARATO e PRODUTO EM CONTA, apenas
 uma delas seria retornada, pois estamos agrupando apenas pela EMBALAGEM.  
 
 -------- Não utilizando o CASE no Group by -------------*/
SELECT embalagem,
CASE
	WHEN preco_de_lista >= 12 THEN 'Produto Caro'
    WHEN preco_de_lista >= 7 AND preco_de_lista < 12 THEN 'Produto em Conta'
    ELSE 'Produto Barato' 
END AS status_preco, AVG(preco_de_lista) AS preco_medio
FROM tabela_de_produtos
GROUP BY embalagem order by EMBALAGEM;

/*---------- Utilizando o CASE no Group by ------------------ */
SELECT embalagem,
CASE
	WHEN preco_de_lista >= 12 THEN 'Produto Caro'
    WHEN preco_de_lista >= 7 AND preco_de_lista < 12 THEN 'Produto em Conta'
    ELSE 'Produto Barato' 
END AS status_preco, AVG(preco_de_lista) AS preco_medio
FROM tabela_de_produtos
GROUP BY embalagem,
CASE
	WHEN preco_de_lista >= 12 THEN 'Produto Caro'
    WHEN preco_de_lista >= 7 AND preco_de_lista < 12 THEN 'Produto em Conta'
    ELSE 'Produto Barato' 
END
ORDER BY embalagem;

SELECT * FROM tabela_de_clientes;

/*Veja o ano de nascimento dos clientes e classifique-os como: Nascidos antes de 1990 são velhos, 
nascidos entre 1990 e 1995 são jovens e nascidos depois de 1995 são crianças. Liste o nome do cliente e esta classificação.
*/
SELECT  cpf, nome, data_de_nascimento,
CASE
	WHEN YEAR(data_de_nascimento) < 1990 THEN 'São clientes idosos'
    WHEN YEAR(data_de_nascimento) >= 1990 AND YEAR(data_de_nascimento) <= '1995' THEN 'São clientes jovens'
    ELSE 'Crianças'
END AS classificação_idade
FROM tabela_de_clientes;
