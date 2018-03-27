 ----------------------------- >>> Ʈ����(Trigger) <<<--------------------------------

      is ��� declare �� ����Ѵ�. !!!

  trigger�� ����Ͽ� transactionó���� �غ���.
  �ټ��� ���̺��� �����Ҷ� � �� ���̺� DML(insert, update, delete) �߻��Ǹ� �ٸ� ���̺����� 
  ���õ� DML�۾��� �߻��ǵ��� ������ִ� ���� Ʈ�����̴�.
  
  *** Trigger�� ���� ***
 1. Statement Trigger(����Ʈ����)
     ==> � ���̺� DML �Ǿ���(��) ���� �÷����� �˾ƿ� �� ����.
     
     -- Before Statement Trigger
      : � ���̺� DML �۾��� �߻��ϱ����� 
        ó�����ִ� �۾����μ� �ַ� �˻�(üũ)�뵵�� ���δ�.

     -- After Statement Trigger
      : � ���̺� DML �۾��� �߻��� ������
        �ٸ� ���̺� ���õ� DML �۾��� �ڵ������� �Ͼ���� ����°�.

  2. Row Trigger(��Ʈ����)
     ==> � ���̺� DML �Ǿ���(��) ���� �÷����� �˾ƿ� �� �ִ�.

     -- Before Row Trigger
      : � ���̺� DML �۾��� �߻��ϱ����� 
        ó�����ִ� �۾����μ� �ַ� �˻�(üũ)�뵵�� ���δ�.
     
     -- After Row Trigger 
      : � ���̺� DML �۾��� �߻��� ������
        �ٸ� ���̺� ���õ� DML �۾��� �ڵ������� �Ͼ���� ����°�.
 
 
 select *
 from tbl_member_login;
 
 select *
 from tbl_member_detail;
 
 
 -- 1. Before Statement Trigger
 /*
    tbl_member_login ���̺� insert, update, delete �� �� �� �ִ� �ð��븦 �����ϵ��� �ϰڽ��ϴ�.
    �� ~ �� ���� ���� 10�� ���� ���� 5�� ���������� �����ϴ�.
 */
 
 create or replace trigger stbtri_tbl_member_login
 before 
 insert or update or delete
 on tbl_member_login
 declare
      v_hour  number(2);
      err_impossibleday   exception;
      err_impossibletime  exception;
 
 begin
      if to_char(sysdate, 'd') in('1', '7') then
           raise err_impossibleday;  
      end if;
      v_hour := to_number(to_char(sysdate, 'hh24'));
      if ( v_hour< 10 or v_hour >= 17 ) then
           raise err_impossibletime;
      end if;
      
      exception
           when err_impossibleday then
                raise_application_error(-20001, 'ȸ�������� �� ~ �ݱ��� �����մϴ�.');
           when err_impossibletime then
                raise_application_error(-20001, 'ȸ�������� �ð��� ���� 10�ú��� ���� 5�ñ��� �����մϴ�.');
 end stbstri_tbl_member_login;
 
 insert into tbl_member_login(userid, passwd, name)
 values('superman','qwer1234$','������');
 -- ���� ���� - ( 10 ~ 5 �ÿ� �����Ű�� ���� ����. )
 -- SQL ����: ORA-20002: ���� 10�� ���� ���� 5�� ���������� �����մϴ�.
 
 select *
 from tbl_member_login;
 
 rollback;

-- 5594