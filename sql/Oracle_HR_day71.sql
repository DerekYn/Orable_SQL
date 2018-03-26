 ------------------ ****  ����� ���� ������(EXCEPTION)  **** ----------------------
  ������ = ������
  
  �� ����
  
  EXCEPTION
       WHEN   �ͼ����̸� 1  [ OR  �ͼ����̸� 2 ] THEN
              ���๮�� 1;
              ���๮�� 2;
       WHEN   �ͼ����̸� 3  [ OR  �ͼ����̸� 4 ] THEN
              ���๮�� 3;
              ���๮�� 4;
       WHEN OTHERS THEN
              ���๮�� 5;
              ���๮�� 6;
 
 
 
  create or replace procedure pcd_member_register
 (
  p_userid  IN  tbl_member_login.userid%type
 ,p_passwd  IN  tbl_member_login.passwd%type
 ,p_name    IN  tbl_member_login.name%type
 ,p_jubun   IN  tbl_member_detail.jubun%type
 ,p_address IN  tbl_member_detail.address%type
 ,p_tel     IN  tbl_member_detail.tel%type
 ,p_email   IN  tbl_member_detail.email%type
 )
 is
   v_passwdresult  number(1);
   v_jubunresult   number(1);
   v_cnt_login     number(1);
   v_cnt_detail    number(1);

   err_passwd      exception;
   err_jubun       exception;
   err_timeday     exception;
 begin
     if ( to_char(sysdate, 'd') in('1','7') OR
          to_char(sysdate, 'hh24') = '14' ) 
        then raise err_timeday;
     end if;
     
     select func_passwdcheck(p_passwd) 
          into
            v_passwdresult
     from dual;

     if (v_passwdresult = 0) then
     -- dbms_output.put_line('��ȣ�� 8���� �̻��� ������,����,Ư����ȣ�� ȥ�յǾ�� �մϴ�.'); 
        raise err_passwd; 
        return;
     end if;

     select fun_jubuncheck(p_jubun)
          into
            v_jubunresult 
     from dual;
     
     if (v_jubunresult = 0) then
     -- dbms_output.put_line('�ùٸ� �ֹι�ȣ�� �ƴմϴ�.');
        raise err_jubun;
        return;
     end if;

     insert into tbl_member_login(userid, passwd, name)
     values(p_userid, p_passwd, p_name);

     insert into tbl_member_detail(fk_userid, jubun, address, tel, email)
     values(p_userid, p_jubun, p_address, p_tel, p_email); 

     select count(*) 
          into v_cnt_login
     from tbl_member_login
     where userid = p_userid;

     select count(*)
          into v_cnt_detail
     from tbl_member_detail
     where fk_userid = p_userid;

     if(v_cnt_login * v_cnt_detail = 1) 
        then commit;
     else 
        rollback;
     end if;

     exception 
          when err_passwd then
              raise_application_error(-20001, '��ȣ�� 8���� �̻��� ������,����,Ư����ȣ�� ȥ�յǾ�� �մϴ�.');
              -- ����� ���� ������ȣ�� -20001���� -20999 ������ ���������� ������ �Ѵ�. (������ ��ȣ���� �̹� �� ���ǵǾ� ����)
          when err_jubun then
              raise_application_error(-20002, '�ùٸ� �ֹι�ȣ�� �ƴմϴ�.');
               -- -20001 ��ȣ�� �ߺ��ǵ� �ȴ�, ��� �ߺ��Ǵ� ������ �ƴ϶� �׳� -20001���� -20999 ������ �������� ������ ���ָ� �� �ȴ�.

          when err_timeday then
              raise_application_error(-20001, '��,�Ͽ��� �� ���� ���� 2�ú��� ���� 3���������� ȸ�������� �Ұ��մϴ�.');
end pcd_member_register;
 

-- 5290