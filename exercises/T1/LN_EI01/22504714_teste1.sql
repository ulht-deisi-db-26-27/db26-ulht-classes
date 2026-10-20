
/*
  test 01 - Read, add, change, and remove rows
  Student: Tomás Negreiro
  Class:ln1
  Date:29/09/26 19:30
*/

/*
 * 9,63
 */

USE BikeStores;
GO
/* 1. Identificação e metadados*/

SELECT TABLE_CATALOG, 
        TABLE_SCHEMA,
        TABLE_NAME,
        TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'sales';

SELECT TABLE_CATALOG, 
        TABLE_SCHEMA,
        TABLE_NAME,
        TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'production';

/* 1. Identificação tabelas essenciais*/

SELECT
    ORDINAL_POSITION,
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'sales'
 AND TABLE_NAME = 'CUSTOMERS'
ORDER BY ORDINAL_POSITION;


SELECT
    ORDINAL_POSITION,
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'production'
 AND TABLE_NAME = 'products'
ORDER BY ORDINAL_POSITION;

/* 1. As duas tabelas tem dependencias entre si,  */

/* ## 2. Consultas e operações básicas*/

SELECT C.customer_id,
        C.zip_code,
        C.phone,
        C.first_name
FROM SALES.customers AS c
ORDER BY C.customer_id ASC ;

SELECT C.customer_id,
        C.zip_code,
        C.phone,
        C.first_name
FROM SALES.customers AS c
ORDER BY C.zip_code DESC ;


/* ## 3. Operações de linha*/

SELECT C.customer_id,
        C.order_date,
        DATEADD(MONTH, 1, C.order_date)  AS data_calculada_entrega
FROM SALES.orders AS c
ORDER BY C.customer_id ASC ;

/*## 4. Consultas formatadas*/


SELECT c.customer_id,
        c.zip_code,
        CONCAT('zip-', cast(c.zip_code AS varchar(10))) AS zip_concat,
        c.first_name,
        CONCAT(c.LAST_NAME, ', ', c.FIRST_NAME) AS full_name,
        c.phone,
        ISNULL(c.phone ,'No Number') AS null_number
FROM SALES.customers AS c
ORDER BY c.zip_code DESC ;


SELECT C.customer_id,
        C.order_date,
        FORMAT(C.order_date, 'dd MMM yyyy', 'en-GB') AS hire_date_display,
        DATEADD(MONTH, 1, C.order_date)  AS data_calculada_entrega
FROM SALES.orders AS c
ORDER BY C.customer_id ASC ;


/*## 5. Inserções e validação*/
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

SELECT C.order_id
FROM sales.orders AS c
WHERE C.order_id = 4404 ;

/*
INSERT INTO sales.staffs
VALUES
    (404, 'Tomás','Negreiro', 'tn@gmail.com', NULL, 1, 14, NULL);*/


