CREATE OR REPLACE DIRECTORY DIR2 AS '/u01/app/oracle/test';


DECLARE
    e_id HR.EMPLOYEES.EMPLOYEE_ID%TYPE;
    e_first_name HR.EMPLOYEES.FIRST_NAME%TYPE;
    e_last_name HR.EMPLOYEES.LAST_NAME%TYPE;
    e_department_name HR.DEPARTMENTS.DEPARTMENT_NAME%TYPE;
CURSOR --!!!--
    c_customers 
IS 
SELECT 
    e.employee_id, 
    e.first_name, 
    e.last_name, 
    d.department_name 
FROM 
    HR.EMPLOYEES e 
INNER JOIN 
    HR.DEPARTMENTS d 
ON 
    e.department_id = d.department_id; 
  fileHandler UTL_FILE.FILE_TYPE;
  
BEGIN
    fileHandler := UTL_FILE.FOPEN('DIR', 'employees.txt', 'W', 500);
OPEN --!!--
    c_customers;
LOOP
FETCH 
    c_customers
INTO  
    e_id, 
    e_first_name; 
    e_last_name;
    e_department_name; 
EXIT WHEN 
    c_customers%notfound; 
  
  UTL_FILE.PUTF(fileHandler, 'ID-> ' || e_id || '\n' || 
                             ' Name-> ' || e_first_name|| '\n' || 
                             ' Surname-> ' || e_last_name|| '\n' || 
                             ' Department-> ' || e_department_name|| '\n\n\n');
END LOOP;
CLOSE 
    c_customers;
  UTL_FILE.FCLOSE(fileHandler);
EXCEPTION
WHEN 
    utl_file.invalid_path 
THEN
     raise_application_error(-20000, 'ERROR: Invalid PATH FOR file.');
END;
/