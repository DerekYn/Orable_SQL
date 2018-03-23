 ----- *** 반복문 *** -----
 
 create table tbl_looptest
 (
    no      number,
    name    varchar2(50)
 );
 
 1. 기본 LOOP 문 
 
   ※ 형식
      LOOP
          실행문장;
      EXIT WHEN 조건;   -- 조건이 참이라면 LOOP 탈출.
      END LOOP;
      
  exec pcd_looptest('전지현', 10);
  
  create or replace procedure pcd_looptest
  ( p_name     in   varchar2,
    p_count    in   number  )
  is
      v_cnt number := 0;   -- 초기값은 null 이라 0으로 초기화 해준다.  
  begin
       loop
           v_cnt := v_cnt + 1;
       exit when v_cnt > p_count;
            insert into tbl_looptest(no, name)
            values(v_cnt, p_name || v_cnt);
       end loop;
       
       commit;
  
  end pcd_looptest;         -- 이름은 생략가능
  
 select *
 from tbl_looptest;
 
 
 -----------------------------------------------------------------------
 -- 1부터 10까지의 합
 create or replace procedure pcd_sum
 ( p_first in number, p_second in number )
 is
     v_sum number := 0;
     v_cnt number := p_first;
 begin
   loop 
      v_sum := v_sum + v_cnt;
      v_cnt := v_cnt + 1;
   exit when v_cnt > p_second;     
   end loop;
   
   dbms_output.put_line(p_first || ' 부터 ' || p_second || '까지의 합은 ' || v_sum || '입니다.');
   
   commit;
   
 end;

  exec pcd_sum(1, 10);
  
 -----------------------------------------------------------------------
 -- 1부터 10까지 짝수의 합
 
 create or replace procedure pcd_sum_even
  ( p_first in number, p_second in number )
 is
   v_sum number := 0;
   v_cnt number := p_first;
 begin
    loop
       if mod(v_cnt, 2) = 0 then v_sum := v_sum + v_cnt;
       end if;
       v_cnt := v_cnt + 1;

    exit when v_cnt > p_second;
    end loop;
    
    dbms_output.put_line(p_first || ' 부터 ' || p_second || '까지 짝수의 합은 ' || v_sum || '입니다.');
    
    commit;
 
 end;
 
  exec pcd_sum_even(1, 10);


  -----------------------------------------------------------------------
 -- 1부터 10까지 홀수의 합
 
 create or replace procedure pcd_sum_odd
 ( p_first in number, p_second in number )
 is
   v_sum number := 0;
   v_cnt number := p_first;
 begin
    loop
       if mod(v_cnt, 2) != 0 then v_sum := v_sum + v_cnt;
       end if;
       v_cnt := v_cnt + 1;

    exit when v_cnt > p_second;
    end loop;
    
    dbms_output.put_line(p_first || ' 부터 ' || p_second || '까지 홀수의 합은 ' || v_sum || '입니다.');
    
    commit;
 
 end;
 
   exec pcd_sum_odd(1, 10);

-- 4911