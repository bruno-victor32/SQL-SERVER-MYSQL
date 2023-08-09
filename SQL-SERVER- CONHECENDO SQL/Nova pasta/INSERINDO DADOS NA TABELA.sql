USE SUCOS_VENDAS;

INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA)
VALUES
('1040107', 'Light - 350 ml - Mel�ncia', 'Lata', '350 ml', 'Mel�ncia', 4.56 );

INSERT INTO TABELA_DE_VENDEDORES (MATRICULA, NOME, PERCENTUAL_COMISSAO)
VALUES
('00235','M�rcio Almeida Silva',0.08);

/*Precisamos lembrar que o campo de comiss�o est� no valor float, portanto, 
� relevante colocarmos 0.08 pois ali representaria a porcentagem (8%). Pensando
em decimal, 1.00 seria 100%, por isso 0.08 � o valor que queremos para a comiss�o.*/


INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA)
VALUES
('1037797', 'Clean - 2 litros - Laranja', 'PET', '2 Litros', 'Laranja', 16.01 );
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA)
VALUES
('1000889', 'Sabor da Montanha - 700 ml - Uva', 'Garrafa', '700 ml', 'Uva', 6.31 );

SELECT*FROM TABELA_DE_PRODUTOS;

/*Quando as ordem dos campos for respeitada, n�o � preciso declar�-los no comando, podendo ficar desta forma:
Isso significa que que cada valor corresponde, respectivamente, a determinado campo da tabela*/
INSERT INTO TABELA_DE_PRODUTOS
VALUES
('1004327','Videira do Cmapo - 1,5 Litros - Mel�ncia','PET','1,5 Litros','Mel�ncia',19.51);

/*Esse INSERT acima e a mesma coisa que esse insert a seguir*/
INSERT INTO TABELA_DE_PRODUTOS (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA)
VALUES
('1004327','Videira do Cmapo - 1,5 Litros - Mel�ncia','PET','1,5 Litros','Mel�ncia',19.51);


/*Esse INSERT abaixo, no campo "PRECO_DE_LISTA" inserimos somente 7 ao inv�s de 7.00, ainda assim
n�o teve problema devido o tipo desse campo ser "smallmoney", ou seja, possui casas decimais.*/
INSERT INTO TABELA_DE_PRODUTOS
   VALUES
   ('1088126','Linha Citros - 1 Litro - Lim�o','PET','1 Litro','Lim�o',7);


 /*Dessa maneira abaixo estamos inserindo duas linhas na tabela ao mesmo tempo*/
 INSERT INTO TABELA_DE_PRODUTOS
   VALUES
   ('1088126','Linha Citros - 1 Litro - Lim�o','PET','1 Litro','Lim�o',7),
    ('544931','Frescor do Ver�o - 350 ml - Lim�o','Lata','350 ml','Lim�o',2.46);


INSERT INTO TABELA_DE_VENDEDORES (MATRICULA, NOME, PERCENTUAL_COMISSAO)
VALUES
('00236', 'Cl�udia Morais', 0.08),
('00237', 'Marcela Ferreira', 0.09);

SELECT * FROM TABELA_DE_VENDEDORES;