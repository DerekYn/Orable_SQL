--------------------- *** FOR LOOP CURSOR �� *** ---------------------
 
 --> FOR LOOP CURSOR ���� ����ϸ�
 -- Ŀ���� OPEN, FETCH, CLOSE �� �ڵ������� �߻��Ǿ����� ������
 -- �츮�� OPEN, FETCH, CLOSE ���� ����� �ʿ䰡 ����.
 
 �� ����
    FOR ������(���ڵ� ������ ���� ����) IN Ŀ���� LOOP
       ���๮��;
    END LOOP;
    
 
 
 create or replace procedure pcd_empdept2
 ( p_department_id   in   employees.department_id%type)
 is
 
    -- 1 �ܰ� => CURSOR �� ����(����)
    cursor cur_empinfo
    is
     select E.department_id,
            D.department_name,
            E.employee_id,
            E.first_name || ' ' || E.last_name AS ENAME,
            func_gender(E.jubun) AS gender,
            E.salary
     from employees E left join departments D
     on E.department_id = D.department_id
     where nvl(E.department_id, -9999) = nvl(p_department_id, -9999);
     
     v_count     number := 0;
 begin        
       dbms_output.put_line( lpad('-', 50, '-') );
       dbms_output.put_line( '�μ���ȣ    �����ȣ    �����    ����    �⺻�޿�' );
       dbms_output.put_line( lpad('-', 50, '-') );
       
    for rcd in cur_empinfo loop  -- 2 �ܰ�
        dbms_output.put_line(
                              rcd.department_id || ' ' ||
                              rcd.department_name || ' ' ||
                              rcd.employee_id || ' ' ||
                              rcd.ENAME || ' ' ||
                              rcd.gender || ' ' ||
                              rcd.salary
                            );
         v_count := v_count + 1;
    end loop;
           
    if(v_count = 0) then
       dbms_output.put_line('��ȸ�Ϸ��� �μ���ȣ ' || p_department_id || '�� �������� �ʽ��ϴ�.');
    else
       dbms_output.put_line('��ȸ�Ϸ��� �Ǽ��� ' || v_count || '�� �Դϴ�.');
    end if;
        
 end;
 
  exec pcd_empdept2(10);
 
  exec pcd_empdept2(null);
 
  exec pcd_empdept2(50);

-- 5511