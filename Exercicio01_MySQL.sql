#1. Criar um banco de dados chamado "vendas"

CREATE DATABASE vendas;

#2. Criar a tabela Produto

CREATE TABLE Produto (
Código_Produto INT,
Descricao_Produto VARCHAR(30),
Preco_Prodtuo FLOAT
);

#3. Criar a tabela Nota fiscal

CREATE TABLE Nota_fiscal (
Numero_NF INT,
Data_NF DATE,
Valor_NF Float
);

#4. Criar a tabela Itens
CREATE TABLE Itens (
Produto_Codigo_Produto INT,
Nota_fiscal_Numero INT,
Num_Item INT,
Qtd_Item INT
);

#5. Alterar o campo Descricao Produto da tabela Produto para o tipo Varchar(50)

ALTER TABLE Produto MODIFY Descricao_Produto VARCHAR(50);

#6. Alterar a tabela Nota Fiscal, adicionando o campo ICMS, do tipo float depois do campo Numero NF.

ALTER TABLE nota_fiscal ADD COLUMN ICMS FLOAT AFTER Numero_NF;

#7. Alterar a tabela Produto, adicionando o campo Peso, do tipo float

ALTER TABLE produto ADD COLUMN PESO FLOAT;

#7.1 Renomeie o nome do campo criado.

ALTER TABLE produto CHANGE PESO Peso FLOAT;

SELECT * FROM produto;

#8. Fazer com que a chave primária da tabela Itens deixe de ser composta por codigo do produto mais numero
#da nota fiscal e passe a ser Num item

ALTER TABLE itens ADD PRIMARY KEY (Num_Item);

#9. Apresentar a estrutura da tabela Produto

SELECT * FROM produto;

#10. Apresentar a estrutura da tabela Nota Fiscal

SELECT * FROM nota_fiscal;

#11. Alterar o nome do campo Valor. NF da tabela Nota fiscal para ValorTotal NF.

ALTER TABLE nota_fiscal CHANGE Valor_NF ValorTotal_NF FLOAT;

#12.Remover o campo Data NF da tabela Nota fiscal

ALTER TABLE nota_fiscal DROP COLUMN Data_NF;

#13. Remover a tabela Itens do modelo de dados

DROP TABLE itens;

#14. Alterar o nome da tabela Nota fiscal para Venda.

RENAME TABLE nota_fiscal TO venda;