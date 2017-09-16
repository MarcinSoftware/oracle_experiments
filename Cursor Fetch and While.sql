set serveroutput on

DECLARE
  v_num     number(3):=5;
  v_sal     employees.salary%type;
  v_seq     number(2):=1;
  CURSOR c_emp_cursor IS
    SELECT salary
    FROM employees
    ORDER BY salary DESC;
BEGIN
  OPEN c_emp_cursor;
  /* if we wanted to loop though all records in cursor, we could place LOOP here, then we could have conditions.
     each time we place FETCH statement, we go to next row in cursor.
     Here we fetch first, because we want to control cursos from beginning and check processed row number.
     That's the reason why we place LOOP after WHILE statement - because we loop and fetch next only when condition is met
     (otherwise we would fetch anyway and based on conditionwe would perform further procedures, but it would take longer).
     We need to fetch at the end of LOOP, to check it against condition at the beginning. If condition not met, LOOP is ended
     and procedure as well. */
  FETCH c_emp_cursor INTO v_sal;
  WHILE c_emp_cursor%rowcount <= v_num AND c_emp_cursor%FOUND LOOP
    DBMS_OUTPUT.PUT_LINE('Number ' || v_seq || ' salary is ' || v_sal);
    FETCH c_emp_cursor INTO v_sal; --
    v_seq:=v_seq+1;
  END LOOP;
  CLOSE c_emp_cursor;
END;



