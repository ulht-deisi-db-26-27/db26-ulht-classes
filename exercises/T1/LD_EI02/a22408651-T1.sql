-- a22408651; Gonçalo Almeida; Turma 4; 10h30

/*
 * 10,43
 */

USE Bikestores;
GO

-- Explorar o schema
SELECT *
FROM INFORMATION_SCHEMA.TABLES
ORDER BY TABLE_SCHEMA
GO

-- 1. Identificação e metadados

-- Explorar a tabela
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME IN ('brands', 'products')
ORDER BY TABLE_SCHEMA
GO

-- Identificar dependencias (production.brand e production.products)
SELECT TABLE_NAME, COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME IN ('brands', 'products')
  AND COLUMN_NAME LIKE '%_id';


-- Campos, tipos, tamanhos e nulidade
SELECT TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, DATA_TYPE, IS_NULLABLE             
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'production'
  AND TABLE_NAME IN ('brands', 'products')
ORDER BY TABLE_NAME;


-- 2. Consultas e operações básicas
SELECT quantity        AS quantidade_original,
       quantity * 2    AS quantidade_dobro,
       quantity * 3    AS quantidade_triplo
FROM production.stocks
WHERE quantity NOT BETWEEN 7 AND 20
ORDER BY quantity ASC;


-- 3. Operações de linhas
SELECT store_name,
       city,
       CONCAT(store_name, ' - ', city) AS store_formatada
FROM sales.stores


-- 4. Consultas formadas
SELECT customer_id,
       first_name,
       last_name,
       email,
       CONCAT(first_name, ' ', last_name, ' (', FORMAT(customer_id, '0000'), ') - ', email) AS customer_formatado
FROM sales.customers
WHERE phone IS NOT NULL
ORDER BY customer_id;


-- 5. Inserções e validação

-- Explorar a tabela
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'products'
ORDER BY TABLE_SCHEMA
GO

-- Verificar o id antes da inserção
SELECT *
FROM sales.customers
WHERE customer_id = 3333
GO

INSERT INTO sales.customers (customer_id, first_name, last_name, email)
VALUES(3333, 'Gonçalo', 'Almeida', 'goncaloalmeida@example.com')
GO

-- Verificar o id depois da inserção
SELECT *
FROM sales.customers
WHERE customer_id = 3333
GO

-- 6. Uniformização de texto
SELECT category_id, UPPER(category_name)
FROM production.categories
GO

-- 7. Tratamento de valores em falta
SELECT COUNT(*) AS nulos_antes 
FROM production.stocks 
WHERE quantity IS NULL
GO

UPDATE production.stocks
SET quantity = 0
WHERE quantity IS NULL
GO

SELECT COUNT(*) AS nulos_depois
FROM production.stocks
WHERE quantity IS NULL
GO

-- 8. Construção de valores de texto

-- 9. Eliminação de registos
-- Verificação ANTES
SELECT *
FROM sales.customers
WHERE customer_id = 3333
GO

DELETE FROM sales.customers 
WHERE customer_id = 3333
GO

-- Verificação DEPOIS
SELECT *
FROM sales.customers
WHERE customer_id = 3333
GO