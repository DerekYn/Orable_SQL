  -- *** ���̺� �÷��� �����ϱ� *** --
 tbl_woker ���̺��� email �÷����� mail�� �����ϰ�.
 alter table tbl_woker
 rename column email to mail;
 
 select *
 from tbl_woker;

 
 -- *** ���̺�� �����ϱ� *** --
 -- tbl_woker ���̺���� tbl_emp �� �����ϱ�
 rename tbl_woker to tbl_emp;
 
 select *
 from tbl_woker;
 
 select *
 from tbl_emp;
 
 rename tbl_emp to tbl_woker;
 
 select *
 from tbl_woker;
 
-- *** �÷��� ������Ÿ�� �����ϱ� *** --
 desc tbl_woker;

 alter table tbl_woker
 modify saname varchar2(50);

 desc tbl_woker;
 
 alter table tbl_woker
 modify saname varchar2(30);
 
 desc tbl_woker;
 
 
  --- *** ���̺��� �����ϸ� �����͸� ���簡 �ǰ�
  --      not null ������ ������ ������ ���������� ���簡 ���� �ʴ´�. *** ---
 
 create table tbl_empcopy1
 as
 select *
 from employees;

 create table tbl_empcopy2
 as
 select *
 from employees;

 create table tbl_empcopy3
 as
 select *
 from employees;
 
 create table tbl_empcopy4
 as
 select *
 from employees;

 create table tbl_empcopy5
 as
 select *
 from employees;
 
 select *
 from tbl_empcopy5;
 
 select *
 from user_constraints A JOIN user_cons_columns B
 on A.constraint_name = B.constraint_name
 where A.table_name = 'EMPLOYEES';
 
 
 select *
 from user_constraints A JOIN user_cons_columns B
 on A.constraint_name = B.constraint_name
 where A.table_name = 'TBL_EMPCOPY5';
 
 
 create table tbl_mber
 (id    varchar2(10) not null
 ,name  varchar2(20) not null
 ,constraint PK_tbl_mber_id primary key(id)
 );

 create table tbl_mber2
 (id    varchar2(10)
 ,name  varchar2(20) not null
 ,constraint PK_tbl_mber2_id primary key(id)
 ); 
 
 desc tbl_mber;
/*
 �̸�   ��        ����           
---- -------- ------------ 
ID   NOT NULL VARCHAR2(10) 
NAME NOT NULL VARCHAR2(20)
*/

 desc tbl_mber2;
/* 
 �̸�   ��        ����           
---- -------- ------------ 
ID   NOT NULL VARCHAR2(10) 
NAME NOT NULL VARCHAR2(20) 
*/

insert into tbl_mber(id, name) values('lee','�̼���');

insert into tbl_mber2(id, name) values('lee','�̼���');
 
commit;

create table tbl_mber_copy
as
select *
from tbl_mber
where 1=2;

create table tbl_mber2_copy
as
select *
from tbl_mber2
where 1=2;

desc tbl_mber_copy;

desc tbl_mber2_copy;

-- 4157