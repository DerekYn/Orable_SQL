  -- 1. SQL 1992 CODE ��� ( WHERE )
  select *                      -- 2889  
  from employees, departments;  -- ��� ����� �� (Catersian Product)
    
  select *                      -- EQUI JOIN �̶� �θ���.          
  from employees, departments
  where employees.department_id = departments.department_id;
  
  select *                      -- EQUI JOIN �̶� �θ���.          
  from employees E, departments D
  where E.department_id = D.department_id;
  
  -- 2. SQL 1999 CODE ��� ( ON )
  select *                       -- INNER JOIN �̶� �θ���. ( �������� )  --> null ���� �����Ѵ�.
  from employees E inner join departments D  -- INNER JOIN ���� ( INNER )�� ���������ϴ�.
  on E.department_id = D.department_id;
  
  ----------------------------------------------------------------------------------
  -- 1. SQL 1992 CODE ��� ( WHERE )
  select *                               
  from employees E, departments D      -- (+)�� null ���� ǥ��
  where E.department_id = D.department_id(+); -- employees �� �ٺ����ش�.
  
  select *                              
  from employees E, departments D
  where E.department_id(+) = D.department_id; -- department �� �ٺ����ش�.
  
  
  -- 2. SQL 1999 CODE ��� ( ON ) -- OUTER JOIN �̶� �θ���. ( �ܺ����� )  --> null ���� ��� ���� ���� �� �� �ִ�.
  select *                         -- employees �� �ٺ����ش�.
  from employees E left outer join departments D  
  on E.department_id = D.department_id;
                                  -- OUTER JOIN ���� (OUTER)�� ������ �����ϴ�.
  select *                         -- department �� �ٺ����ش�.
  from employees E right outer join departments D  
  on E.department_id = D.department_id;
  
--===============================================================================
  -- INNER JOIN �� OUTER JOIN �� ������
  -- INNER, OUTER ������ �� ������ LEFT�� RIGHT�� �Ѵ�. ���� ����       ( ON )
  -- ������ �˾ƺ���.. null�� ó�� ���(���������� ���� / �ܺ������� ó�� ��� ��������)
  
  select *
  from employees E full join departments D  -- OUTER ��������
  on E.department_id = D.department_id;
  
  select *
  from employees E full join departments D  -- ���ʺ��� �ʹ�. left
  on E.department_id = D.department_id;     -- �����ʺ��� �ʹ�. right
                                            -- ���δٺ��� �ʹ�. full
                                            
                                            
 ----------------------------------------------------------------
  �μ���ȣ    �����ȣ    ����̸�    ����     ��ü��տ���     �������
 ----------------------------------------------------------------
  
  select department_id, employee_id, first_name || ' ' || last_name AS ENAME,
         nvl(salary + (salary * commission_pct), salary) AS MONTHSAL
  from employees;
  
  
  select trunc(avg(nvl(salary + (salary * commission_pct), salary))) AS AVGSAL
  from employees;
  
  -----------------------------------------------------------------------------
  
  select department_id AS �μ���ȣ, employee_id AS �����ȣ, first_name || ' ' || last_name AS ����̸�,
         nvl(salary + (salary * commission_pct), salary) AS ����,
         V.AVGSAL AS ��ü��տ���, nvl(salary + (salary * commission_pct), salary) - V.AVGSAL AS �������
  from employees cross join (
                    select trunc(avg(nvl(salary + (salary * commission_pct), salary))) AS AVGSAL
                    from employees
                    ) V
  order by 5 desc;
  
  ------------------------------------------------
    �μ���ȣ    �μ���    �����ȣ    �����    ����
  ------------------------------------------------
  select E.department_id AS �μ���ȣ, D.department_name AS �μ���,  -- �ָ��ϰ� ���ʿ� �ִ� �÷����� E. ���� ǥ�����ֱ�
         employee_id AS �����ȣ, first_name || ' ' || last_name AS �����,
         nvl(salary + (salary * commission_pct), salary) AS ����
  from employees E left join departments D
  on E.department_id = D.department_id;
  
   -------------------------------------------------------------------------
    �μ���ȣ    �μ���    �μ���տ���    �����ȣ    �����    ����    �μ���հ�������
   -------------------------------------------------------------------------
    
   select A.department_id
      , A.department_name
      , B.employee_id
      , B.ENAME
      , A.AVGMONTHSAL
      , B.MONTHSAL
      , B.MONTHSAL - A.AVGMONTHSAL
        AS �μ��������
 from (select V.department_id, D.department_name, V.AVGMONTHSAL
       from departments D right join (select department_id  -- ���⼳���� NULL ���� ����ϱ� ���� NULL ���� �ִ� �������� �Ѵ�.
                                           , trunc( avg(nvl(salary + (salary*commission_pct), salary)) )
                                             AS AVGMONTHSAL
                                      from employees
                                      group by department_id ) V
 on D.department_id = V.department_id) A join (select department_id
                                                    , employee_id
                                                    , first_name || ' ' || last_name
                                                      AS ENAME
                                                    , nvl(salary + (salary*commission_pct), salary)
                                                      AS MONTHSAL
                                               from employees) B
 on nvl(A.department_id, -9999) = nvl(B.department_id, -9999)
 order by 1, 6 desc;

-- 2919