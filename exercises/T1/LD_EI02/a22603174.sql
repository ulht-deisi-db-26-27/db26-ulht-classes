--a22316074;-- 
--Ricardo Vicente--
--Turma 2, teste às 10:30h--

/*
 * 2,01
 */

--Exercício 1--
SELECT *FROM production.products;
SELECT *FROM sales.order_items;


-- 2--
 SELECT product_id, product_name, list_price FROM production.products WHERE list_price < 500.00 OR list_price > 3000.00 ORDER BY list_price DESC;

-- 3--
SELECT 