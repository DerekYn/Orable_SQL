/*
  ����Ŭ�� �Էµ� �����Ͱ��� ���ؼ���
  ��, �ҹ��ڸ� �����Ѵ�.
  ���ڿ� �Լ� �߿� ��, �ҹ��ڸ� ������ �ִ� ���� �ִ�.
  
  1. upper : ��� ���ڸ� �빮�ڷ� �������ִ� �Լ�.
  2. lower : ��� ���ڸ� �ҹ��ڷ� �������ִ� �Լ�.
  3. initcap : �ܾ �߽����� ù���ڸ� �빮�ڷ�, �������� �ҹ��ڷ� �������ִ� �Լ��̴�.
*/

select first_name, upper(first_name), lower(first_name)
from employees;

select street_address, upper(street_address), lower(street_address),
        initcap(street_address)       -- ���� �������� ù��° ���ڸ� �빮�ڷ� ����
from locations;


select 'seOUL cITy', upper('seOUL cITy'), lower('seOUL cITy'), initcap('seOUL cITy')
from dual;

select employee_id, first_name, first_name || ' ' || last_name, salary
from employees
where lower(first_name) = lower('jOHn');


select employee_id, first_name || ' ' || last_name, salary
from employees
where upper(first_name || ' ' || last_name) = upper('jOHn sEo');

-- 750