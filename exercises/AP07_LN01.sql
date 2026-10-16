SELECT * FROM INFORMATION_SCHEMA.TABLES t WHERE t.TABLE_NAME LIKE '%training%'

DROP TABLE hr.training_assignment;
DROP TABLE hr.training_job;

CREATE TABLE HR.training_job (
    job_id INT NOT NULL PRIMARY KEY,
    job_code VARCHAR(10) NOT NULL UNIQUE
);
CREATE TABLE HR.training_assignment (
    assignment_id INT NOT NULL PRIMARY KEY,
    job_code VARCHAR(10) NOT NULL
);

INSERT INTO hr.training_job
    VALUES(1,'A');
INSERT INTO hr.training_assignment
    VALUES (2,'B')

ALTER TABLE HR.training_assignment
    ADD CONSTRAINT FK_training_assignment_job
    FOREIGN KEY (job_code)
    REFERENCES HR.training_job (job_code);        

UPDATE hr.training_assignment
    SET job_code = 'A'
    WHERE assignment_id = 2    

SELECT * FROM hr.training_job
SELECT * FROM hr.training_assignment    

INSERT INTO hr.training_assignment
    VALUES (3,'B')

UPDATE hr.training_assignment
    SET job_code = 'B'
    WHERE assignment_id = 2   

UPDATE hr.training_job
    SET job_code = 'B'    
    WHERE job_id = 1

DELETE FROM hr.training_job
    WHERE job_id = 1

SELECT fk.name, OBJECT_SCHEMA_NAME(fk.parent_object_id) AS slave_schema,
       OBJECT_NAME(fk.parent_object_id) AS slave_table,
       COL_NAME(fkc.parent_object_id, fkc.parent_column_id) AS slave_column,
       OBJECT_NAME(fk.referenced_object_id) AS master_table,
       COL_NAME(fkc.referenced_object_id, fkc.referenced_column_id) AS master_column,
       fk.update_referential_action_desc,
       fk.delete_referential_action_desc
FROM sys.foreign_keys AS fk JOIN sys.foreign_key_columns AS fkc
ON fkc.constraint_object_id = fk.object_id
WHERE OBJECT_NAME(fk.referenced_object_id)= 'employees'     

ALTER TABLE hr.training_assignment
    DROP CONSTRAINT FK_training_assignment_job
    

ALTER TABLE HR.training_assignment
    ADD CONSTRAINT FK_training_assignment_job
    FOREIGN KEY (job_code)
    REFERENCES HR.training_job (job_code)
    ON UPDATE CASCADE;   