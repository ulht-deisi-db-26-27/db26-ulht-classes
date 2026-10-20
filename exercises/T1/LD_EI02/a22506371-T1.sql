/*
numero de aluno : a22506371
Nome de aluno : Wísley Santiago Vaz Silva
Turma : D01EINF02
Horário de realização do teste : 10:30
*/

/*
 * 7,62
 */

/*1*/
SELECT * FROM sys.tables;


/*2*/

SELECT product_id, category_id, product_name, model_year FROM production.products WHERE category_id > 1 AND category_id < 5;

/*3*/



/*4*/

/*5*/
SET IDENTITY_INSERT sales.stores OFF; 
INSERT INTO sales.stores(store_id, store_name, phone, email) VALUES ( 4, 'grande loja', 123455, 'wisley@mail.com');

SELECT * FROM sales.stores WHERE store_id = 4;

/*6*/

SELECT customer_id, UPPER(first_name) AS nome_minusculo FROM sales.customers;


/*7*/



/*8*/


/*9*/

DELETE FROM sales.stores WHERE store_id = 4;
