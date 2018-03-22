 -- 4번 프로시저 방법
 
 create or replace procedure pcd_empinfo4
 (p_employee_id IN employees.employee_id%type)  -- employees 테이블에 있는 employee_id의 데이터 타입을 쓰는구나~
 is
   v_empall   employees%rowtype;
   v_result   varchar2(1000);  -- varchar2의 최대크기는 4000byte 인데 더 쓰고 싶으면 clob을 써준다 (4GB)
 begin
     select * into v_empall
     from employees
     where employee_id = p_employee_id;
     
     v_result := v_empall.employee_id || '  ' ||
                 v_empall.first_name || ' ' ||
                 v_empall.last_name || '  ' ||
                 case when substr(v_empall.jubun,7,1) in('1','3') then '남' else '여' end || '  ' || 
                 nvl(v_empall.salary + (v_empall.salary * v_empall.commission_pct), v_empall.salary);   

     dbms_output.put_line( lpad('-',40,'-') ); 
     dbms_output.put_line('사원번호   사원명  성별  월급'); 
     dbms_output.put_line( lpad('-',40,'-') ); 
     dbms_output.put_line( v_result );
 end;
 
 exec pcd_empinfo4(101);
 
 execute pcd_empinfo4(102); 
 
 exec pcd_empinfo4(103); 

-- 4674