USE SUCOS_VENDAS;

/*Podemos ter dois produtos com o mesmo nome, embalagem, tamanho, sabor e at� com o mesmo pre�o,
mas o c�digo tem que ser diferente. Precisamos dizer para o banco de dados que o campo "CODIGO DO PRODUTO"
agora ser� uma Primary key. Para isso, � necess�rio alterar a estrutura da tabela de produtos: ALTER TABLE 
TABELA_DE_PRODUTOS.*/

/*Nossa inten��o � adicionar uma chave prim�ria � tabela existente.

Restri��o(constraints)

Podemos ter uma chave prim�ria com mais de um campo, mas cada tabela pode ter apenas uma chave prim�ria.

Para adicionar uma chave primaria faremos "PRIMARY KEY CLUSTERED" entre par�nteses, o(s) campo(s) que ser� chave primaria */

ALTER TABLE TABELA_DE_PRODUTOS
ADD CONSTRAINT PK_TABELA_DE_PRODUTOS
PRIMARY KEY CLUSTERED (CODIGO_DO_PRODUTO);

/*Explicando o comando acima:
Alterando  "ALTER TABLE" a tabela "TABELA_DE_PRODUTOS"
adicionando uma chave primaria chamada de "PK_TABELA_DE_PRODUTOS"
no campo "CODIGO_DO_PRODUTO"*/

