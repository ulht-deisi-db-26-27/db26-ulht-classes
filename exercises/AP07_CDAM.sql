SELECT * FROM HR.EMPLOYEES;
SELECT * FROM HR.DEPARTMENTS;

CREATE TABLE HR.training_job (
    job_id INT NOT NULL PRIMARY KEY,
    job_code VARCHAR(10) NOT NULL UNIQUE
);
CREATE TABLE HR.training_assignment (
    assignment_id INT NOT NULL PRIMARY KEY,
    job_code VARCHAR(10) NOT NULL
);

SELECT * FROM INFORMATION_SCHEMA.TABLES t WHERE t.TABLE_NAME LIKE '%training%'
SELECT * FROM INFORMATION_SCHEMA.COLUMNS c WHERE c.TABLE_NAME LIKE '%training%'

INSERT INTO HR.training_assignment
    VALUES(3,'A');
INSERT INTO HR.training_job
    VALUES(2,'B');

SELECT * FROM HR.training_assignment;
SELECT * FROM HR.training_job;    

ALTER TABLE HR.training_assignment
ADD CONSTRAINT FK_training_assignment_job
FOREIGN KEY (job_code)
REFERENCES HR.training_job (job_code);

UPDATE HR.training_job
    SET job_code = 'B'
    WHERE job_id = 2;

INSERT INTO HR.training_job
    VALUES(1,'A')    

UPDATE HR.training_assignment
    SET job_code = 'A'
    WHERE assignment_id = 1;

DELETE FROM HR.training_job
    WHERE job_code = 'B';

UPDATE HR.training_job
    SET job_id = 2
    WHERE job_id = 1

DROP TABLE HR.training_job;    

ALTER TABLE HR.training_assignment
    DROP CONSTRAINT FK_training_assignment_job;

ALTER TABLE HR.training_assignment
ADD CONSTRAINT FK_training_assignment_job
FOREIGN KEY (job_code)
REFERENCES HR.training_job (job_code)
ON UPDATE CASCADE;  

DROP TABLE HR.training_assignment
DROP TABLE HR.training_job


SELECT assignment_id,job_code FROM HR.training_assignment;