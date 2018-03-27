 -- 3. Before Row Trigger
 /*
    Row Trigger ���� insert �Ǿ��� �� ���� ����
    : new ��� ���� ����ȴ�.  �ڡڡڡڡ�
    
    Row Trigger ���� delete �Ǿ��� �� ���� ����
    : old ��� ���� ����ȴ�.  �ڡڡڡڡ�
    
    update �� �������� delete �Ǿ����� ����
    ���ο� ���� insert �Ǿ����� ���̴�.
    �׷��Ƿ� Row Trigger ���� update�� �߻��Ǿ� ����
    update �ϱ� ������ ���� ���� : old�� ����Ǿ� ����,
    update �� ���� ���� ���� : new ���� �ȴ�.
 
    tbl_member_login ���̺� insert �� update�� �ϱ���
    passwd �÷��� ���� �˻��ؼ� �츮�� �䱸���ǿ� ������ insert �� update�� ������ְ�,
                                  �䱸���ǿ� ���� ������ �������� ��쵵�� �Ѵ�.
 */
 
 create or replace trigger rowbtri_tbl_member_login
 before
 insert or update
 on tbl_member_login
 for each row
 
 declare
       err_passwd exception;
       v_check number(1);
 begin
       select func_passwdcheck(:new.passwd)
             into 
                 v_check
       from dual;
       
       if ( v_check = 0 ) then
           raise err_passwd;
       end if;
       
       exception
            when err_passwd then 
                 raise_application_error(-20001, '��ȣ�� ����, ����, Ư�����ڰ� ȥ�յ� 8���� �̻� 20���� �̸��̾�� �մϴ�.');
       
 end rowbtri_tbl_member_login;
  
 
 
 create or replace trigger rowbtri_tbl_member_detail
 before
 insert or update
 on tbl_member_detail
 for each row
 
 declare
        v_check      number(1);
        err_jubun    exception;
 
 begin
 
      select func_jubuncheck(:new.jubun)
             into
                 v_check
      from dual;
      
       if ( v_check = 0 ) then
           raise err_jubun;
       end if;
      
      exception
           when err_jubun then
               rollback;  -- trigger �ȿ����� commit �� rollback �� �� �� ����.
               raise_application_error(-20001, '�ֹε�Ϲ�ȣ�� Ȯ�����ּ���.');
 
 end rowbtri_tbl_member_detail;
 
 
 
 insert into tbl_member_login(userid, passwd, name)
 values('superman','qwer1234$','������');
 
 insert into tbl_member_detail(fk_userid, jubun, address, tel, email)
 values('superman', '9208101249516', '��⵵ ���ν�', '01049150230', 'ashdkljf@gmail.com'); 
 --���� ���� -
 -- SQL ����: ORA-20001: �ֹε�Ϲ�ȣ�� Ȯ�����ּ���.
 
 select *
 from tbl_member_login;
 
 select *
 from tbl_member_detail;
 
 rollback;