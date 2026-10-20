--22603340
--Valdir Bengui
--Turma 02
--Sexta-feira 9:30

/*
 * 9,63
 */

--exercicio 1
use BikeStores
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sales'

SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='sales'

SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='production'


SELECT * FROM INFORMATION_SCHEMA.COLUMNS

--exercicio2

SELECT product_id,product_name, model_year from production.products WHERE product_id NOT BETWEEN 2 AND 6;
SELECT *FROM sales.customers

--exercicio 3

SELECT 
    first_name, -- Campo completo
    email, -- Campo que pode ter valores nulos
    LOWER(CONCAT(SUBSTRING(first_name, 1, 5), ' ', email)) AS valor_composto
FROM 
    sales.customers
WHERE 
    first_name IS NOT NULL 
    AND email IS NOT NULL
ORDER BY 
    first_name

    



    SELECT street from sales.customers

    --exercicio 6

UPDATE sales.customers
SET first_name = UPPER(first_name)
WHERE LOWER(street) IN ('9273 thorne avec.', '988 pearl lane');

--exercicio 7

UPDATE sales.customers
SET last_name = CONCAT('EMP-', last_name)
WHERE (last_name IS NULL OR last_name = '')
  AND last_name IS NOT NULL
  AND last_name <> '';













