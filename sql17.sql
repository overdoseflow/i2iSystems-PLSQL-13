SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE print_day(vd_day IN DATE,
                                    vs_day OUT VARCHAR2)
IS
BEGIN
SELECT TO_CHAR( vd_day, 'DAY') INTO vs_day from dual;
DBMS_OUTPUT.PUT_LINE('DAY IS =>>'||vs_day );
END;
/
DECLARE vs_day VARCHAR2(20);
        vd_day DATE;
        BEGIN
        print_day(sysdate,vd_day);
        END;
        /
        
CREATE OR REPLACE FUNCTION get_day( vd_date IN DATE , vs_date OUT VARCHAR2  )
RETURN DATE 
IS
BEGIN 
SELECT TO_CHAR(vd_date,'DAY') INTO vs_date FROM DUAL;
END get_day;
/

CREATE OR REPLACE PACKAGE staj_utility AS
  PROCEDURE print_day(sysdate);
  FUNCTION get_day(sysdate);
END staj_utility;