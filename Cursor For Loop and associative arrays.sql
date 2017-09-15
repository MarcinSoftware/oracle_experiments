set serveroutput on

declare
  type table_ename is table of employees.last_name%type index by binary_integer;
  type table_dept  is table of employees.department_id%type index by binary_integer;
  Tename table_ename;
  Tdept  table_dept;
  i binary_integer:=0;
  cursor Namedept is select last_name, department_id from employees where employee_id<115;
begin
  -- instead of OPEN, FETCH and CLOSE we can loop through all (but ALL) cursor records using FOR loop in following way
  for emprec in Namedept
  loop
    i:=i+1;
    -- here we can assign value of a cursor's current record into associative arrays, using following syntax
    Tename(i):=emprec.last_name;
    Tdept(i):=emprec.department_id;
    dbms_output.put_line('Employee: ' || Tename(i) || ' is in department number: ' || Tdept(i));
  end loop;
end;