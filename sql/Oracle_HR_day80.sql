 ------------------------------------------------------------------------------------------
 -- 문제
 create table tbl_history2
 (
    seq           number,
    table_name    varchar2(100),
    dmltype       varchar2(20),
    content       varchar2(1000),
    workdate      date default sysdate
 );
 
 create sequence seq_tbl_history2
 start with 1
 increment by 1
 nomaxvalue
 nominvalue
 nocycle
 nocache;
 
 -- tbl_member_login 테이블에 insert 가 되어진 다음에
 -- 자동적으로 tbl_history2 테이블에 기록되게 작성.
 
 -- tbl_member_login 테이블에 update 가 되어진 다음에 content 변수에 내용 저장
 -- 자동적으로 tbl_history2 테이블에 기록되게 작성.
 
  -- tbl_member_login 테이블에 delete 가 되어진 다음에
 -- 자동적으로 tbl_history2 테이블에 기록되게 작성.
 
 create or replace trigger question2
 before
 insert or update
 on tbl_member_login
 for each row
 
 declare
 
 begin
      
 end question2;
 
 
 
 insert into tbl_member_login(userid, passwd, name)
 values('superman','qwer1234$','정영광');
 
 update tbl_member_login set passwd = 'java1234$$'
 where userid = 'superman';
 
 delete from tbl_member_login
 where userid = 'superman';
 
 select *
 from tbl_member_login;
 
 select *
 from tbl_history2;

-- 5895