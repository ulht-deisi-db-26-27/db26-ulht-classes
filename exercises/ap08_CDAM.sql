SELECT e.employee_id, d.department_id
FROM HR.employees AS e
CROSS JOIN HR.departments AS d
WHERE e.employee_id <= 103 AND d.department_id IN (60, 90)
ORDER BY d.department_id;

SELECT COUNT(*) FROM HR.EMPLOYEES
SELECT COUNT(*) FROM HR.DEPARTMENTS

SELECT e.employee_id, d.department_id
FROM HR.employees AS e
INNER JOIN HR.departments AS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
-- WHERE e.employee_id <= 103 AND d.department_id IN (60, 90)
-- ORDER BY d.department_id;

SELECT e.employee_id, d.department_id
FROM HR.employees AS e
FULL OUTER JOIN HR.departments AS d
  ON d.department_id = e.department_id
WHERE e.employee_id IS NULL 
ORDER BY d.department_id, e.employee_id;

SELECT e.employee_id,
       (SELECT j.job_title FROM HR.jobs AS j
        WHERE j.job_id = e.job_id) AS job_title
FROM HR.employees AS e
WHERE e.employee_id = 103;

SELECT *,
        (SELECT AVG(e.SALARY)
                        FROM HR.EMPLOYEES e 
                        WHERE e.DEPARTMENT_ID = ext.DEPARTMENT_ID
                        GROUP  BY e.DEPARTMENT_ID) as media
    FROM HR.EMPLOYEES ext
    WHERE SALARY > (SELECT AVG(e.SALARY)
                        FROM HR.EMPLOYEES e 
                        WHERE e.DEPARTMENT_ID = ext.DEPARTMENT_ID
                        GROUP  BY e.DEPARTMENT_ID)

SELECT DISTINCT ext.*,
        (SELECT AVG(e.SALARY)
                        FROM HR.EMPLOYEES e 
                        WHERE e.DEPARTMENT_ID = ext.DEPARTMENT_ID
                        GROUP  BY e.DEPARTMENT_ID) as media
FROM HR.EMPLOYEES ext JOIN
    HR.EMPLOYEES e ON ext.DEPARTMENT_ID=e.DEPARTMENT_ID


SELECT ext.*,
        (SELECT AVG(e.SALARY)
                        FROM HR.EMPLOYEES e 
                        WHERE e.DEPARTMENT_ID = ext.DEPARTMENT_ID
                        GROUP  BY e.DEPARTMENT_ID) as media
FROM HR.EMPLOYEES ext JOIN
    HR.EMPLOYEES e ON ext.EMPLOYEE_ID = e. EMPLOYEE_ID 