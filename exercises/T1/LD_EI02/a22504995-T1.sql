/* Numero: a22504995
Nome: Dinis Almeida
Turma: PD01CIDA01
Horário de realização do teste: 02/10/2026 09:30
*/

/*
 * 16,05
 */

USE BikeStores
GO

/*1*/

SELECT s.name AS [schema], t.name AS tabela
FROM sys.tables AS t
JOIN sys.schemas AS s ON s.schema_id = t.schema_id
ORDER BY s.name, t.name;

/* Duas tabelas fundamentais: production.products e production.categories */

SELECT s.name AS [schema], t.name AS tabela, c.name AS campo,
			 ty.name +
			 CASE
					 WHEN ty.name IN ('varchar', 'char', 'varbinary', 'binary')
							 THEN '(' + CASE WHEN c.max_length = -1 THEN 'MAX' ELSE CAST(c.max_length AS varchar(10)) END + ')'
					 WHEN ty.name IN ('nvarchar', 'nchar')
							 THEN '(' + CASE WHEN c.max_length = -1 THEN 'MAX' ELSE CAST(c.max_length / 2 AS varchar(10)) END + ')'
					 WHEN ty.name IN ('decimal', 'numeric')
							 THEN '(' + CAST(c.precision AS varchar(10)) + ',' + CAST(c.scale AS varchar(10)) + ')'
					 ELSE ''
			 END AS tipo_dados,
			 CASE WHEN c.is_nullable = 1 THEN 'SIM' ELSE 'NAO' END AS permite_nulos
FROM sys.tables AS t
JOIN sys.schemas AS s ON s.schema_id = t.schema_id
JOIN sys.columns AS c ON c.object_id = t.object_id
JOIN sys.types AS ty ON ty.user_type_id = c.user_type_id
WHERE (s.name = 'production' AND t.name IN ('products', 'categories'))
ORDER BY t.name, c.column_id;

/*As tabelas tem dependencia*/

/* 2*/
SELECT product_id, product_name, model_year, list_price
FROM production.products
WHERE model_year NOT BETWEEN 2018 AND 2022;

/* 3 */
SELECT first_name, phone,
			 LOWER(LEFT(first_name, 3) + ' ' + phone) AS texto_composto
FROM sales.customers
WHERE phone IS NOT NULL
	AND first_name IS NOT NULL
ORDER BY phone;

/* 4*/
SELECT order_id AS identificador,
			 order_status AS classificacao,
			 'Encomenda ' + CONVERT(varchar(10), order_id) AS identificador_em_texto,
			 ISNULL(CONVERT(varchar(10), shipped_date, 23), 'Por enviar') AS data_envio,
			 FORMAT(order_date, 'dd/MM/yyyy') AS data_encomenda_formatada
FROM sales.orders;

/* 5*/
SELECT c.name AS campo, ty.name AS tipo_dados,
			 CASE
					 WHEN ty.name IN ('varchar', 'char', 'varbinary', 'binary') THEN CAST(c.max_length AS varchar(10))
					 WHEN ty.name IN ('nvarchar', 'nchar') THEN CAST(c.max_length / 2 AS varchar(10))
					 ELSE NULL
			 END AS tamanho,
			 CASE WHEN c.is_nullable = 1 THEN 'SIM' ELSE 'NAO' END AS permite_nulos,
			 c.is_identity AS e_identity
FROM sys.columns AS c
JOIN sys.types AS ty ON ty.user_type_id = c.user_type_id
WHERE c.object_id = OBJECT_ID('sales.staffs')
ORDER BY c.column_id;

SELECT staff_id, first_name, last_name, email
FROM sales.staffs
WHERE staff_id = 9999;

IF NOT EXISTS (SELECT 1 FROM sales.staffs WHERE staff_id = 9999)
BEGIN
		SET IDENTITY_INSERT sales.staffs ON;
		INSERT INTO sales.staffs (staff_id, first_name, last_name, email, active, store_id)
		VALUES (9999, 'Dinis', 'Almeida', 'teste.a22504995@bikestores.local', 1, 1);
		SET IDENTITY_INSERT sales.staffs OFF;
END;

SELECT staff_id, first_name, last_name, email, active, store_id
FROM sales.staffs
WHERE staff_id = 9999;

/* 6*/
UPDATE sales.customers
SET city = UPPER(city)
WHERE state IN ('NY', 'CA')
	AND city IS NOT NULL;

/* 7*/
UPDATE sales.customers
SET phone = 'Tel-' + first_name
WHERE (phone IS NULL OR LTRIM(RTRIM(phone)) = '')
	AND first_name IS NOT NULL
	AND LTRIM(RTRIM(first_name)) <> '';

/* 8*/
UPDATE sales.customers
SET email = 'bike-' + LOWER(RIGHT(email, 4))
WHERE customer_id BETWEEN 1 AND 10
	AND email IS NOT NULL
	AND LTRIM(RTRIM(email)) <> ''
	AND LEN(email) >= 4;

/* 9*/
SELECT staff_id, first_name, last_name, email
FROM sales.staffs
WHERE staff_id = 9999
	AND first_name = 'Dinis'
	AND last_name = 'Almeida'
	AND email = 'teste.a22504995@bikestores.local';

DELETE FROM sales.staffs
WHERE staff_id = 9999
	AND first_name = 'Dinis'
	AND last_name = 'Almeida'
	AND email = 'teste.a22504995@bikestores.local';

SELECT staff_id, first_name, last_name, email
FROM sales.staffs
WHERE staff_id = 9999
	AND first_name = 'Dinis'
	AND last_name = 'Almeida'
	AND email = 'teste.a22504995@bikestores.local';
