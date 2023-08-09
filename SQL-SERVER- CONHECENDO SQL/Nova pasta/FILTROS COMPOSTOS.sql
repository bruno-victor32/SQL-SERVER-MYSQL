
/*Os "Filtros compostos" acontecem quando reunimos mais de uma condi��o no mesmo filtro, 
Por exemplo:
visualizar todas as pessoas que nasceram no ano de 1995 e moram no Rio de Janeiro.
Neste caso, vamos juntar condi��es e usar dois s�mbolos l�gicos: AND (E) e OR (OU).

As express�es com "AND" s� ser�o verdadeiras quando as duas condi��es s�o verdadeiras.

VERDADEIRO AND VERDADEIRO --> VERDADEIRA
FALSO      AND VERDADEIRO --> FALSA
VERDADEIRO AND FALSO --> FALSA 
FALSO      AND FALSO --> FALSA 

O "OR" � um pouco diferente: se uma das condi��es for verdadeira, a express�o � verdadeira.

VERDADEIRO OR VERDADEIRO --> VERDADEIRA
FALSO      OR VERDADEIRO --> VERDADEIRA
VERDADEIRO OR FALSO --> VERDADEIRA 
FALSO      OR FALSO --> FALSA 
*/

/*Realizar uma consulta para visualizar todos os campos da tabela de clientes referentes �s pessoas que nasceram no dia 12.*/
SELECT * FROM [TABELA DE CLIENTES] WHERE DAY ([DATA DE NASCIMENTO]) = 12

/*Realizar uma consulta para visualizar  todas as pessoas que nasceram no dia 12 "e"/AND moram no bairro da Tijuca.*/
SELECT * FROM [TABELA DE CLIENTES] WHERE DAY ([DATA DE NASCIMENTO]) =12 AND [BAIRRO] = 'Tijuca';

/*Realizar uma consulta para visualizar  todas as pessoas que moram no bairro da Tijuca "ou"/OR no bairro dos Jardins.*/
SELECT * FROM [TABELA DE CLIENTES] WHERE [BAIRRO] = 'Jardins' OR [BAIRRO] = 'Tijuca';
