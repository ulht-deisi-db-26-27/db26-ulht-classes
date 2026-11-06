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

DECLARE @lastID AS INT;
SET @lastID = (SELECT MAX(d.DEPTNO) FROM Scott.DEPT d (NOLOCK));
SELECT @lastID+10 AS nextDEPT;
COMMIT

SELECT * FROM scott.DEPT (NOLOCK)

SELECT * FROM Scott.EMP
ROLLBACK
GO
BEGIN TRY
    DECLARE @lastID AS INT;
    SET @lastID = (SELECT MAX(d.DEPTNO) FROM Scott.DEPT d (NOLOCK));
    SELECT @lastID+10 AS nextDEPT;

    BEGIN TRANSACTION
        INSERT INTO scott.DEPT
        VALUES(@lastID,'IT','Lisboa')

        INSERT INTO Scott.EMP (EMPNO,ENAME,DEPTNO)
        VALUES(1234,'teste',@lastid+10)

    COMMIT TRANSACTION
END TRY
BEGIN CATCH
    IF ERROR_NUMBER() = 2627 -- funcionário já existe, erro de duplicação de no em emp
    BEGIN
        UPDATE Scott.EMP
            SET DEPTNO = @lastID+10 
            WHERE EMPNO = 1234
        COMMIT
    END
    ELSE ROLLBACK TRANSACTION
    SELECT ERROR_MESSAGE(),ERROR_NUMBER();
END CATCH

SELECT * FROM Scott.DEPT
SELECT * FROM scott.EMP