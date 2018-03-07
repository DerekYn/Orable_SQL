/*
    [����]
    employees ���̺���
    �����ȣ, �����, �ֹι�ȣ, ����, ���糪��, ����, �Ի�����, ������������ ��Ÿ������.
    
    �����������̶����� [����������������]
    �ش� ����� ���� 3������ 8���� �¾ ����� �ش��� ����(�ѱ�����)�� 63���� �Ǵ� �⵵�� 8�� 31�Ϸ� �ϰ�,
    �ش� ����� ������ 9������ 2���� �¾ ����� �ϴ��� ����(�ѱ�����)�� 63���� �Ǵ� �⵵�� 2������(2��28�� �Ǵ� 2��29��)���� �Ѵ�.
  */
select V2.�����ȣ, V2.�����, V2.�ֹι�ȣ, V2.����, V2.age, V2.����, V2.�Ի�����,
       to_char(last_day(to_char(add_months(sysdate, ((63 - age) * 12)), 'yyyy-') ||
       case when ( to_number(substr(V2.�ֹι�ȣ, 3, 2)) between 3 and 8 ) then '08-01' else '02-01' end), 'yyyy-mm-dd') as ����������
from
(
select employee_id as "�����ȣ",
       first_name || ' ' || last_name as "�����",
       jubun as "�ֹι�ȣ",
       case when substr(jubun, 7, 1) in ('1', '3') then '��' else '��' end as "����", 
       extract(year from sysdate) - (to_number(substr(jubun, 1, 2)) + case when substr(jubun, 7, 1) in ('1', '2')
                                                                           then 1900 else 2000 end ) +1 as age,
       trunc(nvl((salary + salary * commission_pct), salary) / 12) as "����",
       hire_date as "�Ի�����"
from employees
) V2;

-- 1415