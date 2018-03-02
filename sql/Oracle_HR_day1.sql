show user;
-- USER��(��) "HR"�Դϴ�.

select *
from dba_users;
-- ����Ŭ ������ �����ϴ� ����� ���� ������ ��ȸ���ִ� ���̴�.
/*
  ORA-00942: table or view does not exist
  00942. 00000 -  "table or view does not exist"
  *Cause:    
  *Action:
  5��, 6������ ���� �߻�
*/

select *
from tab;
-- ���� ����Ŭ ������ ������ �����(������ HR) ������ ���̺��� ����� ��ȸ���ִ� �������̴�.

/*
  --------�ڡڡڡڡڡڡڡڡ� ���־��־��־��־��� �߿��� �ڡڡڡڡڡڡڡ� ----------
  ===== select ���� ó������ ======
  
  select �÷���          --- ��
  from ���̺��(���)     --- ��
  where ������           --- ��   where ���� ���ϴ� ���� �ش� ���̺��� ���ǿ� �����ϴ� ���� �޸�(RAM)�� �ε�(�ø��°�)�ϴ� ���̴�.
  group by ��           --- ��
  having �׷��Լ� ������  --- ��
  order by ��           --- �� 
*/

select *
from departments; -- �μ����̺�

/* column = field = attribute = ��
   row = record = tuple = ��
   table = entity = ���̺� 
*/

describe departments;
desc departments;
-- departments ���̺��� �÷� ������ ��ȸ�ϴ� ��
/*
  DEPARTMENT_ID      ==> �μ���ȣ
  DEPARTMENT_NAME    ==> �μ���
  MANAGER_ID         ==> �μ����� �����ȣ
  LOCATION_ID        ==> �μ��� ��ġ�ϴ� ������ȣ
*/

select *
from employees;

desc employees;
/*
  EMPLOYEE_ID      ==> �����ȣ
  FIRST_NAME       ==> ��
  LAST_NAME        ==> ��
  EMAIL            ==> �̸���
  PHONE_NUMBER     ==> ��ȭ��ȣ
  HIRE_DATE        ==> �Ի�����
  JOB_ID           ==> �������̵�
  SALARY           ==> �⺻�޿�
  COMMISSION_PCT   ==> Ŀ�̼�(����)�ۼ�Ƽ��  0.2 �� �⺻���� 20%��� ���̴�.
  MANAGER_ID       ==> ���ӻ��(���)�� �����ȣ  
  DEPARTMENT_ID    ==> ������ �ٹ��ϴ� �μ���ȣ
*/

select *
from locations;  -- �μ��� ��ġ�� �˷��ִ� ���̺��̴�.

select *
from countries;  -- ���������� �˷��ִ� ���̺��̴�.

select *
from regions;  -- ��������� �˷��ִ� ���̺��̴�.

---- **** ���̺� ���� ���Ŀ� �ؾ��� ���� ���̺��� �÷��� �ּ����� �� �޾��־�� �Ѵ�.!!!!!!!! ***** -----
select *
from user_tab_comments;
-- ���� ����Ŭ ������ ������ �����(������ HR)�� ���� ���̺��, ��� �ּ����� �� ���� ��ȸ�ϴ� ���̴�.

select *
from user_tab_comments
where table_name = 'EMPLOYEES';
-- EMPLOYEES ���̺� �޷��� �ּ����� ��ȸ�ϴ� ���̴�.

select *
from user_col_comments
where table_name = 'EMPLOYEES';
-- EMPLOYEES ���̺��� �÷��� �޷��� �ּ����� ��ȸ�ϴ� ���̴�.


create table tbl_user 
(userid    varchar2(20) not null 
,passwd    varchar2(20) not null
,name      varchar2(20) not null
,addr      varchar2(100) 
,constraint PK_tbl_user_userid primary key(userid)
);


comment on table tbl_user 
is 'ȸ������ ���� ���̺�';

comment on column tbl_user.userid
is '����� ���̵� �ʼ��Է»���';

comment on column tbl_user.passwd
is '��ȣ�� ���̴� �ּ� 8���� �̻��� ������, ����, Ư����ȣ�� ȥ�յǾ�� ��.';

select *
from user_tab_comments;

desc tbl_user;

select *
from user_col_comments
where table_name = 'TBL_USER';
-- TBL_USER ���̺��� �÷��� �޷��� �ּ����� ��ȸ�ϴ� ���̴�.


   ----- **** NULL �� ó�����ִ� �Լ� **** ------
   1. nvl 
   
      select nvl(7,3), nvl(null, 3),
             nvl('�̼���','�źϼ�'), nvl(null,'�źϼ�')
      from dual;
   
   2. nvl2 
   
      select nvl2(7,3,2), nvl2(null,3,2)
      from dual;
   
   
   /*
      null �� �������� �ʴ� ���̹Ƿ� ��Ģ����(+ - * /)�� ���� 
      �� ����� ������ null �� �ȴ�.
   */
   
   select 2+3, 2+null, 3-null, 0*null, 1/null
   from dual;
   
   select employee_id, first_name, last_name, 
          salary, commission_pct,
          salary * commission_pct,
          nvl(salary + (salary * commission_pct), salary),
          nvl2(commission_pct, salary + (salary * commission_pct), salary)
   from employees;
   
   
   select employee_id as "�����ȣ" 
        , first_name "��"
        , last_name �̸�
        , nvl(salary + (salary * commission_pct), salary) "����"
   from employees; 
   
   select '�ڹ�' || 1234 || '����Ŭ' || sysdate
   from dual;
   -- �ڹ�1234����Ŭ18/02/22
   
   
   select sysdate, to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')
   from dual;
   -- 18/02/22	2018-02-22 16:11:40
   
 select *
 from employees;

 -- ���̺� �÷� �߰��ϱ�
 (employees ���̺� �ֹι�ȣ �÷��� �߰��غ��ڽ��ϴ�.)

 select 0207304234567, '0207304234567'
 from dual;

 select 1, 01, 001,
       '1', '01', '001'
 from dual;

 alter table employees
 add jubun varchar2(13);

 select *
 from employees; 

 -- ���̺� �÷� �����ϱ�
 (employees ���̺� �ֹι�ȣ �÷��� �����غ��ڽ��ϴ�.) 

 alter table employees
 drop column jubun;
 
 -- ���̺� �÷��� �����ϱ�.
 alter table tbl_user rename column address to addr;

 select *
 from employees;   -- 194