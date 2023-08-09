
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