set serveroutput on

declare
  v_emp_name    employees.last_name%type;
  v_emp_sal     employees.salary%type;
  v_emp_hire    date;
  cursor  c_emp_cur   is
  SELECT last_name, salary, hire_date FROM employees;
begin
  open c_emp_cur;
  fetch c_emp_cur into v_emp_name, v_emp_sal, v_emp_hire;
  -- we fetch first before we loop and in while clause we check whether there is a value
  while c_emp_cur%found
  loop
    if v_emp_sal>15000 and v_emp_hire >= TO_DATE('01-02-88','DD-MM-RR') then
      dbms_output.put_line(v_emp_name || ' earns ' || v_emp_sal || ' and joined the organization on ' || v_emp_hire);
    end if;
    fetch c_emp_cur into v_emp_name, v_emp_sal, v_emp_hire;
    -- we need to fetch here, so that next loop has something to work on (and it's next value)
  end loop;
  close c_emp_cur;
end;
