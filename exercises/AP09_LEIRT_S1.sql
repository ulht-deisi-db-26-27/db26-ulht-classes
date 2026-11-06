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

INSERT INTO Scott.DEPT (DEPTNO, DNAME, LOC)
VALUES (50, 'IT', 'LISBOA');

SELECT * FROM scott.DEPT;
DELETE FROM scott.DEPT WHERE DEPTNO = 50;

COMMIT
ROLLBACK

SET implicit_transactions OFF;

BEGIN TRY
    BEGIN TRANSACTION
        INSERT INTO Scott.DEPT (DEPTNO, DNAME, LOC)
            VALUES (50, 'IT', 'LISBOA');
        SELECT 'Inserção com sucesso'
    COMMIT TRANSACTION 
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER() AS error_number, ERROR_MESSAGE() AS message;
    IF XACT_STATE() <> 0 ROLLBACK TRANSACTION;
--     THROW;
END CATCH;

