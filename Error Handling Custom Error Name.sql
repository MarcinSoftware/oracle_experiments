set serveroutput on

DECLARE
  my_exception EXCEPTION;
  PRAGMA EXCEPTION_INIT(my_exception, -01422);
  v_ename     employees.last_name%type;
  v_emp_sal   employees.salary%type:=6000;
BEGIN
  SELECT last_name
  INTO   v_ename
  FROM employees
  WHERE salary=v_emp_sal;
  dbms_output.put_line(v_ename || ' - ' || v_emp_sal);
EXCEPTION
  WHEN no_data_found THEN
    dbms_output.put_line('No employee with a salary of ' || TO_CHAR(v_emp_sal));
  WHEN my_exception THEN
    dbms_output.put_line('More than one employee with a salary of ' || TO_CHAR(v_emp_sal));
  WHEN others THEN
    dbms_output.put_line('Some other error ocurred.');
END;

/*  When we define something as EXCEPTION, we can use the own name for specific error identifier. For this purpose we then
    define it in PRAGMA statement. Then in EXCEPTION statement we can use name defined by us.   */