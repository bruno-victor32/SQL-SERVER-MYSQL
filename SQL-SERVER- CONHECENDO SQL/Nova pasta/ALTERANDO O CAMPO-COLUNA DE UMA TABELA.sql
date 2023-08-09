/*ALTER TABLE e o comando utilizado para alterar uma tabela ou para alterar um campo da tabela

ALTER TABLE [TABELA DE PRODUTOS] 

*/


/*PoderiamosPoderíamos usar ADD se quiséssemos, por exemplo, adicionar uma nova coluna.

ALTER TABLE [TABELA DE PRODUTOS] ADD COLUMN

Porém, a coluna CODIGO_DO_PRODUTO já existe. Sendo assim, não usaremos ADD, mas ALTER, de "alterar".
*/


/*Descrição do comando abaixo:
Alterar a coluna "tabela de produtos" modificando a coluna/campo "codigo do produto"
 para o tipo "varchar(20)" e que não aceite valores nulos*/
ALTER TABLE TABELA_DE_PRODUTOS ALTER COLUMN CODIGO_DO_PRODUTO VARCHAR(20) NOT NULL;