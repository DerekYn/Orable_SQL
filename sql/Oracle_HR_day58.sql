 -- *** 생성되어진 인덱스 조회하기 *** --
 
 -- Primary key, Unique 제약을 주면 자동적으로 
 -- 그 컬럼에 대해서 unique 한 인덱스가 생성되어진다.
 
 select *
 from user_indexes
 where table_name = 'TBL_USERDETAIL';
      
 select *
 from user_indexes
 where table_name = 'TBL_WOKER';
 
 
 --- **** 인덱스 생성하기 **** ---
 create unique index idx_tbl_userlogin_name
 on tbl_userlogin(name);
 
 select *
 from user_indexes
 where table_name = 'TBL_USERLOGIN';  -- 유니크해서 동명이인은 못들어간다.
 
 select *
 from user_ind_columns
 where table_name = 'TBL_USERLOGIN';
 
 select *
 from user_indexes A join user_ind_columns B
 on A.index_name = B.index_name
 where A.table_name = 'TBL_USERLOGIN';
 
 select *
 from tbl_userlogin;
 
 
 insert into tbl_userlogin(userid, passwd, name)
 values('batman', 'qwer1234$', '윤찬영');
 -- SQL 오류: ORA-00001: unique constraint 고유해야 하는데 중복된 이름쓰면 안됨.
 
 --- **** 인덱스 삭제하기 **** ---
 drop index idx_tbl_userlogin_name;
 
 create index idx_tbl_userlogin_name
 on tbl_userlogin(name);  -- 동명이인을 위해 Unique 없이 다시 생성
 
 insert into tbl_userlogin(userid, passwd, name)
 values('batman', 'qwer1234$', '윤찬영');
 
 select *
 from tbl_userlogin;
 
 rollback;
  
 select *
 from user_indexes A join user_ind_columns B
 on A.index_name = B.index_name
 where A.table_name = 'TBL_WOKER';
 
 drop index PK_TBL_WOKER_WOKERNAME;
 
 
  select *
 from user_indexes A join user_ind_columns B
 on A.index_name = B.index_name
 where A.table_name = 'TBL_WOKER';  
 
 drop index UQ_TBL_WOKER_WOKERNAME;  -- 오류발생!!!
 
 -- Primary Key / Unique 제약으로 생성되어진 인덱스의
 -- 삭제는 drop index 가 아니라
 -- 제약조건의 삭제를 하면 자동적으로 인덱스가 삭제된다.
 alter table tbl_woker
 drop constraint UQ_TBL_WOKER_WOKERNAME; 
 -- 을 하면 제약조건이 삭제됨과 동시에 인덱스도 삭제된다.
 
 /*
    DDL(Data Definition Language) --> create, drop, alter, truncate
    DML(Data Manuplation Language) --> insert, update, delete, merge
    DCL(Data Control Language) --> grant(권한을 주는것), revoke(권한을 빼앗는것)
    TCL(Transaction Control Language) --> commit, rollback
 */
 -- DML(Data Manuplation Language)문 만 수동 commit 이고,
 -- 나머지 DDL, DCL 문은 실행하면 자동(auto)적으로 commit 이 일어난다.
 
 create table tbl_a
 (no    number
 ,name  varchar2(20)
 );
 
 insert into tbl_a(no, name) values(1,'한석규');
 commit;
 
 insert into tbl_a(no, name) values(2,'두석규');
 
 create table tbl_b
 (
  no    number,
  name  varchar2(20)
 ); -- auto commit 이 발생함.
 
 rollback;
 
 select *
 from tbl_a;
 -- 두석규는 rollback 이 되지 않고 insert 되어져 있음.

-- 4453