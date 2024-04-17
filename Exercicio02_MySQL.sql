CREATE DATABASE Financeiro;

USE Financeiro; 

CREATE TABLE duplicata (
NOME CHAR(40),
NUMERO INT NOT NULL, 
VALOR DECIMAL (10,2),
VENCIMENTO DATE,
BANCO CHAR,
PRIMARY KEY (NUMERO)
);

SELECT * FROM duplicata;

USE financeiro;

ALTER TABLE duplicata MODIFY BANCO varchar(20);

INSERT INTO duplicata (NOME,NUMERO,VALOR,VENCIMENTO,BANCO)
VALUES ('ABC PAPELARIA',100100,5000.00,'2017-01-20','Itau');

INSERT INTO duplicata (NOME,NUMERO,VALOR,VENCIMENTO,BANCO)
VALUES ('LIVRARIA FERNANDES',100110,2500.00,'2017-01-22','Itau');

INSERT INTO duplicata (NOME,NUMERO,VALOR,VENCIMENTO,BANCO)
VALUES ('LIVRARIA FERNANDES',100120,1500.00,'2016-10-15','Bradesco');

INSERT INTO duplicata (NOME,NUMERO,VALOR,VENCIMENTO,BANCO)
VALUES ('ABC PAPELARIA',100130,8000.00,'2016-10-15','Santander');

INSERT INTO duplicata (NOME,NUMERO,VALOR,VENCIMENTO,BANCO)
VALUES ('LER E SABER',200120,10500.00,'2018-04-26','Banco do Brasil');

INSERT INTO duplicata (NOME,NUMERO,VALOR,VENCIMENTO,BANCO)
VALUES ('LIVORS E CIA',200125,2000.00,'2018-04-26','Banco do Brasil');

INSERT INTO duplicata (NOME,NUMERO,VALOR,VENCIMENTO,BANCO)
VALUES ('LER E SABER',200130,11000.00,'2018-09-26','Itau');

INSERT INTO duplicata (NOME,NUMERO,VALOR,VENCIMENTO,BANCO)
VALUES ('PAPELARIA SILVA',250350,1500.00,'2018-01-26','Bradesco');

INSERT INTO duplicata (NOME,NUMERO,VALOR,VENCIMENTO,BANCO)
VALUES ('LIVROS MM',250360,500.00,'2018-12-18','Santander');

INSERT INTO duplicata (NOME,NUMERO,VALOR,VENCIMENTO,BANCO)
VALUES ('LIVROS MM',250370,3400.00,'2018-04-26','Santander');

INSERT INTO duplicata (NOME,NUMERO,VALOR,VENCIMENTO,BANCO)
VALUES ('PAPELARIA SILVA',250380,3500.00,'2018-04-26','Banco do Brasil');

INSERT INTO duplicata (NOME,NUMERO,VALOR,VENCIMENTO,BANCO)
VALUES ('LIVORS E CIA',453360,1500.00,'2018-06-15','Itau');

INSERT INTO duplicata (NOME,NUMERO,VALOR,VENCIMENTO,BANCO)
VALUES ('LIVROS MM',453365,5400.00,'2018-06-15','Bradesco');

INSERT INTO duplicata (NOME,NUMERO,VALOR,VENCIMENTO,BANCO)
VALUES ('PAPELARIA SILVA',453370,2350.00,'2017-12-27','Itau');

INSERT INTO duplicata (NOME,NUMERO,VALOR,VENCIMENTO,BANCO)
VALUES ('LIVORS E CIA',453380,1550.00,'2017-12-27','Banco do Brasil');

INSERT INTO duplicata (NOME,NUMERO,VALOR,VENCIMENTO,BANCO)
VALUES ('ABC PAPELARIA',980130,4000.00,'2016-12-11','Itau');

INSERT INTO duplicata (NOME,NUMERO,VALOR,VENCIMENTO,BANCO)
VALUES ('LIVRARIA FERNANDES',770710,2500.00,'2016-11-15','Santander');

INSERT INTO duplicata (NOME,NUMERO,VALOR,VENCIMENTO,BANCO)
VALUES ('ABC PAPELARIA',985001,3000.00,'2016-09-11','Itau');

INSERT INTO duplicata (NOME,NUMERO,VALOR,VENCIMENTO,BANCO)
VALUES ('PAPEL E AFINS',985002,2500.00,'2016-03-12','Santander');

INSERT INTO duplicata (NOME,NUMERO,VALOR,VENCIMENTO,BANCO)
VALUES ('LER E SABER',888132,2500.00,'2017-03-05','Itau');

SELECT * FROM duplicata;

UPDATE duplicata SET NOME = 'LIVROS E CIA' WHERE NOME = 'LIVORS E CIA';

#1. Listar nome vencimento e valor de cada duplicata da tabela.

SELECT NOME, VENCIMENTO, VALOR FROM duplicata;

#2. Apresentar o número das duplicatas depositadas no banco Itaú

SELECT NUMERO, BANCO FROM duplicata WHERE BANCO = 'Itau';

#3. Apresentar o número de duplicatas depositadas no banco Itaú

SELECT BANCO, COUNT(*) AS TOTAL FROM duplicata WHERE BANCO = 'Itau' GROUP BY BANCO ;

#4. Quais são as duplicatas (número, vencimento, valor e nome) que vencem no ano de 2017.

SELECT NUMERO, VENCIMENTO, VALOR, NOME FROM duplicata WHERE YEAR(VENCIMENTO) = '2017';

#5. Apresentar as duplicatas (número, vencimento, valor e nome) que não estão depositadas nos bancos Itaú e
#Santander.

SELECT NUMERO, VENCIMENTO, VALOR, NOME FROM duplicata WHERE BANCO = 'Santander' OR BANCO = 'Itau';

#6. Quanto é o valor da divida o cliente PAPELARIA SILVA, e quais são as duplicatas?

SELECT * FROM duplicata WHERE NOME = 'PAPELARIA SILVA';

SELECT NOME, SUM(VALOR) AS DIVIDA_TOTAL FROM duplicata WHERE NOME = 'PAPELARIA SILVA' GROUP BY NOME;

#7. Retirar da tabela a duplicata 770710 do cliente LIVRARIA FERNANDES, por ter sido devidamente quitada.

DELETE FROM duplicata WHERE NUMERO = 770710;

#8. Apresentar uma listagem em ordem alfabética por nome do cliente de todos os campos da tabela.

SELECT * FROM duplicata ORDER BY NOME ASC;

#9. Apresentar uma listagem em ordem de data de vencimento com o nome do cliente, banco, valor e vencimento.

SELECT NOME, BANCO, VALOR, VENCIMENTO FROM duplicata ORDER BY VENCIMENTO ASC;

#10. As duplicatas do Banco do Brasil foram transferidas para o Santander. Proceder o ajuste dos registros.

UPDATE duplicata SET BANCO = 'Santander' WHERE BANCO = 'Banco do Brasil';

#11. Quais são os clientes que possuem suas duplicatas depositadas no Banco Bradesco?

SELECT * FROM duplicata WHERE BANCO = 'Bradesco';

#12. Qual é a previsão de recebimento no período de 01/01/2016 até 31/12/2016?

SELECT SUM(VALOR) AS VALOR_RECEBER FROM duplicata WHERE DATE(VENCIMENTO) BETWEEN '2016-01-01' AND '2016-12-31';

#13., Quanto a empresa tem para receber no período de 01/08/2016 até 30/08/2016?
#Quais foram os itens adquiridos pelo cliente ABC PAPELARIA?

SELECT SUM(VALOR) AS VALOR_RECEBER FROM duplicata WHERE DATE(VENCIMENTO) BETWEEN '2016-08-01' AND '2016-08-30';

#17. Qual é a média aritmética dos valores das duplicatas do ano de 2016?

SELECT * FROM duplicata WHERE YEAR(VENCIMENTO) = '2016';

SELECT SUM(VALOR) AS SOMA_TOTAL FROM duplicata WHERE YEAR(VENCIMENTO) = '2016';

SELECT * FROM duplicata WHERE YEAR(VENCIMENTO) = '2016';

SELECT AVG(VALOR) AS VALOR_MEDIO FROM duplicata WHERE YEAR(VENCIMENTO) = '2016';

#18. Exiba as duplicatas e nome dos respectivos clientes que possuem duplicatas com valor superior a 10000,00?

SELECT NOME, NUMERO, VALOR FROM duplicata WHERE VALOR > 10000;

#19. Qual o valor total das duplicatas lançadas para o banco Santander?

SELECT BANCO, SUM(VALOR) AS VALOT_TOTAL FROM duplicata WHERE BANCO = 'Santander' GROUP BY BANCO;

#20. Quais são os clientes que possuem suas duplicatas depositadas nos Bancos Bradesco ou Ttaú?

SELECT NOME, BANCO FROM duplicata WHERE BANCO = 'Bradesco' OR BANCO = 'Itau';


