/*
  Lesson 02 - Expressions, NULL, conversion, and formatting
  Student:
  Class:
  Date:
*/

USE ULHT_DB26;
GO

SELECT TOP (5) EMPLOYEE_ID, SALARY,
       SALARY * 12 AS annual_salary,
       SQL_VARIANT_PROPERTY(SALARY * 12, 'BaseType') 
FROM HR.EMPLOYEES
ORDER BY EMPLOYEE_ID;

SELECT e.EMPLOYEE_ID,e.COMMISSION_PCT, e.SALARY* (1+e.COMMISSION_PCT) AS 'total'
    FROM HR.EMPLOYEES e;

SELECT e.EMPLOYEE_ID,e.COMMISSION_PCT, e.SALARY* (1+COALESCE(e.COMMISSION_PCT,NULL,0)) AS 'total'
    FROM HR.EMPLOYEES e;

SELECT COALESCE(TRY_CONVERT(VARCHAR(20),TRY_CONVERT(NUMERIC(5),'11')),'não numerico');    

SELECT EMPLOYEE_ID, HIRE_DATE,
       FORMAT(HIRE_DATE, 'dd MMM yyyy', 'zn-CH') AS hire_date_display
FROM HR.EMPLOYEES;

SELECT e.EMPLOYEE_ID, FORMAT(e.SALARY,'C','pt-PT'), e.SALARY
  FROM HR.EMPLOYEES AS e;

DECLARE @d AS DATE = GETDATE();

SELECT FORMAT(@d, 'dd/MM/yyyy', 'en-US') AS 'Date',
       FORMAT(87654320, '###-##-####') AS 'Custom Number',
       FORMAT(87654320, '000-##-####') AS 'padding';      