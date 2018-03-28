 ---------------------------------------------------------------------------------
 -- 위에건 주민번호 오류나면 이미 입력됬을 tbl_member_login 도 rollback 해주라라고 해줬지만 trigger 안에서는 rollback 못해줘서.. 지금 다시함.
 
 create or replace procedure pcd_member_insert
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
      v_login_count     number(1);
      v_jubuncheck      number(1);
      err_jubun         exception;
 
 begin
     insert into tbl_member_login(userid, passwd, name)
     values(p_userid, p_passwd, p_name);
     
     select count(*) into v_login_count
     from tbl_member_login
     where userid = p_userid;
     
     if ( v_login_count = 1 ) then
     
         select func_jubuncheck(p_jubun)
                into
                   v_jubuncheck
         from dual;
         
         if ( v_jubuncheck = 1 ) then
             insert into tbl_member_detail(fk_userid, jubun, address, tel, email)
             values(p_userid, p_jubun, p_address, p_tel, p_email);
         else
              rollback;
              raise err_jubun;
         end if;
         commit;
      end if;
         
         exception
                when err_jubun then
                     raise_application_error(-20009, '올바른 주민번호를 입력하세요');
 
 end pcd_member_insert;
 
 
 exec pcd_member_insert('superman', 'qwer1234!', '정영광', '9204301249561', '경기도', '01082884818', 'asjdfi@gmail.com');
 
 select *
 from tbl_member_login;
 
 select *
 from tbl_member_detail;

-- 5837