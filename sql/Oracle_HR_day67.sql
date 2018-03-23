 -- *** if 문*** ---
 
 ※ 형식
 if     조건1  then 실행문장1;
 elsif  조건2  then 실행문장2; 
 else   실행문장3;
 end if;
 

 2. FOR LOOP 문
 
  ※ 형식
     FOR 변수 IN [REVERSE] 시작값.. 마지막값 LOOP    -- 변수는 begin 이전 is에서 따로 선언해주지 않아서 자동적으로 FOR 문 안에서 선언된다.
         실행문장;                                 -- reverse는 마지막값에서 시작값이 감소되어진다.
     END LOOP;
 
  create table tbl_forlooptest
 (
    no      number,
    name    varchar2(50)
 );
 
 create or replace procedure pcd_forlooptest
 (
   p_cnt   in  tbl_forlooptest.no%type,
   p_name in  tbl_forlooptest.name%type
 )
 IS
 begin
      for i in reverse 1..p_cnt loop  -- 무조건 1씩 감소 (reverse 없으면 1씩 증가)
         insert into tbl_forlooptest(no, name)
         values(i, p_name || i);
      end loop;
 end;
 
 exec pcd_forlooptest(20, '원빈');
 
 select *
 from tbl_forlooptest;
 
 
 3. WHILE LOOP 문
 
  ※ 형식
  WHILE 조건 LOOP
           실행조건;
  END LOOP;
  
  create table tbl_whilelooptest
  (
      no      number,
      name    varchar2(50)
  );
  
  create or replace procedure pcd_whilelooptest
  (
     p_name    in    varchar2,
     p_count   in    number
  )
  is
     v_cnt   number := 0;
  begin
     while not( v_cnt >= p_count ) loop
        v_cnt := v_cnt + 1;
        insert into tbl_whilelooptest(no, name)
        values(v_cnt, '이순신' || v_cnt);
     end loop;
  end;
 
 exec pcd_whilelooptest('이순신', 20);
 
 select *
 from tbl_whilelooptest;
 
 commit;

-- 4988