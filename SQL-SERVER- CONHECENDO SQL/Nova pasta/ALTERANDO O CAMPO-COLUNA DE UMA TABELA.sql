/*ALTER TABLE e o comando utilizado para alterar uma tabela ou para alterar um campo da tabela

ALTER TABLE [TABELA DE PRODUTOS] 

*/


/*PoderiamosPoder�amos usar ADD se quis�ssemos, por exemplo, adicionar uma nova coluna.

ALTER TABLE [TABELA DE PRODUTOS] ADD COLUMN

Por�m, a coluna CODIGO_DO_PRODUTO j� existe. Sendo assim, n�o usaremos ADD, mas ALTER, de "alterar".
*/


/*Descri��o do comando abaixo:
Alterar a coluna "tabela de produtos" modificando a coluna/campo "codigo do produto"
 para o tipo "varchar(20)" e que n�o aceite valores nulos*/
ALTER TABLE TABELA_DE_PRODUTOS ALTER COLUMN CODIGO_DO_PRODUTO VARCHAR(20) NOT NULL;