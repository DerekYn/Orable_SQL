 -- 1�� ���ν��� ���
 create or replace procedure pcd_empinfo
 (p_employee_id in number)
 is
     v_empno      number(5);   -- �̰͵��� �������̶� ����� �־��� ����ŭ ������..
     v_ename      varchar2(50);
     v_gender     varchar2(4);
     v_monthsal   number(10);
 begin
     select employee_id,
            first_name || ' ' || last_name,
            case when substr(jubun, 7, 1) in('1', '3')
                     then '��'
                     else '��'
            end,
            nvl(salary + (salary * commission_pct), salary)
        into 
             v_empno, v_ename, v_gender, v_monthsal
     from employees
     where employee_id = p_employee_id;
     
     dbms_output.put_line(lpad('-', 40, '-'));
     dbms_output.put_line('�����ȣ    �����    ����    ����');
     dbms_output.put_line(lpad('-', 40, '-'));
     dbms_output.put_line(
                          v_empno || ' ' ||
                          v_ename || ' ' ||
                          v_gender || ' ' ||
                          v_monthsal
                          );
 end;
 
 exec pcd_empinfo(101);
 
 execute pcd_empinfo(102); 
 
 exec pcd_empinfo(103); 
 
  -- �ӵ��� ������ϰ� ������ ���ν��� ������!!!

-- 4550