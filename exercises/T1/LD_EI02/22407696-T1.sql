--22407696
--Fabio Dos Santos Farhat
--terceiro ano turma 4 
--2 10 2026

--1

/*
 * 11,64
 */

use BikeStores
GO 

SELECT p.product_id,p.product_name,p.brand_id,p.category_id
,p.model_year,p.list_price FROM production.products p ;

SELECT s.order_date,s.customer_id,s.order_status,s.order_date,s.required_date,s.shipped_date,s.store_id,s.staff_id FROM sales.orders s;


--2

select  p.product_id,p.brand_id,product_name FROM production.products p WHERE p.product_id < 10 ;

--3

SELECT 
    s.first_name,
    s.email,
    LOWER(CONCAT(SUBSTRING(COALESCE(s.first_name, ''), 1, 5),  ' ', COALESCE(s.email, ''))) AS valor_composto
FROM 
    sales.customers AS s
ORDER BY 
    s.email;

--4
SELECT 
    o.order_id,
    CONCAT('Pedido #', CAST(o.order_id AS VARCHAR(10)), ' - ', COALESCE(o.order_status, 'Sem status')) AS pedido_status,    
    o.order_date,
    FORMAT(o.order_date, 'dd/MM/yyyy') AS data_formatada,
    o.order_status,
    LOWER(COALESCE(o.order_status, 'Sem status')) AS status_normalizado
FROM 
    sales.orders AS o
ORDER BY 
    o.order_date DESC;

--6
SELECT first_name FROM sales.customers;

UPDATE sales.customers
SET email = UPPER(email) 
WHERE first_name IN ('Robby', 'Pamelia'); 

SELECT customer_id, first_name, email
FROM sales.customers
WHERE first_name IN ('Robby', 'Pamelia');

--7 

UPDATE sales.customers
SET phone = CONCAT('TEL-', first_name)
WHERE 
    (phone IS NULL OR phone = '')
    AND (first_name IS NOT NULL AND first_name <> '');

SELECT customer_id, first_name, phone
FROM sales.customers
WHERE phone LIKE 'TEL-%';

