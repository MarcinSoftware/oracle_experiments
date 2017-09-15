set serveroutput on

declare
  v_empno emp.employee_id%type:=176;
  v_asterisk emp.stars%type:=null;
  v_seq number(2);
begin
  SELECT nvl(round(salary/1000),0) INTO v_seq FROM emp WHERE employee_id=v_empno;
  for i in 1..v_seq loop
    v_asterisk:=v_asterisk || '*';
  end loop;
  UPDATE emp SET stars=v_asterisk WHERE employee_id=v_empno;
  commit;
  dbms_output.put_line(v_asterisk);
end;
/
SELECT employee_id, salary, stars FROM emp WHERE employee_id=176;