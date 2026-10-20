--#EX1:
--HR, Scott, production, sales
--Escolho production.products e sales.customers
/*
 * -0.63
 * Nem identificou o ficheiro
 */
SELECT *
FROM production.products;


SELECT *
FROM sales.customers;
--Têm dependência entre si pois a produção de produtos depende muito dos seus consumidores.





--EX2
SELECT *
FROM sales.staffs;
SELECT sales.staffs FROM first_name WHERE column_name IN (value1, value2, ...)