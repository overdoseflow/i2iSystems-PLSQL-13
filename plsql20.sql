CREATE OR REPLACE PACKAGE PALETTE_PACKAGE IS
PROCEDURE DOTS(count_lines  IN INT );
PROCEDURE SPACES(count_lines  IN INT, total_lines IN INT );
PROCEDURE PALETTE(pin_max_dots IN NUMBER);
END PALETTE_PACKAGE;
CREATE OR REPLACE PACKAGE BODY PALETTE_PACKAGE
IS PROCEDURE DOTS(count_lines  IN INT ) 
IS BEGIN
FOR i IN 1..count_lines
LOOP DBMS_OUTPUT.PUT('*');
END LOOP;
DBMS_OUTPUT.NEW_LINE;
END DOTS;
PROCEDURE SPACES(count_lines  IN INT, total_lines IN INT ) 
IS
BEGIN
FOR i IN 1..total_lines-count_lines
LOOP
DBMS_OUTPUT.PUT(' ');
END LOOP;
END SPACES;
PROCEDURE PALETTE(pin_max_dots IN NUMBER) IS counter INT := 0;
BEGIN WHILE counter < pin_max_dots LOOP
             PALETTE_PACKAGE.SPACES(counter,pin_max_dots);
             PALETTE_PACKAGE.DOTS(2*counter - 1);
             counter := counter + 1;
END LOOP;
counter := 0;
WHILE counter < pin_max_dots
LOOP
PALETTE_PACKAGE.SPACES(pin_max_dots - counter,pin_max_dots);
PALETTE_PACKAGE.DOTS(2*pin_max_dots - 2*counter - 1);
counter := counter + 1;
END LOOP;
END;
END PALETTE_PACKAGE;
BEGIN
palette_package.palette(7);
END;