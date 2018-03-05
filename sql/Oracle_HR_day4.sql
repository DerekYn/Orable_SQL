----- ****  �񱳿����� **** ------

 /* 
    employees ���̺��� �μ���ȣ�� 50���� �μ���
    �ٹ��ϴ� ������� �μ���ȣ, �����ȣ, �����, ������
    ��Ÿ������. 
 */

 select department_id as "�μ���ȣ"
      , employee_id as "�����ȣ"
      , first_name || ' ' || last_name as "�����"
      , nvl( salary + (salary * commission_pct), salary) as "����" 
 from employees
 where department_id = 50
 order by nvl( salary + (salary * commission_pct), salary) desc; 


 select department_id as "�μ���ȣ"
      , employee_id as "�����ȣ"
      , first_name || ' ' || last_name as "�����"
      , nvl( salary + (salary * commission_pct), salary) as "����" 
 from employees
 where department_id = 50
 order by "����" desc;
 

 select department_id as "�μ���ȣ"
      , employee_id as "�����ȣ"
      , first_name || ' ' || last_name as "�����"
      , nvl( salary + (salary * commission_pct), salary) as "����" 
 from employees
 where department_id = 50
 order by 4 desc;

/*
  employees ���̺��� �μ���ȣ�� 50���� �ٹ��ϴ� ������� ������ ����鿡 ���ؼ�
  �μ���ȣ, �����ȣ, �����, ������ ��Ÿ������.
*/
  select department_id as "�μ���ȣ"
      , employee_id as "�����ȣ"
      , first_name || ' ' || last_name as "�����"
      , nvl( salary + (salary * commission_pct), salary) as "����" 
 from employees
 where nvl(department_id, -9999) != 50       -- 50���� NULL(�������� �ʴ�) �̶� �ƿ� �� ���� �� �� �����Ƿ�
 order by 1;                                 -- nvl(department_id, -9999) = -9999 ó�� department_id�� NULL �̸� -9999�� ���� �� �����ش�.

-- null �� �������� �ʴ� ���̹Ƿ� �񱳴���� �� ����
-- �����Ƿ� �񱳿�����(=, !=, <>, ^=, >, <, >=, <=)��
-- ����� �� ����. �׷��� is�� ����ؾ��ϰ�, �񱳿����ڸ� ����Ϸ���
-- nvl() �Լ��� ó���ؾ� �Ѵ�.

select *
from employees
where department_id is null;

  select department_id, nvl(department_id, -9999), first_name, last_name
  from employees;

desc employees;

select department_id, first_name, last_name
from employees
where nvl(department_id, -9999) = -9999;

  select department_id as "�μ���ȣ"
      , employee_id as "�����ȣ"
      , first_name || ' ' || last_name as "�����"
      , nvl( salary + (salary * commission_pct), salary) as "����" 
 from employees
 where nvl(department_id, -9999) <> 50      -- ���� �ʴ�.  [ != , <> ]
 order by 1;  
  
 select department_id as "�μ���ȣ"
      , employee_id as "�����ȣ"
      , first_name || ' ' || last_name as "�����"
      , nvl( salary + (salary * commission_pct), salary) as "����" 
 from employees
 where not nvl(department_id, -9999) = 50
 order by 4 desc;
 
 select *
 from employees
 where department_id is not null;


/*
  ����Ŭ�� ���̺� ����� �����Ͱ��� ���ؼ���
  ��, �ҹ��ڸ� �����Ѵ�.
  employees ���̺��� ��(first_name)�� 'John'��
  ����� �����ȣ, �����, �⺻�޿��� ������
  �����ϼ���.
*/

select employee_id, first_name || ' ' || last_name, salary
from employees
where first_name = 'John';

-- 719