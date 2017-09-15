set serveroutput on

declare
  e_due_for_raise exception;
  -- declaring exception, but not using pragma - this is not an error in the PL/SQL, but our own exception
  v_hiredate employees.hire_date%type;
  v_ename employees.last_name%type:=initcap('& b_ename');
  v_sal employees.salary%type;
  v_years number(2);
begin
  select salary, hire_date, months_between(sysdate,hire_date)/12 years
  into v_sal, v_hiredate, v_years
  from employees
  where last_name=v_ename;
  if v_sal < 3500 and v_years > 5 then
    raise e_due_for_raise;
    -- here we raise our exception - we could put a code to do stuff here, but it's below in EXCEPTION block
  else
    dbms_output.put_line(v_ename|| ' not due for a raise');
  end if;
-- exception block and handling our error
exception
  when e_due_for_raise then
  -- using our name
  begin
    dbms_output.put_line(v_ename || ' due for a raise');
    insert into analysis(ename, years, sal) values (v_ename, v_years, v_sal);
  end;
end;
/
select * from analysis