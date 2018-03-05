-- *** or, and, not, in �����ڿ� ���ؼ� �˾ƺ���. *** --
/*
  employees ���̺��� �μ���ȣ�� 30, 60, 90�� �μ��� �ٹ��ϴ� ����鿡 ���ؼ�
  �����ȣ, �����, ����(���� * 12), �μ���ȣ�� ����ϼ���.
*/


select employee_id as "�����ȣ", first_name || ' ' || last_name as "�����",
    nvl(salary + (salary * commission_pct), salary) * 12 as "����", department_id as "�μ���ȣ"
from employees
where  department_id = 30 or department_id = 60 or department_id = 90;


select employee_id as "�����ȣ", first_name || ' ' || last_name as "�����",
    nvl(salary + (salary * commission_pct), salary) as "����", department_id as "�μ���ȣ"
from employees
where  department_id in(30, 60, 90);


select employee_id as "�����ȣ", first_name || ' ' || last_name as "�����",
    nvl(salary + (salary * commission_pct), salary) * 12 as "����", department_id as "�μ���ȣ"
from employees
where department_id != 30 and  department_id != 60 and department_id != 90;


select employee_id as "�����ȣ", first_name || ' ' || last_name as "�����",
    nvl(salary + (salary * commission_pct), salary) * 12 as "����", department_id as "�μ���ȣ"
from employees
where nvl(department_id, -9999) != 30 and
      nvl(department_id, -9999) != 60 and
      nvl(department_id, -9999) != 90
order by 4;
      
      
select employee_id as "�����ȣ", first_name || ' ' || last_name as "�����",
        nvl(salary + (salary * commission_pct), salary) * 12 as "����", department_id as "�μ���ȣ"
from employees
where nvl(department_id, -9999) not in(30, 60, 90)
order by 4;


select employee_id as "�����ȣ", first_name || ' ' || last_name as "�����",
        nvl(salary + (salary * commission_pct), salary)* 12 as "����", department_id as "�μ���ȣ"
from employees
where nvl(department_id, -9999) not in(30, 60, 90)
order by 4, 3 desc;



-- *** and, or, not �������� �켱������ �ִ�. *** --
-- and, or, not �����ڰ� ȥ��Ǿ����� �켱������
-- �����µ� not > and > or > �� ������ ���󰣴�.
-- �켱������ �־ �ֿ켱�� ( ) �̴�.

select 2+3*4
from dual;
-- 14

/*
  employees ���̺��� �μ���ȣ�� 30, 50, 60�� �μ���
  �ٹ��ϴ� ������߿� ������ 20000 �̻� 60000 ������
  ����鸸 �����ȣ, �����, ����(���� * 12), �μ���ȣ�� ����ض�.
  �μ���ȣ���� �������� ������ ��
  ������ ������������ �����Ͽ� ����ϼ���
*/

select employee_id as "�����ȣ", first_name || ' ' || last_name as "�����",
        nvl(salary + (salary * commission_pct), salary) * 12 as "����", department_id as "�μ���ȣ"
from employees
where department_id = 30 or
      department_id = 50 or
      department_id = 60 and
      nvl(salary + (salary * commission_pct), salary) * 12 >= 20000 and
      nvl(salary + (salary * commission_pct), salary) * 12 <= 60000
order by 4, 3 desc;


select employee_id as "�����ȣ", first_name || ' ' || last_name as "�����",
        nvl(salary + (salary * commission_pct), salary) * 12 as "����", department_id as "�μ���ȣ"
from employees
where (department_id = 30 or
      department_id = 50 or
      department_id = 60) and
      nvl(salary + (salary * commission_pct), salary) * 12 >= 20000 and
      nvl(salary + (salary * commission_pct), salary) * 12 <= 60000
order by 4, 3 desc;


select employee_id as "�����ȣ", first_name || ' ' || last_name as "�����",
        nvl(salary + (salary * commission_pct), salary) * 12 as "����", department_id as "�μ���ȣ"
from employees
where department_id in(30, 50, 60) and
      nvl(salary + (salary * commission_pct), salary) * 12 >= 20000 and
      nvl(salary + (salary * commission_pct), salary) * 12 <= 60000
order by 4, 3 desc;

-- 847