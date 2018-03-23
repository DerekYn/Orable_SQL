---------------------------------------------------
  �����ȣ  �����   ��������   �μ���ȣ   �μ�Ƽ��
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
   tbl_busiperformance ���̺��� 
   �����ȣ�� �Է¹޾� �ش� ����� ��������(BUSIPERFORM)�� 
   20000 �̻��̸� �μ�Ƽ��� 100 �� �ְ�,
   10000 �̻� 20000 �̸��̸� �μ�Ƽ��� 80 �� �ְ�,
    7000 �̻� 10000 �̸��̸� �μ�Ƽ��� 50 �� �ְ�,
    7000 �̸��̸� �μ�Ƽ��� 0 �� �ֵ���
   insentive �÷��� ���� �����Ͻÿ�.
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
   v_line        varchar2(60) := lpad('-',60,'-');  --        :=     ( ������ �ʱ�ȭ) 
begin
      select count(*) into v_cnt        
      from tbl_busiperformance
      where employee_id = p_employee_id;

      if v_cnt = 0 then
         dbms_output.put_line( v_line );
         dbms_output.put_line( '�Է��Ͻ� �����ȣ '|| p_employee_id ||'�� ������ �������� �ʽ��ϴ�.' ); 
         dbms_output.put_line( v_line );

         return;  -- ����. 
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
      dbms_output.put_line( '�����ȣ  �����  �λ����μ�Ƽ��  �λ����μ�Ƽ��' ); 
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