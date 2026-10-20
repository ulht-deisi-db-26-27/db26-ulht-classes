--Número de aluno: a22407398
--Nome de aluno:Beatriz Carboila
--Turma: 3
--Horário de realização do teste: Sexta-feira: 9:30h

/*
 * 2,81 
 */

USE BikeStores
GO

--1.Identifica todas as tabelas da base de dados/schema
SELECT TABLE_SCHEMA, TABLE_NAME, TABLE_TYPE 
FROM INFORMATION_SCHEMA.TABLES;



--lista os campos, tipos de dados, incluindo tamanhos, e nulidade.
SELECT customer_id, first_name, last_name, phone, email, street,city, [state],zip_code
FROM sales.customers;

SELECT order_id, customer_id, order_status,  order_date, required_date, shipped_date, store_id
FROM sales.orders;

--Consegues identificar se estas tabelas têm dependências entre si? justifica
--Sim, pois ambas utilizam customer_id.

--2.Consultas e operações básicas
--Escolhe uma tabela com um campo numérico
--Registos cujos valores estejam fora de um intervalo definido por ti
SELECT order_id, customer_id
FROM sales.orders;
WHERE customer_id BETWEEN 1 AND 50;
SELECT customer_id FROM sales.orders WHERE costumer_id = 55;
UPDATE sales.customers

--3. Operações de linha
--Dois campos de texto da mesma tabela
--Um deles possa conter valores nulos
--Apresenta um novo valor composto por parte do conteúdo de um dos campos e pelo conteúdo completo do outro.
--Converte o resultado final para minúsculas e mantém no resultado os campos originais
SELECT category_id 
FROM production.categories 
WHERE category_id = 99;
INSERT INTO production.categories (category_id, category_name) VALUES (99, 'Acessórios Teste');
SELECT category_id, category_name FROM production.categories WHERE category_id = 99;
SET category_id = LOWER(category_id)
UPDATE production.categories