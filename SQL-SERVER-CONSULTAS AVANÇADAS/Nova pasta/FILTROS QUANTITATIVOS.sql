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