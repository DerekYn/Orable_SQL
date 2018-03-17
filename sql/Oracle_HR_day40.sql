 ----------------------------------------------------------------------------------------------------------------
  �μ���ȣ      �μ���      �μ��ּ�      �μ����      �����ȣ      �����      ����      �μ������������      �μ����������
 ----------------------------------------------------------------------------------------------------------------
employees   departments  locations   departments  employees   employees  employees   employees       employees
    E             D          L            D           E           E           E         E                 E
 
 --1999
 select E.Department_Id AS �μ���ȣ,
        D.Department_Name AS �μ���,
        L.Street_Address AS �μ��ּ�,
        E3.first_name || ' ' || E3.last_name AS �μ����,
        E.employee_id AS �����ȣ,
        E.first_name || ' ' || E.last_name AS �����,
        nvl(E.salary + (E.salary * E.commission_pct), E.salary) * 12 AS ����,
        nvl(E.salary + (E.salary * E.commission_pct), E.salary) * 12 - �μ�������� AS �μ������������,
        rank() over(partition by E.department_id order by nvl(E.salary + (E.salary * E.commission_pct), E.salary) * 12 - �μ�������� desc) AS �μ����������
 from employees E left join departments D
 on E.department_id = D.department_id
 
 left join locations L
 on D.location_id = L.location_id
 
 left join ( 
              select department_id,
                     trunc(avg(nvl(salary + (salary * commission_pct), salary)) * 12) AS �μ��������
              from employees
              group by department_id 
            ) E2
 on D.department_id = E2.department_id
 
 left join employees E3
 on D.manager_id = E3.employee_id;

-- 3257