/* 
Numero de aluno: a22509596
Nome de aluno: Bernardo do Carmo
Turma: D01f01
Horário de realização do teste: Sexta Feira, 9:30min - 11h 30min*/

/*
 * 14,44
 */

Use BikeStores;
-- 1. Identificação e metadados

Select * from production.brands;
Select * from production.categories;
Select * from production.stocks;
Select * from sales.customers;
Select * from sales.orders;
Select * from sales.order_items;
Select * from sales.staffs;
Select * from sales.stores;

--  tabelas que escolhi, production.brands e sales.stocks


-- Não têm ligação entre si, pois não têm chave estrangeira

-- ##2

SELECT p.quantity AS Quantidade, p.product_id, p.store_id 
    FROM production.stocks p WHERE p.quantity < 50 OR p.quantity > 100;

--#3

SELECT p.product_id, p.quantity, 
    COALESCE(p.quantity, 'Sem resultado') AS resultado
FROM 
    production.stocks p
WHERE 
    p.quantity IS NOT NULL; 

--#4

SELECT s.product_id, CONCAT('Ref: ', s.product_id, ' - Item: ', COALESCE(CAST(s.order_id AS VARCHAR(10)), 'Sem ID')) AS produto_detalhado,
    CAST(s.quantity AS VARCHAR(10)) AS quantidade_texto,
    s.list_price AS preco_original,
    FORMAT(s.list_price, 'N2') AS preco_formatado
FROM sales.order_items s;

--#5

INSERT into sales.customers (first_name, last_name, email) VALUES ('Bernardo','Carmo', 'berna@gmail.com');
SELECT * from sales.customers WHERE first_name = 'Bernardo';

--#6
UPDATE sales.customers 
SET first_name = UPPER(first_name) 
WHERE last_name IN ('Carmo', 'Silva');

--#7

UPDATE sales.customers 
SET email = CONCAT('PREF_', last_name) 
WHERE (email IS NULL OR email = '') 
  AND last_name IS NOT NULL 
  AND last_name <> '';

--#9

DELETE FROM sales.customers 
WHERE first_name = 'Bernardo' 
  AND last_name = 'Carmo' 
  AND email = 'berna@gmail.com';
