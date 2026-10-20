/*
    a22502776
    Francisco Jesus
    Base dados 2º ano
    19:30
*/

/*
 * 5,22
 */

USE BikeStores
GO

SELECT DB_NAME() AS database_name; 

/*1*/
SELECT *
FROM BikeStores.INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'BIKES'
  AND TABLE_TYPE = 'BASE TABLE';

/*2*/
SELECT *
FROM sales.order_items;

SELECT *
FROM production.products;
/*
Duas opcoes porque contem o produto vendido e outra com a quantidade de vendas e lucro e desconto
*/

SELECT *
FROM sales.customers
WHERE phone IS NULL;

/*3*/
SELECT *
FROM sales.orders
WHERE order_date 

/*5*/

/*6*/
SELECT TOP 5
    LOWER(product_name) AS Product_name
FROM production.products
WHERE model_year BETWEEN 2016 AND 2017;

/*7*/


/*8*/
SELECT TOP 5
    CONCAT(UPPER(first_name) + '-', [state])
    state,
    zip_code
FROM sales.customers;