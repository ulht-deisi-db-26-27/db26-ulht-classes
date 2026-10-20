--22506330, vADYM vITRENKO, 09:30

/*
 * 3,21
 */


USE BikeStores;

--exercicio 1
SELECT * FROM production.brands;

SELECT * FROM production.categories;

SELECT * FROM production.products;

SELECT * FROM production.stocks;

SELECT * FROM sales.customers;

SELECT * FROM sales.orders;

SELECT * FROM sales.order_items;

SELECT * FROM sales.staffs;

SELECT * FROM sales.stores;

--exercicio 2
SELECT quantity
FROM sales.order_items
WHERE list_price > 4;

--exercicio 3
SELECT FIRST_NAME, LAST_NAME
FROM sales.staffs

SELECT CONCAT(LOWER(FIRST_NAME), ' ', LOWER(LAST_NAME)) AS full_name
FROM sales.staffs
