----------------------------------------------------
           ---- *** PL/SQL *** ----
    Procedure Language / Structured Query Language 
----------------------------------------------------
 
create or replace function func_gender
(p_jubun IN varchar2)
return varchar2
is
   v_result  varchar2(4);
begin
     select case when substr(p_jubun,7,1) in('1','3') 
            then '남' else '여' end
            into v_result 
     from dual;

     return v_result;
end; 
 
  
select employee_id
     , first_name || ' ' || last_name AS ENAME
     , jubun 
     , func_gender(jubun) AS GENDER
from employees; 
 
 
 ----------------------------------------------------
           ---- *** PL/SQL *** ----
             구문에서 변수의 사용법
----------------------------------------------------
 
 execute 또는 exec
 
 exec pcd_empinfo(101);   -- exec pcd_empinfo(사원번호);
 
 exec pcd_empinfo(102);
 
 exec pcd_empinfo(103);
 
 <<결과물>>
 ----------------------------------
 사원번호    사원명     성명     월급
 ----------------------------------
 103          ...       ..     ..
 
 
 create or replace procedure pcd_empinfo
 (p_employee_id in number)
 is
     변수를 선언하는 부분
 begin
     실행해야할 구문절이 들어오는 부분
     각각의 실행문이 끝나면 반드시 ; 을 기입해야한다.
 end;

-- 4510