----------------------------------------------------
           ---- *** PL/SQL *** ----
    Procedure Language / Structured Query Language 
----------------------------------------------------
 
create or replace function func_gender
(p_jubun IN varchar2)
return varchar2
is
   v_result  varchar2(4);
begin
     select case when substr(p_jubun,7,1) in('1','3') 
            then '��' else '��' end
            into v_result 
     from dual;

     return v_result;
end; 
 
  
select employee_id
     , first_name || ' ' || last_name AS ENAME
     , jubun 
     , func_gender(jubun) AS GENDER
from employees; 
 
 
 ----------------------------------------------------
           ---- *** PL/SQL *** ----
             �������� ������ ����
----------------------------------------------------
 
 execute �Ǵ� exec
 
 exec pcd_empinfo(101);   -- exec pcd_empinfo(�����ȣ);
 
 exec pcd_empinfo(102);
 
 exec pcd_empinfo(103);
 
 <<�����>>
 ----------------------------------
 �����ȣ    �����     ����     ����
 ----------------------------------
 103          ...       ..     ..
 
 
 create or replace procedure pcd_empinfo
 (p_employee_id in number)
 is
     ������ �����ϴ� �κ�
 begin
     �����ؾ��� �������� ������ �κ�
     ������ ���๮�� ������ �ݵ�� ; �� �����ؾ��Ѵ�.
 end;

-- 4510