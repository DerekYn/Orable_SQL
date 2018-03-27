--------------------- *** FOR LOOP CURSOR 문 *** ---------------------
 
 --> FOR LOOP CURSOR 문을 사용하면
 -- 커서의 OPEN, FETCH, CLOSE 가 자동적으로 발생되어지기 때문에
 -- 우리는 OPEN, FETCH, CLOSE 문을 기술할 필요가 없다.
 
 ※ 형식
    FOR 변수명(레코드 정보가 담기는 변수) IN 커서명 LOOP
       실행문장;
    END LOOP;
    
 
 
 create or replace procedure pcd_empdept2
 ( p_department_id   in   employees.department_id%type)
 is
 
    -- 1 단계 => CURSOR 의 선언(정의)
    cursor cur_empinfo
    is
     select E.department_id,
            D.department_name,
            E.employee_id,
            E.first_name || ' ' || E.last_name AS ENAME,
            func_gender(E.jubun) AS gender,
            E.salary
     from employees E left join departments D
     on E.department_id = D.department_id
     where nvl(E.department_id, -9999) = nvl(p_department_id, -9999);
     
     v_count     number := 0;
 begin        
       dbms_output.put_line( lpad('-', 50, '-') );
       dbms_output.put_line( '부서번호    사원번호    사원명    성명    기본급여' );
       dbms_output.put_line( lpad('-', 50, '-') );
       
    for rcd in cur_empinfo loop  -- 2 단계
        dbms_output.put_line(
                              rcd.department_id || ' ' ||
                              rcd.department_name || ' ' ||
                              rcd.employee_id || ' ' ||
                              rcd.ENAME || ' ' ||
                              rcd.gender || ' ' ||
                              rcd.salary
                            );
         v_count := v_count + 1;
    end loop;
           
    if(v_count = 0) then
       dbms_output.put_line('조회하려는 부서번호 ' || p_department_id || '는 존재하지 않습니다.');
    else
       dbms_output.put_line('조회하려는 건수는 ' || v_count || '건 입니다.');
    end if;
        
 end;
 
  exec pcd_empdept2(10);
 
  exec pcd_empdept2(null);
 
  exec pcd_empdept2(50);

-- 5511