set serveroutput on

--variable b_basic_percent number;
--variable b_pf_percent number;

declare
--  v_today date default sysdate;
--  v_tomorrow v_today%type;
  v_basic_percent number:=45;
  v_pf_percent number:=12;
  v_fname varchar2(15);
  v_emp_sal number(10);
begin
/*  :b_basic_percent:=45;
  :b_pf_percent:=12; */
  SELECT first_name, salary INTO v_fname, v_emp_sal
  FROM employees WHERE employee_id=110;
--  v_tomorrow:=v_today+1;
  dbms_output.put_line('Hello ' || v_fname);
  dbms_output.put_line('YOUR SALARY IS : ' || v_emp_sal);
  dbms_output.put_line('YOUR CONTRIBUTION IS : ' || v_emp_sal*v_basic_percent/100*v_pf_percent/100);
--  dbms_output.put_line('TODAY IS: '||v_today);
--  dbms_output.put_line('TOMORROW IS: '||v_tomorrow);
end;
/
--print;