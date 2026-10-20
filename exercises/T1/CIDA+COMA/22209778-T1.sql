/*
 * Sem identificação: Tiago Melo
 * 1,32
 */
 SELECT
    TABLE_SCHEMA,
    TABLE_NAME,
    TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES
ORDER BY TABLE_SCHEMA, TABLE_NAME;

SELECT
    ORDINAL_POSITION,
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS


SELECT
    TABLE_SCHEMA,
    TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_SCHEMA, TABLE_NAME;

--As tabelas têm uma relação entre si, como por exemplo, a TABLE_SCHEMA que está "devidida" entre produciton e sales, é visivel que as production são apenas relevantes para as categories, products, stocks e brand da TABLE_NAME. Tal como as sales estão relacionas com os costumers, order_items, order, staffs, stores.



