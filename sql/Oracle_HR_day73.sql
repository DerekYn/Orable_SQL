  ----- *** ����� CURSOR ����� *** -----
  
  �� ����
 
    1 �ܰ� => CURSOR �� ����(����)
    
           CURSOR Ŀ����
           IS
            SELECT ��;
            
    2 �ܰ� => CURSOR �� OPEN
    
            OPEN Ŀ����;
           
    3 �ܰ� => CURSOR �� FETCH
              ( FETCH ��? SELECT �Ǿ��� ������� ������ ���� �۾��� ���Ѵ�. )
            
            FETCH   Ŀ����   INTO   ����;
 
    4 �ܰ� => CURSOR �� CLOSE
    
           CLOSE Ŀ����;
 
  �� ==== Ŀ���� �Ӽ����� ==== ��
  1. Ŀ���� % ISOPEN  =>  Ŀ���� OPEN �Ǿ��� �����ΰ��� üũ�ϴ� ��.
                         ���࿡ Ŀ���� OPEN �Ǿ��� ���¶�� TRUE.
                         
  2. Ŀ���� % FOUND   =>  FETCH �� ���ڵ�(��)�� �ִ��� üũ�ϴ� ��.
                         ���࿡ FETCH �� ���ڵ�(��)�� ������ TRUE.
                         
  3. Ŀ���� % NOTFOUND  =>  FETCH �� ���ڵ�(��)�� ������ üũ�ϴ� ��.
                           ���࿡ FETCH �� ���ڵ�(��)�� ������ TRUE.
                           
  4. Ŀ���� % ROWCOUNT  =>  ������� FETCH �� ���ڵ�(��)�� ������ ��ȯ����.                           
 
 
 
 create or replace procedure pcd_empdept
 ( p_department_id   in   employees.department_id%type)
 is
 
    -- 1 �ܰ� => CURSOR �� ����(����)
    cursor cur_empinfo
    is
     select E.department_id,
            D.department_name,
            E.employee_id,
            E.first_name || ' ' || E.last_name,
            func_gender(E.jubun),
            E.salary
     from employees E left join departments D
     on E.department_id = D.department_id
     where nvl(E.department_id, -9999) = nvl(p_department_id, -9999);
          
      v_department_id      employees.department_id%type;
      v_department_name    departments.department_name%type;
      v_employee_id        employees.employee_id%type;
      v_ename              varchar2(50);
      v_gender             varchar2(10);
      v_salary             employees.salary%type;
     
 begin 
    -- 2 �ܰ� => CURSOR �� OPEN
    open cur_empinfo;
       
       dbms_output.put_line( lpad('-', 50, '-') );
       dbms_output.put_line( '�μ���ȣ    �����ȣ    �����    ����    �⺻�޿�' );
       dbms_output.put_line( lpad('-', 50, '-') );
       
    loop
        -- 3 �ܰ� => CURSOR �� FETCH   
        fetch cur_empinfo 
        into 
            v_department_id,
            v_department_name,
            v_employee_id,
            v_ename,
            v_gender,
            v_salary;
            
        exit when cur_empinfo%notfound;
            
            dbms_output.put_line( 
                                 v_department_id || ' ' ||
                                 v_department_name || ' ' ||
                                 v_employee_id || ' ' ||
                                 v_ename || ' ' ||
                                 v_gender || ' ' ||
                                 v_salary 
                                 );
    end loop;
    if(cur_empinfo%rowcount = 0) then
       dbms_output.put_line('��ȸ�Ϸ��� �μ���ȣ ' || p_department_id || '�� �������� �ʽ��ϴ�.');
    end if;
    
    
     -- 4 �ܰ� => CURSOR �� CLOSE
    close cur_empinfo;
    
 end;
 
 
  exec pcd_empdept(10);
 
  exec pcd_empdept(null);
 
  exec pcd_empdept(50);

-- 5447