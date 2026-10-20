SELECT COUNT(*),COUNT(DEPARTMENT_ID),COUNT(DISTINCT(DEPARTMENT_ID)) FROM HR.EMPLOYEES
SELECT COUNT(*) FROM HR.DEPARTMENTS

SELECT e.employee_id, d.department_id
FROM HR.employees AS e
CROSS JOIN HR.departments AS d
-- WHERE e.employee_id = 103 AND d.department_id IN (60, 90)
-- ORDER BY d.department_id;

SELECT * FROM HR.EMPLOYEES e,HR.DEPARTMENTS d
    WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID

SELECT e.employee_id, d.department_id
FROM HR.employees AS e
INNER JOIN HR.departments AS d ON e.DEPARTMENT_ID=d.DEPARTMENT_ID

SELECT e.employee_id, d.department_id
FROM HR.employees AS e
FULL OUTER JOIN HR.departments AS d ON e.DEPARTMENT_ID=d.DEPARTMENT_ID

;WITH reporting AS (
    SELECT employee_id, manager_id, 0 AS depth,
           CAST(RIGHT('000000' + CAST(employee_id AS VARCHAR(6)), 6) AS VARCHAR(400)) AS path
    FROM HR.employees -- WHERE employee_id = 103
    UNION ALL
    SELECT e.employee_id, e.manager_id, r.depth + 1,
           CAST(r.path + '.' + RIGHT('000000' + CAST(e.employee_id AS VARCHAR(6)), 6) AS VARCHAR(400))
    FROM HR.employees AS e JOIN reporting AS r ON e.manager_id = r.employee_id
)
SELECT employee_id, manager_id, depth, path FROM reporting ORDER BY path 

SELECT AVG(e.SALARY) FROM HR.EMPLOYEES e


SELECT e.DEPARTMENT_ID,MAX(e.SALARY)
    FROM HR.EMPLOYEES e
    GROUP BY e.DEPARTMENT_ID    
--    HAVING AVG(e.SALARY) > (SELECT AVG(e.SALARY) FROM HR.EMPLOYEES e)

SELECT * FROM HR.EMPLOYEES e
    WHERE e.SALARY = (SELECT MAX(i.SALARY)
                            FROM HR.EMPLOYEES i
                            WHERE i.DEPARTMENT_ID = e.DEPARTMENT_ID
                            GROUP BY i.DEPARTMENT_ID)
    ORDER BY e.DEPARTMENT_ID

SELECT e.employee_id, j.job_id
FROM HR.employees AS e
INNER JOIN HR.jobs AS j
  ON e.salary BETWEEN j.min_salary AND j.max_salary
WHERE e.employee_id IN (103, 104)
ORDER BY e.employee_id, j.job_id;

SELECT e.employee_id, j.job_id
FROM HR.employees AS e
CROSS JOIN HR.jobs AS j
WHERE e.employee_id IN (103, 104) AND e.salary BETWEEN j.min_salary AND j.max_salary
ORDER BY e.employee_id, j.job_id;

SELECT e.employee_id, j.job_id
FROM HR.employees AS e, HR.jobs AS j
WHERE e.employee_id IN (103, 104) AND e.salary BETWEEN j.min_salary AND j.max_salary
ORDER BY e.employee_id, j.job_id;