-- a22407644; Diogo Nunes
-- INF02 ; 9:30

/*
 * 2,41
 */
 

USE BikeStores
GO

--1. Identificação e metadados
--Identifica todas as tabelas da base de dados/schema
--Escolhe duas tabelas que consideres fundamentais para base de dados:

--Para cada uma das tabelas, lista os campos, tipos de dados, incluindo tamanhos, e nulidade.
--Consegues identificar se estas tabelas têm dependências entre si? justifica

SELECT * From sys.databases

SELECT
    TABLE_SCHEMA,
    TABLE_NAME,
    TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES
ORDER BY TABLE_SCHEMA, TABLE_NAME;

SELECT * FROM sales.customers


--2. Consultas e operações básicas

--Escolhe uma tabela com um campo numérico ou de data. 
--Apresenta apenas os registos cujos valores nesse campo estejam fora de um intervalo definido por ti. 
--Inclui no resultado o campo utilizado na condição e pelo menos dois outros campos.

SELECT * FROM sales.orders

SELECT * FROM sales.orders
WHERE NOT(staff_id <= 4 AND staff_id >= 2)


--3. Operações de linha

--Escolhe dois campos de texto da mesma tabela,onde um deles possa conter valores nulos, 
--e apresenta um novo valor composto por parte do conteúdo de um dos campos e pelo conteúdo completo do outro. 
--Converte o resultado final para minúsculas e mantém no resultado os campos originais.
--Ordena o resultado pela coluna apresentada com o conteúdo completo.
--O resultado não pode apresentar valores nulos




--4. Consultas formatadas

--Escolhe uma tabela com um campo númerido utilizado como identificador e um campo de texto utilizado como classificador.

--Constrói uma consulta de apresentação final com pelo menos quatro colunas. 
--Deve incluir uma concatenação de texto, uma conversão explícita de tipo, 
--a substituição de um possível valor nulo e a formatação de um campo numérico ou de data.
--Mantém pelo menos um dos valores originais junto do respetivo valor transformado.

SELECT * FROM sales.customers

UPDATE sales.customers
SET phone = 0
WHERE phone = NULL