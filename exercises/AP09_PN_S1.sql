USE ULHT_DB26;
SELECT DB_NAME() AS database_name, @@SPID AS session_id,
       @@TRANCOUNT AS transaction_count;

SELECT IIF((@@OPTIONS & 2) = 0, 'OFF', 'ON')
       AS implicit_transactions;      

SELECT CASE transaction_isolation_level
    WHEN 0 THEN 'Unspecified'
    WHEN 1 THEN 'Read Uncommitted'
    WHEN 2 THEN 'Read Committed'
    WHEN 3 THEN 'Repeatable Read'
    WHEN 4 THEN 'Serializable'
    WHEN 5 THEN 'Snapshot'
END AS transaction_isolation_level
FROM sys.dm_exec_sessions
WHERE session_id = @@SPID;        

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'Scott' AND TABLE_NAME = 'DEPT'
ORDER BY ORDINAL_POSITION;
SELECT * FROM Scott.EMP WHERE EMPNO = 1;
SELECT * FROM Scott.DEPT WHERE DEPTNO >= 50;

DELETE FROM Scott.EMP WHERE EMPNO = 1;
DELETE FROM Scott.DEPT WHERE DEPTNO >= 50;
SELECT * FROM Scott.DEPT ORDER BY DEPTNO;

SET implicit_transactions ON;

INSERT INTO Scott.DEPT (DEPTNO, DNAME, LOC)
VALUES (50, 'IT', 'LISBOA');

SELECT * FROM Scott.DEPT WHERE DEPTNO = 50;
SELECT @@TRANCOUNT AS transaction_count;

COMMIT
ROLLBACK

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;