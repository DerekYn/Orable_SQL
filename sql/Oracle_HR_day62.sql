 ---------------------------------------------------------------------
 
 -- 3�� ���ν��� ���
 
 create or replace procedure pcd_empinfo3
 (p_employee_id in employees.employee_id%type)  -- employees ���̺� �ִ� employee_id�� ������ Ÿ���� ���±���~
 is
     -- record Ÿ�� ����
     type myemptype
     is record
     (
       empno     employees.employee_id%type,
       ename     varchar2(50),
       gender    varchar2(10),
       monthsal  number(10)     
      );
      
      v_emprcd  myemptype;
 begin
     select employee_id,
            first_name || ' ' || last_name,
            case when substr(jubun, 7, 1) in('1', '3')
                     then '��'
                     else '��'
            end,
            nvl(salary + (salary * commission_pct), salary)
        into 
             v_emprcd
     from employees
     where employee_id = p_employee_id;
     
     dbms_output.put_line(lpad('-', 40, '-'));
     dbms_output.put_line('�����ȣ    �����    ����    ����');
     dbms_output.put_line(lpad('-', 40, '-'));
     dbms_output.put_line(
                          v_emprcd.empno || ' ' ||
                          v_emprcd.ename || ' ' ||
                          v_emprcd.gender || ' ' ||
                          v_emprcd.monthsal
                          );
 end;
 
  exec pcd_empinfo3(101);
 
 execute pcd_empinfo3(102); 
 
 exec pcd_empinfo3(103); 

-- 4640