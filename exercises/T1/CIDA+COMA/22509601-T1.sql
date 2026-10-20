/*
22509601
Pedro Fernandes
EX1*/

/* 
 * 2,41
 */
SELECT
    CATALOG_NAME,
    SCHEMA_NAME,
    SCHEMA_OWNER
FROM INFORMATION_SCHEMA.SCHEMATA
ORDER BY SCHEMA_NAME;
/* 1.duas tabelas fundamentais sao sales e customers,so vai haver sales se ouver customers o manager_id e o customer id sao nullable */
SELECT
    TABLE_SCHEMA,
    TABLE_NAME,
    TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES
ORDER BY TABLE_SCHEMA, TABLE_NAME;
/*2.uma tabela e os order items*/

SELECT
    ORDINAL_POSITION,
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS ;

