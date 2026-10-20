/*
  Numero: a22601053
  Student:João Victor Franco da Costa   
  Turno: Noite
  Date:29/09/2026 noite 19:16
*/

/*
 * 14,04
 */

USE BikeStores
GO

--Exercício 1 Identificação e metadados
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS;

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'products'; -- poderia trocar apenas o nome para cada uma das tabelas diferentes em table_name se quisesse uma visualização mais ordenada

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'customers';


SELECT 
TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES;  -- brand_id existe na table brands ena table products. 


--Exercicio 2  Consultas e operações básicas
SELECT 
    customer_id,
    phone
FROM sales.customers WHERE phone is NOT NULL;

SELECT
    customer_id,
    phone
FROM sales.customers WHERE phone is null and customer_id> 5;

--EXERCICIO 3 Operações de linha

SELECT 
TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES;

SELECT *
FROM sales.orders;

SELECT 
    order_id,
    order_date,
    DATEADD(MONTH,12,order_date) as nextyear
FROM sales.orders;

SELECT 
    order_id,
    order_date,
    DATEADD(MONTH,12,order_date) as nextyear,
    DATEDIFF(day, DATEADD(MONTH,12,order_date),order_date) as diferenca
FROM sales.orders;

-- EXERCICIO 4 Consultas formatadas

SELECT *
FROM sales.customers;

SELECT
    customer_id,
    UPPER(first_name) as first_name_Uppercase,
    COALESCE(phone,'inalcansável por telefone') as contato,
    CONCAT(LEFT(last_name, 1),'. ', first_name) as nome_formal

FROM sales.customers;

--EXERCICIO 5

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'customers';

SELECT 
COLUMN_NAME,
IS_NULLABLE,
ORDINAL_POSITION
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'customers';

select *
from sales.customers ORDER BY customer_id DESC;

SELECT *
from sales.customers where email = 'joao.costa@gmail.com';

INSERT INTO sales.customers
        VALUES(
    'Joao',
    'Costa',
    NULL,
    'joao.costa@gmail.com',
    CAST(GETDATE() AS varchar(20)),
    'RIO DE JANEIRO',
    'RJ',
    '22713'
)

--Exercicio 6

SELECT 
    customer_id,
    LOWER(last_name) as lowered_last_name
FROM sales.customers 
WHERE customer_id BETWEEN 300 and 400;

--Exercicio 7
SELECT
    customer_id,
    COALESCE(phone,email,'inalcansável por telefone') as contato
FROM sales.customers;









