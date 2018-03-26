 create or replace function func_passwdcheck
 ( p_pw   in   varchar2 )
 return number
 is 
   v_numberflag    number(1) := 0;
   v_charflag      number(1) := 0;
   v_specialflag   number(1) := 0;
 begin
   if( 8 <= length(p_pw) and length(p_pw) <= 20) then
      for i in 1..length(p_pw) loop
        if( ascii('A') <= ascii(upper(substr(p_pw, i, 1))) and ascii(upper(substr(p_pw, i, 1))) <= ascii('Z') ) then
           v_charflag := 1;
        elsif( ascii('0') <= ascii(substr(p_pw, i, 1)) and ascii(substr(p_pw, i, 1)) <= ascii('9') ) then
           v_numberflag := 1;
        elsif( ascii(substr(p_pw, i, 1)) in(ascii('!'), ascii('@'), ascii('#'), ascii('$'),ascii('%') )) then 
           v_specialflag := 1;
        end if;
      end loop;
   end if;
   
   if( v_charflag + v_numberflag + v_specialflag  = 3 ) then 
          return 1;
     else
          return 0;
     end if;
     
 end;
 
 select fun_passwdcheck('asdfqwer1234')
 from dual;

-- 5084