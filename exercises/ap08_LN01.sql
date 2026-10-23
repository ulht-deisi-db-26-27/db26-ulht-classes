SELECT e.employee_id, e.salary,j.job_id,j.min_salary, j.max_salary
FROM HR.employees AS e
CROSS JOIN HR.jobs AS j
WHERE e.JOB_ID = j.JOB_ID and
    e.employee_id IN (103, 104) AND 
   e.salary BETWEEN j.min_salary AND j.max_salary
ORDER BY e.employee_id, j.job_id;

SELECT COUNT(*) FROM HR.EMPLOYEES
SELECT COUNT(*) FROM HR.JOBS

SELECT e.employee_id, e.salary,j.job_id,j.min_salary, j.max_salary
FROM HR.employees AS e
INNER JOIN HR.jobs AS j ON e.JOB_ID = j.JOB_ID
-- WHERE e.employee_id IN (103, 104) AND 
--   e.salary BETWEEN j.min_salary AND j.max_salary
ORDER BY e.employee_id, j.job_id;

SELECT e.employee_id, e.last_name, h.job_id AS former_job
FROM HR.employees AS e
RIGHT OUTER JOIN HR.job_history AS h ON h.employee_id = e.employee_id
-- WHERE e.employee_id = 104;

SELECT e.EMPLOYEE_ID,e.LAST_NAME
    FROM HR.EMPLOYEES e 
        LEFT JOIN
        HR.DEPARTMENTS d ON e.DEPARTMENT_ID=d.DEPARTMENT_ID
    WHERE d.DEPARTMENT_ID IS NULL

SELECT e.EMPLOYEE_ID,e.LAST_NAME,d.DEPARTMENT_NAME,e.DEPARTMENT_ID,d.DEPARTMENT_ID
    FROM HR.EMPLOYEES e 
        LEFT JOIN
        HR.DEPARTMENTS d ON e.EMPLOYEE_ID=d.DEPARTMENT_ID
