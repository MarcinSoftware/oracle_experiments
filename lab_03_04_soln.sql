set serveroutput on

declare
  v_today date default sysdate;
  v_tomorrow v_today%type;
begin
  v_tomorrow:=v_today+1;
  dbms_output.put_line('Hello World');
  dbms_output.put_line('TODAY IS: '||v_today);
  dbms_output.put_line('TOMORROW IS: '||v_tomorrow);
end;