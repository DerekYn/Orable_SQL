 ----------------------------------------------------------------------
                      ------ **** CURSOR **** ------
 ----------------------------------------------------------------------
 
 create or replace procedure pcd_empdept
 ( p_department_id   in   employees.department_id%type)
 is
    v_department_id  employees.department_id%type;
    v_employee_id    employees.employee_id%type;
    v_ename          varchar2(40);
    v_gender         varchar2(10);
    v_salary         employees.salary%type;
 begin 
       select department_id,
              employee_id,
              first_name || ' ' || last_name,
              func_gender(jubun),
              salary
          into
              v_department_id,
              v_employee_id,
              v_ename,
              v_gender,
              v_salary
       from employees
       where nvl(department_id, -9999) = nvl(p_department_id, -9999);
       
       dbms_output.put_line( lpad('-', 50, '-') );
       dbms_output.put_line( '부서번호    사원번호    사원명    성명    기본급여' );
       dbms_output.put_line( lpad('-', 50, '-') );
       dbms_output.put_line( 
                             v_department_id || ' ' ||
                             v_employee_id || ' ' ||
                             v_ename || ' ' ||
                             v_gender || ' ' ||
                             v_salary 
                             );
 end;

 
 exec pcd_empdept(10);
 
 exec pcd_empdept(null);
 
 exec pcd_empdept(50);

-- 5337