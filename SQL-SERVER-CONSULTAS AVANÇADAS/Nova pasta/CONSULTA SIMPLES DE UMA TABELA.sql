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
