/* 
a22501165
Hugo Miguel Grilo
Turma noite
19:30
*/

/*
 * 18,06
 */
 
-- 1.Identificação e metadados 
USE BikeStores;
GO

SELECT
    name,
    database_id,
    state_desc,
    recovery_model_desc
FROM sys.databases
ORDER BY name;

SELECT
    TABLE_SCHEMA,
    TABLE_NAME,
    TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES
ORDER BY TABLE_SCHEMA, TABLE_NAME;


SELECT table_name 
FROM information_schema.tables 
WHERE table_schema IN ('sales', 'production', 'dbo');

SELECT column_name, data_type, character_maximum_length, is_nullable 
FROM information_schema.columns 
WHERE table_name IN ('orders');

--  2. Consultas e operações básicas
SELECT product_name, category_id, list_price 
FROM production.products ORDER BY category_id DESC, list_price ASC;

-- 3. Operações de linha

SELECT order_date, 
DATEADD(MONTH, 6, order_date) AS review_date 
FROM sales.orders;

--4.Consultas formatadas

SELECT 
    store_id AS identificador_original,
    CONCAT(RIGHT('00000' + CAST(store_id AS VARCHAR), 5), '-', store_name) AS identificador_composto
FROM sales.stores
ORDER BY identificador_composto ASC;

--5. Inserções e validação

SELECT *
FROM sales.orders;

SELECT * FROM sales.orders WHERE customer_id = '11650';

INSERT INTO sales.orders 
VALUES (1650, 11650, 4, GETDATE()-1, GETDATE(),null, 1, 8);

--6. Uniformização de texto
UPDATE sales.customers
SET city = UPPER(city)
WHERE city IN ('New York', 'Los Angeles');

SELECT * FROM sales.customers;

--7. Tratamento de valores em falta

UPDATE sales.customers
SET phone = 'Sem Contacto'
WHERE phone IS NULL;

SELECT * FROM sales.customers;

-- 8.Construção de valores de texto

UPDATE production.products
SET product_name = CONCAT(LOWER(SUBSTRING(product_name, 1, 3)), '-', product_name)
WHERE category_id IN (1, 2)
  AND product_name IS NOT NULL 
  AND LEN(product_name) >= 3;

-- 9. Eliminação de registos

DELETE FROM sales.orders WHERE customer_id = '11650';

SELECT * FROM sales.orders WHERE customer_id = '11650';
