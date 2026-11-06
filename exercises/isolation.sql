DBCC USEROPTIONS;

SELECT CASE transaction_isolation_level	
			WHEN 0 THEN 'Unspecified'  							
			WHEN 1 THEN 'ReadUncommitted'  						
			WHEN 2 THEN 'ReadCommitted'  						
			WHEN 3 THEN 'Repeatable Read'  							
			WHEN 4 THEN 'Serializable'  						
			WHEN 5 THEN 'Snapshot' 
		END AS TRANSACTION_ISOLATION_LEVEL  
	FROM sys.dm_exec_sessions  								
	WHERE session_id = @@SPID;