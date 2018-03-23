 ----- *** �ݺ��� *** -----
 
 create table tbl_looptest
 (
    no      number,
    name    varchar2(50)
 );
 
 1. �⺻ LOOP �� 
 
   �� ����
      LOOP
          ���๮��;
      EXIT WHEN ����;   -- ������ ���̶�� LOOP Ż��.
      END LOOP;
      
  exec pcd_looptest('������', 10);
  
  create or replace procedure pcd_looptest
  ( p_name     in   varchar2,
    p_count    in   number  )
  is
      v_cnt number := 0;   -- �ʱⰪ�� null �̶� 0���� �ʱ�ȭ ���ش�.  
  begin
       loop
           v_cnt := v_cnt + 1;
       exit when v_cnt > p_count;
            insert into tbl_looptest(no, name)
            values(v_cnt, p_name || v_cnt);
       end loop;
       
       commit;
  
  end pcd_looptest;         -- �̸��� ��������
  
 select *
 from tbl_looptest;
 
 
 -----------------------------------------------------------------------
 -- 1���� 10������ ��
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
   
   dbms_output.put_line(p_first || ' ���� ' || p_second || '������ ���� ' || v_sum || '�Դϴ�.');
   
   commit;
   
 end;

  exec pcd_sum(1, 10);
  
 -----------------------------------------------------------------------
 -- 1���� 10���� ¦���� ��
 
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
    
    dbms_output.put_line(p_first || ' ���� ' || p_second || '���� ¦���� ���� ' || v_sum || '�Դϴ�.');
    
    commit;
 
 end;
 
  exec pcd_sum_even(1, 10);


  -----------------------------------------------------------------------
 -- 1���� 10���� Ȧ���� ��
 
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
    
    dbms_output.put_line(p_first || ' ���� ' || p_second || '���� Ȧ���� ���� ' || v_sum || '�Դϴ�.');
    
    commit;
 
 end;
 
   exec pcd_sum_odd(1, 10);

-- 4911