----------------------------- �ֹι�ȣ ���� ------------------------------
 '9204301249516'
 
 select 9*2 + 2*3 + 0*4 + 4*5 + 3*6 + 0*7 + 1*8 + 2*9 + 4*2 + 9*3 + 5*4 + 1*5
 from dual;  -- 148
 
 select mod(148, 11) from dual;  -- 5
 
 select 11-5 from dual;   -- 6
 
 select mod(6, 10) from dual;  -- 6 ��� �ֹι�ȣ ������ ���ڰ� �ȴ�.

 
 create or replace function func_jubuncheck
 (p_jubun  in  varchar2)
 return number                              -- ���Ŀ� ������ 1, Ʋ���� 0
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
 
 
 -- ���ڿ��� �Է¹޾� ���ڿ��� ���̴� 8���� �̻� 20���� �����̾�� �ϰ�,
 -- ������ ���ڿ��� ������, ����, Ư����ȣ(! @ # $ %)�� ȥ�յǾ��� ������ ���ϰ��� 1, �ƴϸ� 0

-- 5052