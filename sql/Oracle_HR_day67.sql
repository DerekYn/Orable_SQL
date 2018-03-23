 -- *** if ��*** ---
 
 �� ����
 if     ����1  then ���๮��1;
 elsif  ����2  then ���๮��2; 
 else   ���๮��3;
 end if;
 

 2. FOR LOOP ��
 
  �� ����
     FOR ���� IN [REVERSE] ���۰�.. �������� LOOP    -- ������ begin ���� is���� ���� ���������� �ʾƼ� �ڵ������� FOR �� �ȿ��� ����ȴ�.
         ���๮��;                                 -- reverse�� ������������ ���۰��� ���ҵǾ�����.
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
      for i in reverse 1..p_cnt loop  -- ������ 1�� ���� (reverse ������ 1�� ����)
         insert into tbl_forlooptest(no, name)
         values(i, p_name || i);
      end loop;
 end;
 
 exec pcd_forlooptest(20, '����');
 
 select *
 from tbl_forlooptest;
 
 
 3. WHILE LOOP ��
 
  �� ����
  WHILE ���� LOOP
           ��������;
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
        values(v_cnt, '�̼���' || v_cnt);
     end loop;
  end;
 
 exec pcd_whilelooptest('�̼���', 20);
 
 select *
 from tbl_whilelooptest;
 
 commit;

-- 4988