/*a22604505
Ellen Pinto
T1
09H30*/

/*
 * 5,22
 */

SELECT quantity FROM sales.order_items WHERE quantity ! < 0 AND quantity ! < 1;
/*1.4 -> 1.3*/
SELECT phone, email, LOWER(CONCAT(SUBSTRING(phone,1,5),email)) AS novo_valor FROM SALES.staffs ORDER BY novo_valor ;
/*1.5 -> 1.4*/
SELECT CONCAT(staff_id,'-',first_name) AS concat_texto, CAST(phone AS VARCHAR(10)) AS CONVERT_CHAR, ISNULL( CAST(phone AS VARCHAR(10)),0) AS subst_null FROM sales.staffs;

SELECT store_name,UPPER(store_name) FROM sales.stores;

SELECT phone, REPLACE(ISNULL(phone,0), ' ','CONCAT('-',city)') AS concat_phone FROM sales.stores;
/*1.9*/






