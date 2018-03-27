  -- 2. After Statement Trigger
 /*
    tbl_member_login 테이블에 DML이 발생되어진 다음에
    tbl_gistory 테이블에 기록으로 남기고 싶다.
 */

 create table tbl_history
 (
    seq           number,
    table_name    varchar2(50),
    dmltype       varchar2(20),
    workdate      date default sysdate
 );
 
 
 create sequence seq_tbl_history
 start with 1
 increment by 1
 nomaxvalue
 nominvalue
 nocycle
 nocache;

-- insert

 create or replace trigger statri_tbl_member_login_insert
 after
 insert
 on tbl_member_login
 
 declare
 
 begin
      insert into tbl_history(seq, table_name, dmltype)
      values(seq_tbl_history.nextval, 'tbl_member_login', 'insert');
 
 end statri_tbl_member_login_insert;
 
 -- update
 
 create or replace trigger statri_tbl_member_login_update
 after
 update
 on tbl_member_login
 
 declare
  
 begin
      insert into tbl_history(seq, table_name, dmltype)
      values(seq_tbl_history.nextval, 'tbl_member_login', 'update');
 
 end statri_tbl_member_login_update;
 
 -- delete
 
 create or replace trigger statri_tbl_member_login_delete
 after
 delete
 on tbl_member_login
 
 declare
  
 begin
      insert into tbl_history(seq, table_name, dmltype)
      values(seq_tbl_history.nextval, 'tbl_member_login', 'delete');
 
 end statri_tbl_member_login_delete;
 
 
 
 insert into tbl_member_login(userid, passwd, name)
 values('superman','qwer1234$','정영광');
 
 update tbl_member_login set passwd = 'java1234$$'
 where userid = 'superman';
 
 delete from tbl_member_login
 where userid = 'superman';
 
 select *
 from tbl_member_login;
 
 select *
 from tbl_history;
 
 commit;
 
 rollback;

-- 5685