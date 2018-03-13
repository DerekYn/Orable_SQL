 --============================ ��� Sub Query( == ���� ��� ����) =======================
 -- ��� Sub Query �� ���� Main Query( == �ܺ�����)���� ���� ���̺�(��)�� �����ϴ� �÷���
 -- Sub Query( == ��������)�� ������(where��, having��)�� ���Ǿ��� ���� ���Ѵ�.
 
 
 
 -- �Լ� ���� ��� ���ϱ�
 select department_id, employee_id, E.salary, (select count(*) + 1
                                               from employees
                                               where salary > E.salary) AS TOTALRANKING,
        rank() over(partition by department_id order by salary desc) AS DEPTRANKING
 from employees E
 order by E.salary desc;
 
 
 
 
 
 
  select department_id, employee_id, E.salary, (select count(*) + 1
                                               from employees
                                               where salary > E.salary) AS TOTALRANKING,
                                               (select count(*) + 1
                                               from employees
                                               where department_id > E.department_id
                                               and salary > E.salary) AS DEPTRANKING  -- ���� ���� �μ� �������� ��� AND!!!
 from employees E
 order by 1, 3 desc;

-- 2693