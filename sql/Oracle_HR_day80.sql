 ------------------------------------------------------------------------------------------
 -- ����
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
 
 -- tbl_member_login ���̺� insert �� �Ǿ��� ������
 -- �ڵ������� tbl_history2 ���̺� ��ϵǰ� �ۼ�.
 
 -- tbl_member_login ���̺� update �� �Ǿ��� ������ content ������ ���� ����
 -- �ڵ������� tbl_history2 ���̺� ��ϵǰ� �ۼ�.
 
  -- tbl_member_login ���̺� delete �� �Ǿ��� ������
 -- �ڵ������� tbl_history2 ���̺� ��ϵǰ� �ۼ�.
 
 create or replace trigger question2
 before
 insert or update
 on tbl_member_login
 for each row
 
 declare
 
 begin
      
 end question2;
 
 
 
 insert into tbl_member_login(userid, passwd, name)
 values('superman','qwer1234$','������');
 
 update tbl_member_login set passwd = 'java1234$$'
 where userid = 'superman';
 
 delete from tbl_member_login
 where userid = 'superman';
 
 select *
 from tbl_member_login;
 
 select *
 from tbl_history2;

-- 5895