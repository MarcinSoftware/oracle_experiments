set serveroutput on

declare
  v_max_deptno  number;
  v_dept_id     number;
  v_dept_name   departments.department_name%type default 'Education';
  
begin
  SELECT MAX(department_id)+10 INTO v_max_deptno FROM departments;
  INSERT INTO departments (department_id, department_name, location_id) VALUES (v_max_deptno, v_dept_name, null);
  dbms_output.put_line('SQL affected ' || SQL%ROWCOUNT || ' row(s)');
 -- dbms_output.put_line('The maximum department_id is : ' || v_max_deptno);
end;
/
SELECT * FROM departments WHERE department_id=(SELECT MAX(department_id) FROM departments);