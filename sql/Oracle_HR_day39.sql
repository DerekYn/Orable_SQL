----------------------------------------------------------------------------------------------------------------
  �μ���ȣ      �μ���      �μ��ּ�      �μ����      �����ȣ      �����      ����      �μ������������      �μ����������
 ----------------------------------------------------------------------------------------------------------------
employees   departments  locations   departments  employees   employees  employees   employees       employees
    E             D          L            D           E           E           E         E                 E
 
 
 --1992
 select �μ���ȣ, �μ���, �μ��ּ�, �μ����, �����ȣ, �����, ����, ���� - �μ���տ��� AS �μ������������,
        rank() over(partition by �μ���ȣ order by ���� - �μ���տ��� desc) AS �μ����������
 from
 (
  select E.department_id AS �μ���ȣ,
        D.department_name AS �μ���,
        L.Street_Address AS �μ��ּ�,
        E2.first_name || ' ' || E2.last_name AS �μ����,
        E.Employee_Id AS �����ȣ,
        E.first_name || ' ' || E.last_name AS �����,
        nvl(E.salary + (E.salary * E.commission_pct), E.salary) * 12 AS ����
 from employees E, employees E2, departments D, locations L
 where E.department_id = D.department_id(+) and
       D.Location_id = L.Location_id(+) and
       D.Manager_Id = E2.Employee_Id(+)
 ) V,
(
  select department_id, trunc( avg(nvl(salary + (salary*commission_pct), salary)) ) * 12 AS �μ���տ���
  from employees
  group by department_id
) B
where V.�μ���ȣ = B.Department_Id(+)
order by 1;