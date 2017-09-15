SET serveroutput ON;

DECLARE
  v_deptno departments.department_id%type:=&p_deptno;
  -- in order for program to ask for variable value, we need to include '&' before variable name
  v_emp_count number(3);
BEGIN
  SELECT COUNT(*) INTO v_emp_count FROM EMPLOYEES WHERE DEPARTMENT_ID=v_deptno;
  -- The upper statement is correct for inserting values into PL/SQL variables. The below is correct for inserting them into table, 
  -- not into variable.
  --INSERT INTO v_emp_count SELECT COUNT(EMPLOYEE_ID) FROM EMPLOYEES WHERE DEPARTMENT_ID=v_deptno;
  DBMS_OUTPUT.PUT_LINE(v_emp_count || ' employee(s) work for department number ' || v_deptno);
END;
