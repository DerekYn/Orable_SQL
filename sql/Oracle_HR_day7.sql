-- ������ ��Ÿ�����ִ� �����ڰ� �ִ�.
-- A ���� B ���� ==> between A and B

select employee_id as "�����ȣ", first_name || ' ' || last_name as "�����",
        nvl(salary + (salary * commission_pct), salary) * 12 as "����", department_id as "�μ���ȣ"
from employees
where department_id in(30, 50, 60) and
      nvl(salary + (salary * commission_pct), salary) * 12 between 20000 and 60000
order by 4, 3 desc;

-- in ���ٴ� or��, between and ���ٴ� >= �� ����� ���� ����

-- 860