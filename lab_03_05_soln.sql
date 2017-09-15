set serveroutput on

variable b_basic_percent number;
variable b_pf_percent number;

declare
  v_today date default sysdate;
  v_tomorrow v_today%type;
begin
  :b_basic_percent:=45;
  :b_pf_percent:=12;
  v_tomorrow:=v_today+1;
  dbms_output.put_line('Hello World');
  dbms_output.put_line('TODAY IS: '||v_today);
  dbms_output.put_line('TOMORROW IS: '||v_tomorrow);
end;
/
print;