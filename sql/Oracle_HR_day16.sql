 -- 5.3  ��� rank, ���� dense_rank
  
  select department_id AS �μ���ȣ, employee_id AS �����ȣ, first_name || ' ' || last_name AS �����,
         salary AS ����, rank() over(order by salary desc) AS ��ü�⺻�޿�����,
                        dense_rank() over(order by salary desc) AS ��ü�⺻�޿�����,
                        rank() over( partition by department_id order by salary desc ) AS �μ����⺻�޿�����,  --  partition by department_id �μ� ��ȣ���� ������ ���̰ڴ�.
                        dense_rank() over( partition by department_id order by salary desc ) AS �μ����⺻�޿�����
  from employees
  order by 1;
  
  
  select department_id AS �μ���ȣ, employee_id AS �����ȣ, first_name || ' ' || last_name AS �����,
         salary AS ����, rank() over(order by salary desc) AS ��ü�⺻�޿�����
  from employees
  where rank() over(order by salary desc) <= 10;  -- ���� where������ rank() over()�� �� �� ����. ===> �ζ��� ��� �ذ��Ѵ�.
  
  
  select *
  from
 ( 
  select department_id AS �μ���ȣ, employee_id AS �����ȣ, first_name || ' ' || last_name AS �����,
         salary AS ����, rank() over(order by salary desc) AS RANKING,
         rank() over( partition by department_id order by salary desc ) AS DEPTRANKING
  from employees
 ) V
 where V.DEPTRANKING = 1;           -- �� �μ����� ���� ž ���
 
 
 --  5.4  -- greatest, least  -- ���� ū �Ͱ� ���� ���� ���
 
 select greatest(10, 90, 100, 80),  -- ���� ū ��
        least(10, 90, 100, 80)      -- ���� ���� ��
 from dual;
 
 select greatest('������', '������', '����', '��ν�'),
        least('������', '������', '����', '��ν�')
 from dual;

-- 1762