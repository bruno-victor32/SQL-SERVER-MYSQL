/*Observações
"VOLUME_DE_COMPRA" que corresponde ao volume máximo de suco que cada cliente pode comprar em um mês.
Primeiro passo será descobrir o volume total de vendas para cada cliente dentro de um mês
*/

USE sucos_vendas;

/*quantidade das vendas consta na tabela de itens das notas fiscais.*/
SELECT * FROM itens_notas_fiscais; /*O campo "quantidades" está nessa tabela*/

/* os dados sobre o cliente (CPF) e a data da venda */
SELECT * FROM notas_fiscais; /*Clientes que e o campo "cpf" está na tabela de notas fiscais*/

/*Como usamos o * (asteriscos), o retorno mostrará todas as colunas de ambas as tabelas*/
SELECT * FROM notas_fiscais AS NF /*A tabela "notas_fiscais" terá um apelido de "NF"*/ 
INNER JOIN itens_notas_fiscais AS INF /*A tabela "itens_notas_fiscais" terá um apelido de "INF"*/ 
ON NF.NUMERO = INF.NUMERO;

/*Agora selecionamos somente as colunas interessantes para o nosso relatorio*/
SELECT NF.CPF, NF.DATA_VENDA, INF.QUANTIDADE FROM notas_fiscais AS NF /*Quero que mostre na tela os campos "cpf e data_venda" da tabela notas_fiscais e o campo "Quantidade" da tabela itens_notas_fiscais*/
INNER JOIN itens_notas_fiscais AS INF
ON NF.NUMERO = INF.NUMERO;

/*Utilizando o DATE_FORMAT() e especificando %Y e %m para exibir somente o ano e o mês de cada venda, estamos tirando o dia para ser possível agrupar. */
SELECT NF.CPF, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MES_ANO,  /*Tive que renomear o campo "DATA_VENDA" para "MES_ANO"*/
INF.QUANTIDADE FROM notas_fiscais AS NF 
INNER JOIN itens_notas_fiscais AS INF
ON NF.NUMERO = INF.NUMERO;

/*CONSULTA COM VENDAS DE CLIENTES POR MÊS*/
/*Aqui iremos agrupar utilizando o "GROUP BY" devido ter um mesmo cliente que compra no mesmo mês determinados produtos
Aqui estamos agrupando para não aparecer cpf iguais de compra no mesmo mês, ou seja, estamos agrupando por data e CPF*/
SELECT NF.CPF, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MES_ANO, /*Nessa parte do código "DATE_FORMAT(NF.DATA_VENDA, '%Y-%m')" estou convertendo a data  para "mes" e "ano"*/
SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS FROM notas_fiscais AS NF 
INNER JOIN itens_notas_fiscais AS INF
ON NF.NUMERO  = INF.NUMERO /*Numero de notas fiscais*/
GROUP BY NF.CPF, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m');/*Coloco os campos que n são agrupados*/


/*LIMITE DE COMPRA POR CLIENTE*/
SELECT * FROM tabela_de_clientes;

SELECT TC.CPF, TC.NOME, TC.VOLUME_DE_COMPRA AS QUANTIDADE_LIMITE
FROM tabela_de_clientes AS TC;

SELECT NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MES_ANO, /*Nessa parte do código "DATE_FORMAT(NF.DATA_VENDA, '%Y-%m')" estou convertendo a data  para "mes" e "ano"*/
SUM(INF.QUANTIDADE) AS QUANTIDADE_VENDAS,
SUM(TC.VOLUME_DE_COMPRA) AS QUANTIDADE_LIMITE FROM notas_fiscais AS NF /*Quero que mostre na tela os campos "cpf e data_venda" da tabela notas_fiscais e o campo "Quantidade" da tabela itens_notas_fiscais*/
INNER JOIN itens_notas_fiscais AS INF
ON NF.NUMERO = INF.NUMERO
INNER JOIN tabela_de_clientes AS TC
ON TC.CPF = NF.CPF
GROUP BY NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m');/*Coloco os campos que n são agrupados*/