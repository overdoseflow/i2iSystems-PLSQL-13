---1---

SELECT employee_id,first_name,last_name,round(months_between(sysdate,hire_date))FROM hr.employees;

---2---

SELECT decode(job_id, 'AD_PRES','A', 0,
job_id, 'ST_MAN','B', 0,
job_id, 'IT_PROG','C', 0,
job_id, 'SA_REP','D', 0,
job_id, 'ST_CLERK','E', 0)grade FROM hr.employees;

---3---

SELECT job_id,
CASE
    WHEN job_id = 'AD_PRES' THEN 'A'
    WHEN job_id = 'ST_MAN' THEN 'B'
    WHEN job_id = 'IT_PROG' THEN 'C'  
    WHEN job_id = 'SA_REP' THEN 'D' 
    WHEN job_id = 'ST_CLERK' THEN 'E'
    ELSE '0'
    END grade
FROM hr.employees;

---4---
SELECT employee_id, last_name FROM hr.employees 
WHERE department_id IN (SELECT department_id FROM hr.employees WHERE last_name LIKE'%i%');

---5---

CREATE TABLE MY_EMP_TABLE AS SELECT salary, first_name
FROM hr.employees e;

UPDATE MY_EMP_TABLE
SET salary = salary*(1.1);

DELETE FROM MY_EMP_TABLE WHERE first_name='David';

SELECT * FROM MY_EMP_TABLE;