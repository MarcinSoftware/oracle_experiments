SET serveroutput ON

CREATE PROCEDURE greet(p_name varchar2) IS
  v_today DATE:=SYSDATE;
  v_tomorrow v_today%TYPE;
BEGIN
  v_tomorrow:=v_today+1;
  DBMS_OUTPUT.PUT_LINE ('Hello ' || p_name);
  DBMS_OUTPUT.PUT_LINE ('TODAY IS : ' || v_today);
  DBMS_OUTPUT.PUT_LINE ('TOMORROW IS : ' || v_tomorrow);
END;