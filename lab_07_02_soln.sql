set serveroutput on

DECLARE
  TYPE dept_table_type is table of departments.department_name%type INDEX BY PLS_INTEGER;
  my_dept_table dept_table_type;
  f_loop_count number(2):=10;
  v_deptno number(4):=0;
BEGIN
  FOR i IN 1..f_loop_count LOOP
    v_deptno:=v_deptno+10;
    SELECT department_name INTO my_dept_table(i) FROM departments WHERE department_id=v_deptno;
  END LOOP;
  FOR i IN 1..f_loop_count LOOP
    dbms_output.put_line(my_dept_table(i));
  END LOOP;
end;