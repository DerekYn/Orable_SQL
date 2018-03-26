----------------------------- 주민번호 공식 ------------------------------
 '9204301249516'
 
 select 9*2 + 2*3 + 0*4 + 4*5 + 3*6 + 0*7 + 1*8 + 2*9 + 4*2 + 9*3 + 5*4 + 1*5
 from dual;  -- 148
 
 select mod(148, 11) from dual;  -- 5
 
 select 11-5 from dual;   -- 6
 
 select mod(6, 10) from dual;  -- 6 요게 주민번호 마지막 글자가 된다.

 
 create or replace function func_jubuncheck
 (p_jubun  in  varchar2)
 return number                              -- 공식에 맞으면 1, 틀리면 0
 is
     v_sum     number := 0;
     v_check   number(1);
     v_result  number(1);
 begin
     for i in 1..12 loop
       if(i < 9) then
          v_sum := v_sum + to_number(substr(p_jubun, i, 1)) * (i + 1);
       else
          v_sum := v_sum + to_number(substr(p_jubun, i, 1)) * (i - 7);
       end if;
     end loop;
     
     v_check := mod(11 - mod(v_sum, 11), 10);
     
     if( v_check = to_number(substr(p_jubun, 13, 1)) ) then 
          v_result := 1;
     else
          v_result := 0;
     end if;
     
     return v_result;
     
 end;
 
 select fun_jubuncheck('9204301249516')
 from dual;
 




 select ascii('A'), ascii('a'),
        ascii('0'), ascii('9'),
        ascii('!'), ascii('@'),
        ascii('#'), ascii('$'),
        ascii('%'), ascii(substr('q', 1, 1))
 from dual;
 
 select chr(65), chr(97),
        chr(48), chr(57),
        ascii(substr('z', 1, 1))
 from dual;
 
 
 -- 문자열을 입력받아 문자열의 길이는 8글자 이상 20글자 이하이어야 하고,
 -- 구성된 문자열이 영문자, 숫자, 특수기호(! @ # $ %)가 혼합되어져 있으면 리턴값은 1, 아니면 0

-- 5052