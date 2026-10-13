
IF OBJECT_ID('HR.employee_training', 'U') IS NULL
CREATE TABLE hr.employee_training_2 (
    employee_id INT NOT NULL,
    course_code VARCHAR(12) NOT NULL,
    completed_on DATE NULL DEFAULT GETDATE(),
    score DECIMAL(5, 2) NULL
)
ELSE
    PRINT 'já existe';

INSERT INTO hr.employee_training_2
        (employee_id,course_code)
    VALUES (1,12)

SELECT * FROM hr.employee_training_2

-- Verify TABLE 'employee_training' was created.
SELECT * FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'employee_training_2';
-- Verify all columns were created on TABLE 'employee_training'.
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'HR' AND TABLE_NAME = 'employee_training';

DROP TABLE dbo.employee_training

SELECT CAST(36525.5 AS DATETIME)