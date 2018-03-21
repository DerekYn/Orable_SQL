 ---------------------------------------------------------------------
 
 -- 2번 프로시저 방법
 
 create or replace procedure pcd_empinfo2
 (p_employee_id in employees.employee_id%type)  -- employees 테이블에 있는 employee_id의 데이터 타입을 쓰는구나~
 is
     v_empno      employees.employee_id%type;  
     v_ename      varchar2(50);
     v_gender     varchar2(4);   -- 이것들은 가변형이라 사실은 넣어준 값만큼 설정됨..
     v_monthsal   number(10);
 begin
     select employee_id,
            first_name || ' ' || last_name,
            case when substr(jubun, 7, 1) in('1', '3')
                     then '남'
                     else '여'
            end,
            nvl(salary + (salary * commission_pct), salary)
        into 
             v_empno, v_ename, v_gender, v_monthsal
     from employees
     where employee_id = p_employee_id;
     
     dbms_output.put_line(lpad('-', 40, '-'));
     dbms_output.put_line('사원번호    사원명    성별    월급');
     dbms_output.put_line(lpad('-', 40, '-'));
     dbms_output.put_line(
                          v_empno || ' ' ||
                          v_ename || ' ' ||
                          v_gender || ' ' ||
                          v_monthsal
                          );
 end;
 
 exec pcd_empinfo2(101);
 
 execute pcd_empinfo2(102); 
 
 exec pcd_empinfo2(103); 

-- 4591