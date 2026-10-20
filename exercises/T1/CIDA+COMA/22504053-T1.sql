/*
 * Não tem identificação: Pedro Tavira
 * 15,77
 */

USE BikeStores;
GO
-- EX 1

SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE, IS_NULLABLE, CHARACTER_MAXIMUM_LENGTH, NUMERIC_PRECISION
    FROM INFORMATION_SCHEMA.COLUMNS

SELECT *
FROM sales.customers;

SELECT *
FROM sales.orders;

-- estas tabelas têm dependencia entrwe si pois quantos mais clientes existem, mais pedidos existem, ou seja, a tabela orders depende da tabela customers.
-- tambem a coluna character_maximum_length e numeric_precision estao relacionadas pois dependendo do tipo de dado da coluna uma contem o valor enquanto a outra é nula.

--EX 2
SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE IS_NULLABLE = 'YES'

SELECT phone, email
    FROM sales.customers

-- EX 3

SELECT FIRST_NAME, PHONE, LOWER(FIRST_NAME)+ ' ' + PHONE as "Customer Name and Phone"
    FROM sales.customers
    WHERE PHONE IS NOT NULL
    ORDER BY 'Customer Name and Phone' ASC;

-- EX 4

SELECT
    customer_id,
    first_name,
    FORMAT(customer_id, '0000') + '-' + first_name AS unique_identifier
FROM sales.customers
ORDER BY unique_identifier;

-- EX 5

INSERT INTO sales.customers (customer_id, first_name, last_name, phone, email, street, city, state, zip_code)
VALUES (10000000, 'Pedro', 'TAvira', '123-456-7890', 'john.doe@email.com', '123 Main St', 'Anytown', 'CA', '12345')

   
-- EX 6

SELECT LOWER(FIRST_NAME) AS Nome_em_Minusculas, ZIP_CODE
FROM sales.customers
WHERE ZIP_CODE <= 10500 AND ZIP_CODE >= 10000

-- EX 7 
UPDATE sales.customers
SET phone = NULL
WHERE state IN ('CA', 'NY')
    AND customer_id BETWEEN 100 AND 200;

SELECT *
FROM sales.customers

--EX 8

UPDATE sales.customers
SET first_name = 'cust-' + LOWER(RIGHT(last_name, 4))
WHERE customer_id BETWEEN 100 AND 200 AND LEN(first_name) > 0 AND LEN(last_name) >= 4;

-- EX 9

SELECT *
FROM sales.customers
WHERE customer_id = 10000000

DELETE 
FROM sales.customers
WHERE customer_id = 10000000

