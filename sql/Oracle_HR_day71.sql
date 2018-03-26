 ------------------ ****  사용자 정의 예외절(EXCEPTION)  **** ----------------------
  예외절 = 오류절
  
  ※ 형식
  
  EXCEPTION
       WHEN   익셉션이름 1  [ OR  익셉션이름 2 ] THEN
              실행문장 1;
              실행문장 2;
       WHEN   익셉션이름 3  [ OR  익셉션이름 4 ] THEN
              실행문장 3;
              실행문장 4;
       WHEN OTHERS THEN
              실행문장 5;
              실행문장 6;
 
 
 
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
     -- dbms_output.put_line('암호는 8글자 이상의 영문자,숫자,특수기호가 혼합되어야 합니다.'); 
        raise err_passwd; 
        return;
     end if;

     select fun_jubuncheck(p_jubun)
          into
            v_jubunresult 
     from dual;
     
     if (v_jubunresult = 0) then
     -- dbms_output.put_line('올바른 주민번호가 아닙니다.');
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
              raise_application_error(-20001, '암호는 8글자 이상의 영문자,숫자,특수기호가 혼합되어야 합니다.');
              -- 사용자 정의 오류번호는 -20001부터 -20999 까지의 범위내에서 만들어야 한다. (나머지 번호들은 이미 다 정의되어 있음)
          when err_jubun then
              raise_application_error(-20002, '올바른 주민번호가 아닙니다.');
               -- -20001 번호는 중복되도 된다, 사실 중복되는 개념이 아니라 그냥 -20001부터 -20999 까지의 범위내로 지정만 해주면 다 된다.

          when err_timeday then
              raise_application_error(-20001, '토,일요일 및 평일 오후 2시부터 오후 3시전까지는 회원가입이 불가합니다.');
end pcd_member_register;
 

-- 5290