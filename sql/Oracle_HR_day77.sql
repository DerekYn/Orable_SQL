 -- 3. Before Row Trigger
 /*
    Row Trigger 에서 insert 되어진 한 행의 값은
    : new 라는 곳에 저장된다.  ★★★★★
    
    Row Trigger 에서 delete 되어진 한 행의 값은
    : old 라는 곳에 저장된다.  ★★★★★
    
    update 란 기존행이 delete 되어지고 나서
    새로운 행이 insert 되어지는 것이다.
    그러므로 Row Trigger 에서 update가 발생되어 지면
    update 하기 이전의 행의 값은 : old에 저장되어 지고,
    update 가 끝난 행의 값은 : new 저장 된다.
 
    tbl_member_login 테이블에 insert 나 update를 하기전
    passwd 컬럼의 값을 검사해서 우리의 요구조건에 맞으면 insert 나 update를 허락해주고,
                                  요구조건에 맞지 않으면 오류절을 띄우도록 한다.
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
                 raise_application_error(-20001, '암호는 영자, 숫자, 특수문자가 혼합된 8글자 이상 20글자 미만이어야 합니다.');
       
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
               rollback;  -- trigger 안에서는 commit 도 rollback 도 할 수 없다.
               raise_application_error(-20001, '주민등록번호를 확인해주세요.');
 
 end rowbtri_tbl_member_detail;
 
 
 
 insert into tbl_member_login(userid, passwd, name)
 values('superman','qwer1234$','정영광');
 
 insert into tbl_member_detail(fk_userid, jubun, address, tel, email)
 values('superman', '9208101249516', '경기도 용인시', '01049150230', 'ashdkljf@gmail.com'); 
 --오류 보고 -
 -- SQL 오류: ORA-20001: 주민등록번호를 확인해주세요.
 
 select *
 from tbl_member_login;
 
 select *
 from tbl_member_detail;
 
 rollback;