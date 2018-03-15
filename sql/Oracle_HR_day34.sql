 ---- **** Multi Table Join(���� ���̺� ����) **** ----
  --> 3�� �̻��� ���̺��� ������ ���� �����ִ� ���̴�.
  ---------------------------------------------------------------------------------
       �μ���ȣ           �μ���      ������       �μ��ּ�       �����ȣ    �����    ����
  ---------------------------------------------------------------------------------
--  departments /  departments / countries /  locations /           employees
--   employees

   

 ���̺��               ���������÷���
--------------------------------------------------------
 departments D         location_id       department_id
 locations   L         location_id       country_id
 countries   C         country_id
 employees   E                           department_id
 

 -- 1999 ���.
 select E.department_id,
        D.department_name,
        C.country_name,
        L.city || ' ' || L.street_address AS DEPTADDRESS,
        E.employee_id,
        E.first_name || ' ' || last_name AS ENAME,
        E.salary
 from departments D join locations L
 on D.location_id = L.location_id           -- 1 ��° ����
 
 right join employees E
 on D.department_id = E.department_id       -- 2 ��° ����   ���⼳���� �ΰ��� �ִ������� ���ϵ���(NULL�� �̱�����)
 
 join countries C
 on L.country_id = C.country_id             -- 3 ��° ����
 order by 1;           
 
 -- 1992 ���.


 -- 1999 ���.
 select E.department_id,      -- departments���� ������ null ���� �ִ� employee���� �̾��ش�.
        D.department_name,
        E.Department_Id,
        E.first_name || ' ' || last_name AS ENAME,
        V.Avgmonthsal,
        nvl(E.salary + (E.salary * E.commission_pct), E.salary) AS MONTHSAL,
        nvl(E.salary + (E.salary * E.commission_pct), E.salary) - V.Avgmonthsal AS �μ��������
 from 
     (
      select department_id,
      trunc( avg(nvl(salary + (salary*commission_pct), salary)) ) AS AVGMONTHSAL
      from employees
      group by department_id
      ) V 
  left join departments D
  on V.department_id = D.department_id          -- 1 ��° ����
  
  left join employees E                         -- 2 ��° ����
  on nvl(V.department_id, -9999) = nvl(E.department_id, -9999)  -- desc employees;  �غ��� not null���� �ƴ��� Ȯ���� ����(on) �۾��ϱ�
  order by 1, 6;
  
  desc employees;        -- �غ��� not null���� �ƴ��� Ȯ���� ���� �۾��ϱ�




  -- 1992 ���
  select E.department_id,
        D.department_name,
        C.country_name,
        L.city || ' ' || L.street_address AS DEPTADDRESS,
        E.employee_id,
        E.first_name || ' ' || last_name AS ENAME,
        E.salary
  from countries C, locations L, departments D, employees E
  where C.country_id(+) = L.country_id AND
        L.location_id(+) = D.location_id AND
        D.department_id(+) = E.department_id
  order by 1;

  desc locations;
  desc employees;

-- 3007