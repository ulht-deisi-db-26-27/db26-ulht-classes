/*22502829, José Boieiro, N01EINF01, 19:30*/
/*
 * 13,24
 */
USE BikeStores
/*1.*/
SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, IS_NULLABLE 
    FROM INFORMATION_SCHEMA.COLUMNS ORDER BY TABLE_NAME;

/*2.*/
SELECT * FROM sales.customers ORDER BY customer_id DESC, last_name ASC;

/*3.*/
SELECT order_date, DATEADD(YEAR, 1 , order_date) AS Data_Alterada, DATEDIFF(DAY, order_date, GETDATE()) AS Diff_Dias FROM sales.orders ORDER BY Diff_Dias DESC;

/*4.*/


/*5.*/
SELECT * FROM sales.orders WHERE order_id = 1616;

INSERT INTO sales.orders VALUES (2, 3, DATEADD(DAY, -1, GETDATE()), GETDATE(), NULL, 2, 3);

SELECT * FROM sales.orders order by order_id DESC;

/*6.*/
SELECT brand_id, brand_name FROM production.brands WHERE brand_name = 'Electra';

UPDATE production.brands SET brand_name = LOWER(brand_name);

SELECT brand_id, brand_name FROM production.brands WHERE brand_name = 'Electra';

/*7.*/
SELECT * FROM production.stocks WHERE store_id IN (2,3,4,5,6,7) AND product_id BETWEEN 10 AND 15;

UPDATE production.stocks SET quantity = NULL WHERE store_id IN (2,3,4,5,6,7) AND product_id BETWEEN 10 AND 15;

SELECT * FROM production.stocks WHERE store_id IN (2,3,4,5,6,7) AND product_id BETWEEN 10 AND 15;

/*8.*/
SELECT * FROM production.brands;

/*9.*/
SELECT * FROM sales.orders WHERE order_id = 1616;
DELETE FROM sales.orders WHERE order_id = 1616;
SELECT * FROM sales.orders WHERE order_id = 1616;