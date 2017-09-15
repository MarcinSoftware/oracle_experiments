set serveroutput on

declare
  v_max_deptno  number;
begin
  SELECT MAX(department_id) INTO v_max_deptno FROM departments;
  dbms_output.put_line('The maximum department_id is : ' || v_max_deptno);
end;
