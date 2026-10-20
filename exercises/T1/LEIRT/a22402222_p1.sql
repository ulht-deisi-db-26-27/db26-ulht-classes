/*
 * Sem identificação: Ricardo Castro
 * 10,95
 */


--1--
SELECT TABLE_NAME, TABLE_SCHEMA, TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES

--2--
SELECT staff_id,first_name,last_name
FROM sales.staffs 
WHERE staff_id NOT BETWEEN 1 AND 5;


--3--
SELECT manager_id,
manager_id * 2 AS DUPLO,
manager_id * 3 AS TRIPLO
FROM sales.staffs
WHERE manager_id IS NOT NULL
ORDER BY manager_id;


--4--
SELECT staff_id,
RIGHT(REPLICATE('0', 6) + CAST(staff_id AS VARCHAR(6)), 6) AS NOVO
FROM sales.staffs

--5--


INSERT INTO sales.staffs 
(first_name, last_name, email, phone,active,store_id,manager_id)
VALUES 
('RICARDO', 'CASTRO', 'ricardo.CASTRO@example.com', '123456789', 1, 1, 9);   

--6--
UPDATE sales.staffs
SET first_name = UPPER(first_name)
WHERE staff_id IN (1,2,3,4);

--7--
SELECT *
FROM sales.staffs

UPDATE sales.staffs
SET MANAGER_ID = 9
WHERE staff_id = 1

--8--

SELECT first_name,
CONCAT(UPPER(LEFT(first_name, 3)), '-', first_name) AS novo
from sales.staffs
where first_name IS NOT NULL AND staff_id IN (1,2,3,4,5);

--9-- 
SELECT *
FROM sales.staffs

DELETE FROM sales.staffs
WHERE staff_id = 11

SELECT *
FROM sales.staffs

