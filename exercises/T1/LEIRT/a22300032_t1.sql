/*
 * Não tem identificação
 * 10,55
 */
USE BikeStores
GO

--exercicio 1
SELECT
    TABLE_SCHEMA,
    TABLE_NAME,
    TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES
ORDER BY TABLE_SCHEMA, TABLE_NAME;

SELECT
    ORDINAL_POSITION,
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'sales'
  AND TABLE_NAME = 'customers'
ORDER BY ORDINAL_POSITION;

SELECT
    ORDINAL_POSITION,
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'sales'
  AND TABLE_NAME = 'orders'
ORDER BY ORDINAL_POSITION;

--Sim, a tabela "orders" tem depedencia com a de "customers", pois tem a customer_id.

--exercicio 2
SELECT customer_id, first_name, last_name
FROM sales.customers
WHERE customer_id NOT BETWEEN 30 AND 300;

--exercicio 3
SELECT customer_id,
    customer_id*2 AS multiplicadopor2,
    customer_id/2 AS divididopor2
FROM sales.orders
WHERE customer_id IS NOT NULL
ORDER BY customer_id ASC;

--exercicio 4
SELECT customer_id, last_name,
    CONCAT(CONCAT(CONCAT('000', customer_id), '-'), last_name) AS valor_formatado
FROM sales.customers
ORDER BY valor_formatado ASC;

--exercicio 5
SELECT order_id, order_status, order_date, required_date, store_id, staff_id, customer_id
FROM sales.orders
WHERE order_id = 6000;

INSERT INTO sales.orders
    (order_id, order_status, order_date, required_date, store_id, staff_id, customer_id)
VALUES
    (6000, 2, '2026-09-28', '2026-09-28', 3, 3, NULL)

SELECT order_id, order_status, order_date, required_date, store_id, staff_id, customer_id
FROM sales.orders
WHERE order_id = 6000;

--exercicio 6
UPDATE sales.customers
SET last_name = UPPER(last_name)
WHERE customer_id BETWEEN 30 AND 40;

SELECT customer_id, last_name
FROM sales.customers

--exercicio 7 
UPDATE sales.customers
SET phone = 'nao possui'
WHERE phone = NULL;

SELECT phone
FROM sales.customers
