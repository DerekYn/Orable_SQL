  ----- *** 명시적 CURSOR 만들기 *** -----
  
  ※ 형식
 
    1 단계 => CURSOR 의 선언(정의)
    
           CURSOR 커서명
           IS
            SELECT 문;
            
    2 단계 => CURSOR 의 OPEN
    
            OPEN 커서명;
           
    3 단계 => CURSOR 의 FETCH
              ( FETCH 란? SELECT 되어진 결과물을 끄집어 내는 작업을 말한다. )
            
            FETCH   커서명   INTO   변수;
 
    4 단계 => CURSOR 의 CLOSE
    
           CLOSE 커서명;
 
  ※ ==== 커서의 속성변수 ==== ※
  1. 커서명 % ISOPEN  =>  커서가 OPEN 되어진 상태인가를 체크하는 것.
                         만약에 커서가 OPEN 되어진 상태라면 TRUE.
                         
  2. 커서명 % FOUND   =>  FETCH 된 레코드(행)이 있는지 체크하는 것.
                         만약에 FETCH 된 레코드(행)이 있으면 TRUE.
                         
  3. 커서명 % NOTFOUND  =>  FETCH 된 레코드(행)이 없는지 체크하는 것.
                           만약에 FETCH 된 레코드(행)이 없으면 TRUE.
                           
  4. 커서명 % ROWCOUNT  =>  현재까지 FETCH 된 레코드(행)의 갯수를 반환해줌.                           
 
 
 
 create or replace procedure pcd_empdept
 ( p_department_id   in   employees.department_id%type)
 is
 
    -- 1 단계 => CURSOR 의 선언(정의)
    cursor cur_empinfo
    is
     select E.department_id,
            D.department_name,
            E.employee_id,
            E.first_name || ' ' || E.last_name,
            func_gender(E.jubun),
            E.salary
     from employees E left join departments D
     on E.department_id = D.department_id
     where nvl(E.department_id, -9999) = nvl(p_department_id, -9999);
          
      v_department_id      employees.department_id%type;
      v_department_name    departments.department_name%type;
      v_employee_id        employees.employee_id%type;
      v_ename              varchar2(50);
      v_gender             varchar2(10);
      v_salary             employees.salary%type;
     
 begin 
    -- 2 단계 => CURSOR 의 OPEN
    open cur_empinfo;
       
       dbms_output.put_line( lpad('-', 50, '-') );
       dbms_output.put_line( '부서번호    사원번호    사원명    성명    기본급여' );
       dbms_output.put_line( lpad('-', 50, '-') );
       
    loop
        -- 3 단계 => CURSOR 의 FETCH   
        fetch cur_empinfo 
        into 
            v_department_id,
            v_department_name,
            v_employee_id,
            v_ename,
            v_gender,
            v_salary;
            
        exit when cur_empinfo%notfound;
            
            dbms_output.put_line( 
                                 v_department_id || ' ' ||
                                 v_department_name || ' ' ||
                                 v_employee_id || ' ' ||
                                 v_ename || ' ' ||
                                 v_gender || ' ' ||
                                 v_salary 
                                 );
    end loop;
    if(cur_empinfo%rowcount = 0) then
       dbms_output.put_line('조회하려는 부서번호 ' || p_department_id || '는 존재하지 않습니다.');
    end if;
    
    
     -- 4 단계 => CURSOR 의 CLOSE
    close cur_empinfo;
    
 end;
 
 
  exec pcd_empdept(10);
 
  exec pcd_empdept(null);
 
  exec pcd_empdept(50);

-- 5447