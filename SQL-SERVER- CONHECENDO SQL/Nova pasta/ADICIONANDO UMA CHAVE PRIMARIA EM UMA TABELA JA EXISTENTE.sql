USE SUCOS_VENDAS;

/*Podemos ter dois produtos com o mesmo nome, embalagem, tamanho, sabor e até com o mesmo preço,
mas o código tem que ser diferente. Precisamos dizer para o banco de dados que o campo "CODIGO DO PRODUTO"
agora será uma Primary key. Para isso, é necessário alterar a estrutura da tabela de produtos: ALTER TABLE 
TABELA_DE_PRODUTOS.*/

/*Nossa intenção é adicionar uma chave primária à tabela existente.

Restrição(constraints)

Podemos ter uma chave primária com mais de um campo, mas cada tabela pode ter apenas uma chave primária.

Para adicionar uma chave primaria faremos "PRIMARY KEY CLUSTERED" entre parênteses, o(s) campo(s) que será chave primaria */

ALTER TABLE TABELA_DE_PRODUTOS
ADD CONSTRAINT PK_TABELA_DE_PRODUTOS
PRIMARY KEY CLUSTERED (CODIGO_DO_PRODUTO);

/*Explicando o comando acima:
Alterando  "ALTER TABLE" a tabela "TABELA_DE_PRODUTOS"
adicionando uma chave primaria chamada de "PK_TABELA_DE_PRODUTOS"
no campo "CODIGO_DO_PRODUTO"*/

