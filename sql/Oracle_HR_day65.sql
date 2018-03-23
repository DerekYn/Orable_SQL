---------------------------------------------------
  사원번호  사원명   업무실적   부서번호   인센티브
 ---------------------------------------------------
 create table tbl_busiperformance
 as
 select  employee_id
       , first_name || ' ' || last_name AS ENAME
       , salary AS BUSIPERFORM
       , department_id
       , 0 AS INSENTIVE
 from employees;
 
 desc tbl_busiperformance;
 
 select *
 from tbl_busiperformance;
 
 /*
   tbl_busiperformance 테이블에서 
   사원번호를 입력받아 해당 사원의 업무실적(BUSIPERFORM)이 
   20000 이상이면 인센티브로 100 을 주고,
   10000 이상 20000 미만이면 인센티브로 80 을 주고,
    7000 이상 10000 미만이면 인센티브로 50 을 주고,
    7000 미만이면 인센티브로 0 을 주도록
   insentive 컬럼의 값을 변경하시오.
*/

create or replace procedure pcd_insentive
(p_employee_id  IN  tbl_busiperformance.employee_id%type)
is
   v_cnt               number(1);
   v_insentive         number(3);
   v_ename             tbl_busiperformance.ename%type; 
   v_busiperform       tbl_busiperformance.busiperform%type; 
   v_before_insentive  tbl_busiperformance.insentive%type;
   v_after_insentive   tbl_busiperformance.insentive%type;
   v_line        varchar2(60) := lpad('-',60,'-');  --        :=     ( 변수의 초기화) 
begin
      select count(*) into v_cnt        
      from tbl_busiperformance
      where employee_id = p_employee_id;

      if v_cnt = 0 then
         dbms_output.put_line( v_line );
         dbms_output.put_line( '입력하신 사원번호 '|| p_employee_id ||'번 직원은 존재하지 않습니다.' ); 
         dbms_output.put_line( v_line );

         return;  -- 종결. 
      end if;

      select ename, busiperform, insentive
          into
             v_ename, v_busiperform, v_before_insentive 
      from tbl_busiperformance
      where employee_id = p_employee_id;

      if    v_busiperform >= 20000 then v_insentive := 100;
      elsif v_busiperform >= 10000 then v_insentive :=  80;
      elsif v_busiperform >=  7000 then v_insentive :=  50;
      else  v_insentive := 0; 
      end if;

      update tbl_busiperformance set insentive = insentive + v_insentive 
      where employee_id = p_employee_id;

      -- commit;

      select insentive 
          into 
             v_after_insentive
      from tbl_busiperformance
      where employee_id = p_employee_id;

      dbms_output.put_line( v_line );
      dbms_output.put_line( '사원번호  사원명  인상전인센티브  인상후인센티브' ); 
      dbms_output.put_line( v_line );
      dbms_output.put_line( p_employee_id || '   ' ||
                            v_ename || '    '||
                            v_before_insentive || '  ' ||
                            v_after_insentive ); 

end pcd_insentive;

 select *
 from tbl_busiperformance
 where employee_id = 101;


 exec pcd_insentive(101);

-- 4797