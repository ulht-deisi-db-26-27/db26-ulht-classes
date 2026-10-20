-- TURMA DE SEGUNDA 13:30 REALIZACAO DO TESTE SEXTA FEIRA 9:30

/*
 * Sem identifiação
 * 10,15
 */

--1
SELECT * FROM INFORMATION_SCHEMA.TABLES 

SELECT * FROM production.products
SELECT * FROM sales.order_items
-- escolhi estas duas tabelas achas que elas sao muito importantes e elas tem um FK que é product_id

--## 2
SELECT product_name,category_id,list_price FROM production.products WHERE list_price NOT BETWEEN 10.00 AND 400.00;

--## 3
SELECT first_name,last_name,LOWER(CONCAT(LEFT(first_name, 3), last_name)) FROM sales.customers WHERE last_name IS NOT NULL
ORDER BY first_name ASC;

--## 4

--## 5

--6
UPDATE sales.customers SET city = UPPER(city) WHERE state IN ('TX', 'CA');


--7
UPDATE sales.customers SET phone = CONCAT('+1-555-', customer_id) WHERE phone IS NULL AND customer_id IS NOT NULL;