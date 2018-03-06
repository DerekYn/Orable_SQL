-- *** like ������ *** --
select *
from employees
where department_id = 80;

select *
from employees
where department_id like 80;

update employees set first_name = 'J'
where employee_id = 100;

commit;

-- employees ���̺��� first_name �� ���� ù���ڰ�
-- 'J'�� �����ϴ� ����鸸 ��� ������ ��Ÿ������.

select *
from employees
where first_name like 'J%';
-- like �����ڿ� �Բ� ���Ǿ����� %�� Wild Character ��� �θ��µ�
-- �� ���� ���ڰ� �ֵ��� ������ ������� ��� ���̴�

select *
from employees
where first_name like '%s';


select *
from employees
where first_name like '%ee%';

select *
from employees
where first_name like '%e%e%';


-- like �����ڿ� �Բ� ����ϴ� _�� �ƹ� ���� 1���� ���Ѵ�. (������!! ���ڰ� ���;��Ѵ�.)
-- like �����ڿ� �Բ� ����ϴ� %�� ���ڰ� �ֵ��� ������ ������ٶ�� ���̴�.
select first_name, last_name, department_id
from employees
where last_name like 'F_e%';


select employee_id as "�����ȣ", first_name || ' ' || last_name as "�����", jubun as "�ֹι�ȣ"
from employees
where jubun like '______2%' or jubun like '______4';


create table tbl_watch
(watchname    varchar2(30),
blank         varchar2(200)
);

insert into tbl_watch(watchname, blank)
values('Gold', '���� 99.99% ���� ��޽ð�');

insert into tbl_watch(watchname, blank)
values('Silver', '�������� 99.99�� ȹ�� ��޽ð�');

commit;

-- tbl_watch ���̺��� blank �÷��� 99.99% ��� 
-- ���ڰ� ����ִ� �ุ �����ϼ���.

select *
from tbl_watch
where blank like '%99.99%%';

select *
from tbl_watch
where blank like '%99.99/%%' escape '/';

select *
from tbl_watch
where blank like '%99.99?%%' escape '?';

-- 939