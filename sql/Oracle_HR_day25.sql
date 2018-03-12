--================ *** Sub Query (���� ����) *** ======================

-- Sub Query(���� ����)��?
select �� �ӿ� �� �ٸ� select ���� ���ԵǾ��� ������
���ԵǾ��� select �� Sub Query(���� ����)��� �θ���.

select .....
from .....                       -> �ٱ��� �� Main Query(��������) == �ܺ� ����
where ..... in( select .....
                from ......  )   ->  ���� �� Sub Query(��������) == ���� ����


-- employees ���̺��� �⺻�޿��� ���� ���� ����� ���� ���� ����� ������ ��Ÿ������.

select *
from employees
where salary = (select max(salary) from employees) or
      salary = (select min(salary) from employees);
      
      
�ְ�޿� ==> select max(salary) from employees;
�����޿� ==> select min(salary) from employees;

5492354426301
02-3704-7700

/*
--60, 80�� �μ����� �ٹ��ϴ� �������� 20�� �μ��� ���� ��պ��� ���� �޴� �������� ������ ����ϼ���.
select employee_id
from employees                                            ���� �߿� ~~ And �̿��� ��
where department_id in(60,80) and
      ���� > (50�� �μ� �������� '��տ���');
*/
      
select department_id AS �μ���ȣ, employee_id AS �����ȣ, first_name || ' ' || last_name AS �����,
       nvl(salary + (salary * commission_pct), salary) AS ����
from employees
where department_id in(60,80) and
      nvl(salary + (salary * commission_pct), salary) > (select avg(nvl(salary + (salary * commission_pct), salary))
                                                         from employees
                                                         where department_id = 20);
                                     
                                     

select avg(nvl(salary + (salary * commission_pct), salary))
from employees
where department_id = 50;

select count(*)
from employees;


-- 2574