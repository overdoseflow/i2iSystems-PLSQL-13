SET SERVEROUTPUT ON
CREATE DIRECTORY test_dir AS '/u01/app/oracle/test_dir';
CREATE OR REPLACE PROCEDURE finding_rich(pis_id OUT HR.EMPLOYEES.EMPLOYEE_ID % TYPE,
                                    pis_name OUT HR.EMPLOYEES.FIRST_NAME % TYPE,
                                    pis_salary OUT HR.EMPLOYEES.SALARY % TYPE)
IS
BEGIN
SELECT EMPLOYEE_ID,FIRST_NAME,SALARY INTO pis_id,pis_name,pis_salary
FROM HR.EMPLOYEES
WHERE SALARY=(SELECT MAX(SALARY) FROM HR.EMPLOYEES);
    DBMS_OUTPUT.PUT_LINE('Name of Richest Employee  in Company =>>'||pis_name );
    DBMS_OUTPUT.PUT_LINE('Salary of Richest Employee  in Company =>> '||pis_salary );
    DBMS_OUTPUT.PUT_LINE('Salary of Richest Employee  in Company=>> '|| 5*pis_salary );
    vInFileTxt := utl_file.fopen('test_dir', 'test.txt', 'w');
 

  utl_file.put_line(vInFileTxt, q'[Hi I'm writing something here]');
  utl_file.put_line(vInFileTxt, 'Name of Richest Employee  in Company =>>'||pis_name );
  utl_file.put_line(vInFileTxt, 'Salary of Richest Employee  in Company =>> '||pis_salary);
  utl_file.put_line(vInFileTxt, 'Salary of Richest Employee  in Company=>> '|| 5*pis_salary  );
  utl_file.fclose(vInFileTxt);
  
END;
/

DECLARE pis_id HR.EMPLOYEES.EMPLOYEE_ID % TYPE;
        pis_name HR.EMPLOYEES.FIRST_NAME % TYPE;
        pis_salary HR.EMPLOYEES.SALARY % TYPE;
         vInFileTxt utl_file.file_type;
        
        BEGIN
        finding_rich(pis_id,pis_name,pis_salary);
        END;
        /

