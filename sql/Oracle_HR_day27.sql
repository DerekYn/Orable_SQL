 --======================�ڡڡ� Pairwise Sub Query �ڡڡ�========================
 
 -- employees ���̺��� �μ���ȣ���� ������ �ִ��� �����
 --                    �μ���ȣ���� ������ �ּ��� ����� ������ ����ϼ���.
 
 select department_id, max(salary)
 from employees
 group by department_id;
 
 select department_id, min(salary)
 from employees
 group by department_id;
 
 
 -- NULL�� ����� �̾��ֱ�
 select nvl(to_char(department_id), '����') AS �μ���ȣ, employee_id AS �����ȣ, first_name || ' ' || last_name AS �����,
        nvl(salary + (salary * commission_pct), salary) AS ����
 from employees
 where (nvl(department_id, -9999), salary) in (select nvl(department_id, -9999), min(salary)
                                               from employees
                                               group by department_id)
 OR 
       (nvl(department_id, -9999), salary) in (select nvl(department_id, -9999), max(salary)
                                               from employees
                                               group by department_id)
 order by 1, 4;

-- 2662