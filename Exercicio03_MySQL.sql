#1. Quais campos das tabelas associado e plano devem ser utilizados para efetuar o relacionamento entre as tabelas?

SELECT * FROM associado;

"plano" da tabela associado e "numero" da tabela plano.

#2. Extrair uma relação geral de todos os associados e os planos que eles possuem.

SELECT * FROM associado A INNER JOIN plano B ON B.Numero = A.Plano;

#3. Quantos associados possuem o plano B1?

SELECT PLANO, COUNT(*) AS TOTAL_B1 FROM associado WHERE Plano = "B1" GROUP BY PLANO; 

#4. Apresente uma relação com todos os nomes, planos e valores de todos os registros de associados.

SELECT NOME, PLANO, CONCAT('R$', FORMAT(VALOR, 2, 'de_DE')) AS PRECO FROM associado A INNER JOIN plano B ON B.Numero = A.Plano;

#5. Quais são os associados que moram em COTIA ou em DIADEMA?

SELECT * FROM associado WHERE CIDADE = 'COTIA' OR CIDADE = 'DIADEMA';

#6. Apresente o nome, plano e valor dos associados que moram em BARUERI é possuem o plano M1.

SELECT NOME, PLANO, CONCAT('R$ ', FORMAT(VALOR, 2, 'de_DE')) 
AS VALOR FROM associado A INNER JOIN plano B ON B.Numero = A.Plano
WHERE CIDADE = 'BARUERI' AND PLANO = 'M1';

#7. Apresente uma relação com nome, plano e valor de todos os associados residentes em SÃO PAULO

SELECT NOME, PLANO, CONCAT('R$ ',FORMAT(VALOR, 2, 'de_DE')) 
AS VALOR FROM associado A INNER JOIN plano B ON A.Plano = B.Numero
WHERE CIDADE = 'SAO PAULO';

#8. Apresente uma relação completa de todos os campos de ambas as tabelas em que o associado possua SILVA no nome.

SELECT * FROM associado A INNER JOIN plano B ON A.Plano = B.Numero WHERE NOME LIKE '%SILVA%';

#9. Devido ao aumento do índice IGPM, a empresa reajustou os valores dos planos básicos em 10%, dos planos
# executivos em 5% e dos planos Máster em 3 %. Atualize os valores na tabela planos.

SELECT * FROM plano;

UPDATE plano SET VALOR = VALOR * 1.1 WHERE DESCRICAO LIKE '%BASICO%';
UPDATE plano SET VALOR = VALOR * 1.05 WHERE DESCRICAO LIKE '%EXECUTIVO%';
UPDATE plano SET VALOR = VALOR * 1.03 WHERE DESCRICAO LIKE '%MASTER%';

SELECT * FROM plano;

#10. O associado PEDRO JOSE DE OLIVEIRA alterou seu plano de B1 para E3. Faça a devida atualização.

SELECT * FROM associado ORDER BY NOME;

UPDATE associado SET Plano = 'E3' WHERE NOME = 'PEDRO JOSE DE OLIVEIRA';

#11. Quantos associados possuem o plano E3?

SELECT PLANO, COUNT(*) AS E3_TOTAL FROM associado WHERE Plano = 'E3' GROUP BY PLANO;

#12 Liste o nome e o valor de todos os associados que possuem os planos B1, El e MI.

SELECT NOME, VALOR FROM associado A INNER JOIN plano B 
ON A.Plano = B.Numero WHERE PLANO IN('M1', 'B1', 'E1') ORDER BY PLANO; 

#13. Quais são os associados que possuem plano do tipo EXECUTIVO, independentemente da categoria ser 1,2 ou 3?

SELECT * FROM associado A INNER JOIN plano B 
ON A.Plano = B.Numero WHERE DESCRICAO LIKE '%EXECUTIVO%';

#14. Quais são os associados que possuem plano dos tipos Básico e Máster?

SELECT * FROM associado A INNER JOIN plano B 
ON A.Plano = B.Numero WHERE DESCRICAO LIKE '%MASTER%' OR DESCRICAO LIKE '%BASICO%';

#15. A empresa fechou seu escritório na cidade de SANTO ANDRE e transferiu os cliente para um terceirizado. Remova
#da tabela associados todos os registros existentes de associados da cidade de SANTO ANDRE

DELETE  FROM associado WHERE CIDADE = 'SANTO ANDRE';

#16. Apresente o nome, plano e valor dos associados que moram em SÃO PAULO e possuem os planos M2 e M3: À
# listagem deve estar ordenada pelo campo nome

SELECT NOME, PLANO, VALOR FROM associado A INNER JOIN plano B ON A.Plano = B.Numero
WHERE CIDADE = 'SAO PAULO' AND PLANO IN('M2','M3') ORDER BY NOME;

#17. Apresente uma listagem completa de todos os campos de ambas as tabelas ordenados por tipo de plano.

SELECT * FROM associado A INNER JOIN plano B ON A.Plano = B.Numero ORDER BY PLANO;

#18. Faça uma relação geral de todos os associados e planos que eles possuem. A relação deve ser apresentada em ordem
#ascendente pelo campo tipo de plano e descendente pelo campo de identificação do nome do associado.

SELECT NOME, PLANO FROM associado A INNER JOIN plano B ON A.Plano = B.Numero ORDER BY PLANO ASC, NOME DESC;

#19. Apresentar uma relação de todos os associados que não possuem o plano Máster.

SELECT * FROM associado A INNER JOIN plano B ON A.Plano = B.Numero WHERE DESCRICAO NOT LIKE('%MASTER%');

#20. Apresentar uma listagem em ordem crescente pelo campo nome do associado. Essa listagem deve ser formada pelos
#campos Nome da tabela associado e Descrição da tabela Planos

SELECT NOME, DESCRICAO FROM associado A INNER JOIN plano B ON A.Plano = B.Numero ORDER BY NOME;

#21 Apresentar uma listagem dos planos que estão situados na faixa de valores de 300 até 500;

SELECT * FROM plano WHERE VALOR BETWEEN 300 AND 500;

#22. Apresentar uma relação contendo: nome;plano, descrição do plano e valor de todos os associados que tenham em
#seu nome, seja na posição que for, a sequência AMARAL.

SELECT NOME, PLANO, DESCRICAO, VALOR FROM associado A INNER JOIN plano B ON A.Plano = B.Numero WHERE NOME LIKE '%AMARAL%';

#23. Quais associados residem na cidade de DIADEMA?

SELECT * FROM associado WHERE CIDADE = 'DIADEMA';

#24. O plano do tipo MASTER teve um reajuste de 6%. Atualize na tabela planos os valores das categorias 1,2 e 3.

SELECT * FROM plano;

UPDATE plano SET valor = valor * 1.06 WHERE DESCRICAO LIKE '%MASTER%';

#25. Quais são os clientes cujo CEP é iniciado com os valores 09?

SELECT * FROM associado WHERE CEP LIKE '09%';



