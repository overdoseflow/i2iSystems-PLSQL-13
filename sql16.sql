CREATE OR REPLACE FUNCTION get_day( vd_date IN DATE , vs_date OUT VARCHAR2  )
RETURN DATE 
IS
BEGIN 
SELECT TO_CHAR(vd_date,'DAY') INTO vs_date FROM DUAL;
END get_day;
/