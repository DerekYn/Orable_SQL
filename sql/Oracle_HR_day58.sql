 -- *** �����Ǿ��� �ε��� ��ȸ�ϱ� *** --
 
 -- Primary key, Unique ������ �ָ� �ڵ������� 
 -- �� �÷��� ���ؼ� unique �� �ε����� �����Ǿ�����.
 
 select *
 from user_indexes
 where table_name = 'TBL_USERDETAIL';
      
 select *
 from user_indexes
 where table_name = 'TBL_WOKER';
 
 
 --- **** �ε��� �����ϱ� **** ---
 create unique index idx_tbl_userlogin_name
 on tbl_userlogin(name);
 
 select *
 from user_indexes
 where table_name = 'TBL_USERLOGIN';  -- ����ũ�ؼ� ���������� ������.
 
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
 values('batman', 'qwer1234$', '������');
 -- SQL ����: ORA-00001: unique constraint �����ؾ� �ϴµ� �ߺ��� �̸����� �ȵ�.
 
 --- **** �ε��� �����ϱ� **** ---
 drop index idx_tbl_userlogin_name;
 
 create index idx_tbl_userlogin_name
 on tbl_userlogin(name);  -- ���������� ���� Unique ���� �ٽ� ����
 
 insert into tbl_userlogin(userid, passwd, name)
 values('batman', 'qwer1234$', '������');
 
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
 
 drop index UQ_TBL_WOKER_WOKERNAME;  -- �����߻�!!!
 
 -- Primary Key / Unique �������� �����Ǿ��� �ε�����
 -- ������ drop index �� �ƴ϶�
 -- ���������� ������ �ϸ� �ڵ������� �ε����� �����ȴ�.
 alter table tbl_woker
 drop constraint UQ_TBL_WOKER_WOKERNAME; 
 -- �� �ϸ� ���������� �����ʰ� ���ÿ� �ε����� �����ȴ�.
 
 /*
    DDL(Data Definition Language) --> create, drop, alter, truncate
    DML(Data Manuplation Language) --> insert, update, delete, merge
    DCL(Data Control Language) --> grant(������ �ִ°�), revoke(������ ���Ѵ°�)
    TCL(Transaction Control Language) --> commit, rollback
 */
 -- DML(Data Manuplation Language)�� �� ���� commit �̰�,
 -- ������ DDL, DCL ���� �����ϸ� �ڵ�(auto)������ commit �� �Ͼ��.
 
 create table tbl_a
 (no    number
 ,name  varchar2(20)
 );
 
 insert into tbl_a(no, name) values(1,'�Ѽ���');
 commit;
 
 insert into tbl_a(no, name) values(2,'�μ���');
 
 create table tbl_b
 (
  no    number,
  name  varchar2(20)
 ); -- auto commit �� �߻���.
 
 rollback;
 
 select *
 from tbl_a;
 -- �μ��Դ� rollback �� ���� �ʰ� insert �Ǿ��� ����.

-- 4453