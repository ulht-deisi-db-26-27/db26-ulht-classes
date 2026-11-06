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

SET implicit_transactions OFF;


BEGIN TRANSACTION
    DECLARE @lastID AS INT;
    SET @lastID = (SELECT MAX(d.DEPTNO) FROM Scott.DEPT d);
    SELECT @lastID+10 AS nextDEPT;

    INSERT INTO scott.DEPT
        VALUES(@lastID+10,'IT','Lisboa')

    SELECT * FROM Scott.DEPT
ROLLBACK TRANSACTION

BEGIN TRANSACTION

INSERT INTO Scott.EMP (EMPNO,ENAME,DEPTNO)
    VALUES(1234,'teste',50)

SELECT * FROM Scott.EMP

ROLLBACK  TRANSACTION  

GO

BEGIN TRY
    DECLARE @lastID AS INT;
    SET @lastID = (SELECT MAX(d.DEPTNO) FROM Scott.DEPT d (NOLOCK));
    SELECT @lastID+10 AS nextDEPT;

    BEGIN TRANSACTION
        INSERT INTO scott.DEPT
        VALUES(@lastID+10,'IT','Lisboa')

        INSERT INTO Scott.EMP (EMPNO,ENAME,DEPTNO)
        VALUES(1234,'teste',@lastid+10)

    COMMIT TRANSACTION
    PRINT 'Inserções bem sucedidas';
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
    ROLLBACK TRANSACTION
    PRINT 'erro na inserção'
END CATCH

SELECT * FROM Scott.DEPT
SELECT * FROM scott.EMP

BEGIN TRY
    BEGIN TRANSACTION
        DELETE FROM Scott.EMP WHERE EMPNO=1234
        DELETE FROM Scott.DEPT WHERE DEPTNO = 50
    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
END CATCH        