
/*Os "Filtros compostos" acontecem quando reunimos mais de uma condição no mesmo filtro, 
Por exemplo:
visualizar todas as pessoas que nasceram no ano de 1995 e moram no Rio de Janeiro.
Neste caso, vamos juntar condições e usar dois símbolos lógicos: AND (E) e OR (OU).

As expressões com "AND" só serão verdadeiras quando as duas condições são verdadeiras.

VERDADEIRO AND VERDADEIRO --> VERDADEIRA
FALSO      AND VERDADEIRO --> FALSA
VERDADEIRO AND FALSO --> FALSA 
FALSO      AND FALSO --> FALSA 

O "OR" é um pouco diferente: se uma das condições for verdadeira, a expressão é verdadeira.

VERDADEIRO OR VERDADEIRO --> VERDADEIRA
FALSO      OR VERDADEIRO --> VERDADEIRA
VERDADEIRO OR FALSO --> VERDADEIRA 
FALSO      OR FALSO --> FALSA 
*/

/*Realizar uma consulta para visualizar todos os campos da tabela de clientes referentes às pessoas que nasceram no dia 12.*/
SELECT * FROM [TABELA DE CLIENTES] WHERE DAY ([DATA DE NASCIMENTO]) = 12

/*Realizar uma consulta para visualizar  todas as pessoas que nasceram no dia 12 "e"/AND moram no bairro da Tijuca.*/
SELECT * FROM [TABELA DE CLIENTES] WHERE DAY ([DATA DE NASCIMENTO]) =12 AND [BAIRRO] = 'Tijuca';

/*Realizar uma consulta para visualizar  todas as pessoas que moram no bairro da Tijuca "ou"/OR no bairro dos Jardins.*/
SELECT * FROM [TABELA DE CLIENTES] WHERE [BAIRRO] = 'Jardins' OR [BAIRRO] = 'Tijuca';
