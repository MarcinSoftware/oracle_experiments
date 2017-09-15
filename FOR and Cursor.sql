set serveroutput on

DECLARE
  v_deptno    number:=10;
  CURSOR c_emp_cursor IS
    SELECT    last_name, salary, manager_id
    FROM      employees
    WHERE     department_id=v_deptno;
BEGIN
-- we can loop through cursor records without fetching them straight to variables
-- in this case we loop through using FOR statement and take action only when certain condition for cursor data is met
  FOR emp_record IN c_emp_cursor
  -- LOOP should be in separate line for FOR statement, as we may want to include some code here,
  -- which we do not want to loop through
  LOOP
    IF emp_record.salary<5000 AND (emp_record.manager_id=101 OR emp_record.manager_id=124) THEN
      DBMS_OUTPUT.PUT_LINE (emp_record.last_name || ' Due for a raise');
    ELSE
      DBMS_OUTPUT.PUT_LINE (emp_record.last_name || ' Not Due for a raise');
    END IF;
  END LOOP;
END;