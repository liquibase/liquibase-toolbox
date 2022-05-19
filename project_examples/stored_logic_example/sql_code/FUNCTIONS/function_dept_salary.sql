CREATE OR REPLACE FUNCTION dept_salary (dnum NUMBER) RETURN NUMBER IS
   CURSOR emp_cursor IS
   select salary, commission_pct from EMPLOYEES where department_id = dnum;
   total_wages NUMBER(11, 2) := 0;
   counter NUMBER(10) := 1;
BEGIN
   FOR emp_record IN emp_cursor LOOP
       emp_record.commission_pct := NVL(emp_record.commission_pct, 0);
       total_wages := total_wages + emp_record.salary
                   + emp_record.commission_pct;
       DBMS_OUTPUT.PUT_LINE('Loop number = ' || counter ||
          '; Wages = '|| TO_CHAR(total_wages)); /* Debug line */
       counter := counter + 1; /* Increment debug counter */
   END LOOP;
   /* Debug line */
   DBMS_OUTPUT.PUT_LINE('Total wages = ' ||
   TO_CHAR(total_wages));
   RETURN total_wages;
END;
/
