set serveroutput on

DECLARE
  v_ename     employees.last_name%type;
  v_emp_sal   employees.salary%type:=24000;
BEGIN
  SELECT last_name
  INTO   v_ename
  FROM employees
  WHERE salary=v_emp_sal;
  dbms_output.put_line(v_ename || ' - ' || v_emp_sal);
EXCEPTION
  WHEN no_data_found THEN
    dbms_output.put_line('No employee with a salary of ' || TO_CHAR(v_emp_sal));
  WHEN too_many_rows THEN
    dbms_output.put_line('More than one employee with a salary of ' || TO_CHAR(v_emp_sal));
  WHEN others THEN
    dbms_output.put_line('Some other error ocurred.');
END;