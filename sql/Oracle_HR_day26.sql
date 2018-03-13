--==================================  ANY, ALL ==================================
 Sub Query ������ ���Ǿ����� ANY, ALL ��
 ANY�� OR�� ����ϰ�, ALL�� AND�� ����ϴ�.
 
 -- employees ���̺��� salary �� �μ���ȣ 30���� salary�� ������ ����鸸 �����ϼ���.
 
 select department_id AS �μ���ȣ, employee_id AS �����ȣ, first_name || ' ' || last_name AS �����,
        nvl(salary + (salary * commission_pct), salary) AS ����
 from employees
 where salary in(select salary
                 from employees
                 where department_id = 30);  -- in �� ������(�̰� �Ǵ� ���� �Ǵ� .. �Ǵ� �Ǵ�)...
                                             -- �׸��� ( in ��ſ� = �� ���� ���� �� �Ѱ��� ���� ��ġ�Ҷ�!!)
                 
 select department_id AS �μ���ȣ, employee_id AS �����ȣ, first_name || ' ' || last_name AS �����,
        nvl(salary + (salary * commission_pct), salary) AS ����
 from employees
 where salary = ANY(select salary            -- any�� in �� ���� �Ȱ�.
                    from employees
                    where department_id = 30);
 
 
 select salary
 from employees
 where department_id = 30;   -- 11000, 3100, 2900, 2800, 2600, 2500
 
 
 -- �⺻�޿�(salary)�� ���� ������ ������ ��� ����鸸 �����ȣ, ������ ��Ÿ������.
 
 select employee_id AS �����ȣ, first_name || ' ' || last_name AS �����,
        nvl(salary + (salary * commission_pct), salary) AS ����
 from employees
 where salary > ANY(select salary from employees)  -- ������ 2100 ���ٴ� ũ�� �� �ö�´�. OR�� Ư���� 
 order by 3;
      -- 3000 > 3100   => ����
      -- 3100 > 3000   => ��
 


 select employee_id AS �����ȣ, first_name || ' ' || last_name AS �����,
        nvl(salary + (salary * commission_pct), salary) AS ����
 from employees
 where salary >= ALL(select salary from employees);  -- �ִ� 24000 ���� ũ�� �� �ø���. �㳪 24000�� ���� ũ�Ƿ� �ִ��� ���
      -- 3000 >= 3100   => ����
      -- 3100 >= 3000   => ��
 
 
 
-- �ڡڡ�
 
 select employee_id AS �����ȣ, first_name || ' ' || last_name AS �����,
        salary * commission_pct AS COMM
 from employees
 where salary * commission_pct >= All(select salary * commission_pct from employees
                                      where commission_pct is not null);   -- where (    ) is not null  => NULL ���� �����ϰ�.!!
                        -- 3000 >= 3100   => ����
                        -- 3100 >= 3000   => ��


-- 2632