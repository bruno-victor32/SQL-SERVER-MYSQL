/*Retirando os espaços a esquerda da palavra "Olá"*/
SELECT LTRIM('		OLÁ') AS RESULTADO;

/*Retirando os espaços a direita da palavra "Olá"*/
SELECT RTRIM('OLÁ		') AS RESULTADO;

/*Retirando os iniciais e finais da palavra "Olá", mas os espaços do meio da string não são removidos*/
SELECT LTRIM('		OLÁ BRUNO		') AS RESULTADO;

/*Essa função permite juntar os textos*/
SELECT CONCAT('OLÁ', ' ', 'TUDO BEM','?') AS RESULTADO;
SELECT CONCAT('OLÁ','TUDOBEM','?') AS RESULTADO;

/*Convertendo o texto para maiusculo*/
SELECT UPPER('olá tudo bem?') AS RESULTADO;

/*Convertendo o texto para Minusculo*/
SELECT UPPER('OLÁ TUDO BEM?') AS RESULTADO;

/*Vai pegar da posição 6 até o final da frase.A posição 6 inicia no "T", o espaço em branco conta como posição */
SELECT SUBSTRING('OLÁ, TUDO BEM?', 6) AS RESULTADO;

/*Vai pegar a partir da posição 6  até 4 caracteres .A posição 6 inicia no "T", ou seja, "T" e o primeiro caractere,
 "U" e o segundo, "D" e o terceiro, "O" e o quarto caractere */
SELECT SUBSTRING('OLÁ, TUDO BEM?', 6, 4) AS RESULTADO;

USE sucos_vendas;

SELECT * FROM tabela_de_clientes;

/*Consigo juntar nome do cliente e entre "()" o cpf do cliente, que são campos diferentes*/
SELECT CONCAT(NOME,'  (',CPF, ') ') AS RESULTADO FROM tabela_de_clientes;

/*REALIZANDO  consulta listando o nome do cliente e o endereço completo (Com rua, bairro, cidade e estado).*/
SELECT CONCAT(' (',NOME,'   ', ENDERECO_1,'   ', BAIRRO,'   ', CIDADE,'   ', ESTADO, ') ') AS COMPLETO FROM tabela_de_clientes;

/*Retornar a data atual*/
SELECT CURDATE();

/*Retorna a hora atual*/
SELECT CURRENT_TIME();

/*Retorna a data e a hora atuais*/
SELECT CURRENT_TIMESTAMP();

/*Quero que retorne o ano*/
SELECT YEAR(CURRENT_TIMESTAMP());

/*Quero que retorne o dia*/
SELECT DAY(CURRENT_TIMESTAMP());

/*Quero que retorne o mês*/
SELECT MONTH(CURRENT_TIMESTAMP());

/*Quero que retorne o nome do mês*/
SELECT MONTHNAME(CURRENT_TIMESTAMP());

/*Quero saber quantos dias tem entre a data de 01-01-2019 e a data de hoje*/
SELECT DATEDIFF(CURRENT_TIMESTAMP(), '2019-01-01') AS RESULTADO;

/*Quero saber quantos dias teu vivi até hoje*/
SELECT DATEDIFF(CURRENT_TIMESTAMP(), '1996-02-24') AS RESULTADO;

/*Estou subtraindo 5 dias da data atual*/
SELECT CURRENT_TIMESTAMP() AS DIA_DE_HOJE,
DATE_SUB(CURRENT_TIMESTAMP(), INTERVAL 5 DAY) AS RESULTADO;

/*Vai mostrar todas as datas que emitimos as notas fiscais da minha empresa de suco de uva*/
SELECT DISTINCT DATA_VENDA FROM notas_fiscais;

/*Vai mostrar todas as datas que emitimos as notas fiscais da minha empresa de suco de uva*/
SELECT DISTINCT DATA_VENDA, DAYNAME(DATA_VENDA) AS DIA, MONTHNAME(DATA_VENDA) AS MES, YEAR(DATA_VENDA) AS ANO
FROM notas_fiscais;

SELECT * FROM tabela_de_clientes;

/*Aqui estou criando uma consulta que mostre o nome e a idade atual dos clientes.*/
SELECT NOME, TIMESTAMPDIFF (YEAR, DATA_DE_NASCIMENTO, CURDATE()) AS    IDADE
FROM  tabela_de_clientes;

SELECT (23+((25-2)/2)*45) AS RESULTADO;

/*Vai arredondar o número */
SELECT CEILING(12.3333232323) AS RESULTADO;

/*Vai arredondar o número */
SELECT ROUND(12.3333232323) AS RESULTADO;

/*Vai arredondar o número */
SELECT ROUND(12.7773232323) AS RESULTADO;

/*Vai retornar um número aleatorio*/
SELECT RAND() AS RESULTADO;

SELECT numero, quantidade, preco, ROUND(quantidade * preco, 2) AS FATURAMENTO FROM itens_notas_fiscais;/*Estou arredondando para 2 casas decimais*/

/*A  função ABS() nos fornecerá o valor absoluto de um número. Em seguida, temos ACOS(), ASIN() e ATAN() referentes ao cosseno, ao seno e à tangente
Função  AVG(), que traz a média dos números.
Funções de arredondamento, como CEILING(), FLOOR() e ROUND()
Função SQRT(), que retorna a raiz quadrada de um valor.
Função CEILING() (em português, "teto") arredondará "para cima", ou seja, para o próximo número inteiro, independentemente dos valores nas casas decimais.
Função ROUND() arredondará "para cima" somente se a primeira casa decimal for 5 ou maior:
Função FLOOR() (em português, "chão"), o valor será sempre arredondado "para baixo"
Função RAND(), que nos entrega um número aleatório */

SELECT * FROM notas_fiscais;

SELECT * FROM itens_notas_fiscais;

/*Na tabela de notas fiscais temos o valor do imposto. Já na tabela de
 itens temos a quantidade e o faturamento. Calcule o valor do imposto 
 pago no ano de 2016 arredondando para o menor inteiro.*/
SELECT YEAR(DATA_VENDA), FLOOR(SUM(IMPOSTO * (QUANTIDADE * PRECO))) 
FROM notas_fiscais AS NF
INNER JOIN itens_notas_fiscais AS INF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY YEAR(DATA_VENDA);

/*Retorna a data e a hora atuais*/
SELECT CURRENT_TIMESTAMP() AS RESULTADO;

/*Essa consulta vai retornar o texto e e a data e a horas atuais*/
SELECT CONCAT('O dia de hoje é : ',CURRENT_TIMESTAMP()) AS RESULTADO;

/*Essa consulta vai retornar o texto e o ano atual*/
SELECT CONCAT('O ano atual é : ',
DATE_FORMAT(CURRENT_TIMESTAMP(),'%Y')) AS RESULTADO;/*O DATE_FORMAT utilizando o "%Y" permite pegar os 4 digitos do ano atual*/

/*Essa consulta vai retornar o texto e o ano atual*/
SELECT CONCAT('O ano atual é : ',
DATE_FORMAT(CURRENT_TIMESTAMP(),'%y')) AS RESULTADO;/*O DATE_FORMAT utilizando o "%y" permite pegar os 2 digitos do ano atual*/

/*Essa consulta vai retornar o texto e o ano atual*/
SELECT CONCAT('O mês e o ano atual é : ',
DATE_FORMAT(CURRENT_TIMESTAMP(),'%m/%y')) AS RESULTADO;/*O DATE_FORMAT utilizando o "%y" permite pegar os 2 digitos do ano atual e o "%m" permite mostrar o mês com dois digitos*/

/*Essa consulta vai retornar o texto e o ano atual*/
SELECT CONCAT('O mês e o ano atual é : ',
DATE_FORMAT(CURRENT_TIMESTAMP(),'%c/%y')) AS RESULTADO;/*O DATE_FORMAT utilizando o "%y" permite pegar os 2 digitos do ano atual e o "%c" permite mostrar o mês com um digito somente*/

/*Essa consulta vai retornar o texto e o ano atual*/
SELECT CONCAT('O mês e o ano atual é : ',
DATE_FORMAT(CURRENT_TIMESTAMP(),'%W, %d/%c/%y')) AS RESULTADO;/*O DATE_FORMAT utilizando o "%y" permite pegar os 2 digitos do ano atual e o "%c" permite mostrar o mês com um digito somente e o %d permite mostrar o dia com dois digitos*/
/*O %W permite eu mostrar o dia da semana Ex: Terça-feira, Quarta-feira*/

/*Essa consulta vai retornar o texto e o ano atual*/
SELECT CONCAT('O mês e o ano atual é : ',
DATE_FORMAT(CURRENT_TIMESTAMP(),'%W, %d/%c/%y')) AS RESULTADO;/*O DATE_FORMAT utilizando o "%y" permite pegar os 2 digitos do ano atual e o "%c" permite mostrar o mês com um digito somente e o %d permite mostrar o dia com dois digitos*/
/*O %W permite eu mostrar o dia da semana Ex: Terça-feira, Quarta-feira*/

/*Nesse caso a função "Convert" permite converter o numero decimal 23.3 para o tipo char, ou seja, uma string*/
SELECT CONVERT(23.3, CHAR) AS RESULTADO;

/*Nesse caso a função "Convert" permite converter o numero decimal 23.3 para o tipo char, ou seja, uma string
O SUBSTRING e uma função que só admite textos 
O retorno dessa consulta será 2, o que quer dizer que a função SUBSTRING() identificou "23.3" como um texto e fez a extração da substring (um caractere a partir do primeiro)*/
SELECT SUBSTRING(CONVERT(23.3, CHAR),1,1) AS RESULTADO;

/*Queremos construir um SQL cujo resultado seja, para cada cliente:
“O cliente João da Silva faturou 120000 no ano de 2016”.
Somente para o ano de 2016.*/
SELECT CONCAT('O cliente ', TC.NOME, ' faturou ', 
CAST(SUM(INF.QUANTIDADE * INF.preco) AS char (20))
 , ' no ano ', CAST(YEAR(NF.DATA_VENDA) AS char (20))) AS SENTENCA FROM notas_fiscais NF
INNER JOIN itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO
INNER JOIN tabela_de_clientes TC ON NF.CPF = TC.CPF
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY TC.NOME, YEAR(DATA_VENDA);

/*Outra Forma de fazer a mesma coisa*/
SELECT CONCAT('O cliente: ',NOME,' faturou R$',ROUND(SUM(PRECO*QUANTIDADE),2),' no ano de 2016') RESULTADO FROM tabela_de_clientes INNER JOIN notas_fiscais ON tabela_de_clientes.cpf = notas_fiscais.cpf 
INNER JOIN itens_notas_fiscais ON notas_fiscais.numero = itens_notas_fiscais.numero 
WHERE YEAR(DATA_VENDA) = 2016 GROUP BY NOME;