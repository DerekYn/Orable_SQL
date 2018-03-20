  -- *** 테이블에 컬럼명 변경하기 *** --
 tbl_woker 테이블의 email 컬럼명을 mail로 변경하가.
 alter table tbl_woker
 rename column email to mail;
 
 select *
 from tbl_woker;

 
 -- *** 테이블명 변경하기 *** --
 -- tbl_woker 테이블명을 tbl_emp 로 변경하기
 rename tbl_woker to tbl_emp;
 
 select *
 from tbl_woker;
 
 select *
 from tbl_emp;
 
 rename tbl_emp to tbl_woker;
 
 select *
 from tbl_woker;
 
-- *** 컬럼의 데이터타입 변경하기 *** --
 desc tbl_woker;

 alter table tbl_woker
 modify saname varchar2(50);

 desc tbl_woker;
 
 alter table tbl_woker
 modify saname varchar2(30);
 
 desc tbl_woker;
 
 
  --- *** 테이블을 복사하면 데이터만 복사가 되고
  --      not null 제약은 제외한 나머지 제약조건은 복사가 되지 않는다. *** ---
 
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
 이름   널        유형           
---- -------- ------------ 
ID   NOT NULL VARCHAR2(10) 
NAME NOT NULL VARCHAR2(20)
*/

 desc tbl_mber2;
/* 
 이름   널        유형           
---- -------- ------------ 
ID   NOT NULL VARCHAR2(10) 
NAME NOT NULL VARCHAR2(20) 
*/

insert into tbl_mber(id, name) values('lee','이순신');

insert into tbl_mber2(id, name) values('lee','이순신');
 
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