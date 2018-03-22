 -- 4�� ���ν��� ���
 
 create or replace procedure pcd_empinfo4
 (p_employee_id IN employees.employee_id%type)  -- employees ���̺� �ִ� employee_id�� ������ Ÿ���� ���±���~
 is
   v_empall   employees%rowtype;
   v_result   varchar2(1000);  -- varchar2�� �ִ�ũ��� 4000byte �ε� �� ���� ������ clob�� ���ش� (4GB)
 begin
     select * into v_empall
     from employees
     where employee_id = p_employee_id;
     
     v_result := v_empall.employee_id || '  ' ||
                 v_empall.first_name || ' ' ||
                 v_empall.last_name || '  ' ||
                 case when substr(v_empall.jubun,7,1) in('1','3') then '��' else '��' end || '  ' || 
                 nvl(v_empall.salary + (v_empall.salary * v_empall.commission_pct), v_empall.salary);   

     dbms_output.put_line( lpad('-',40,'-') ); 
     dbms_output.put_line('�����ȣ   �����  ����  ����'); 
     dbms_output.put_line( lpad('-',40,'-') ); 
     dbms_output.put_line( v_result );
 end;
 
 exec pcd_empinfo4(101);
 
 execute pcd_empinfo4(102); 
 
 exec pcd_empinfo4(103); 

-- 4674