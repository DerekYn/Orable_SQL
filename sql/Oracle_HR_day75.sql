 ----------------------------- >>> 트리거(Trigger) <<<--------------------------------

      is 대신 declare 를 사용한다. !!!

  trigger를 사용하여 transaction처리를 해보자.
  다수의 테이블이 존재할때 어떤 한 테이블에 DML(insert, update, delete) 발생되면 다른 테이블에서도 
  관련된 DML작업이 발생되도록 만들어주는 것이 트리거이다.
  
  *** Trigger의 종류 ***
 1. Statement Trigger(문장트리거)
     ==> 어떤 테이블에 DML 되어질(진) 행의 컬럼값을 알아올 수 없다.
     
     -- Before Statement Trigger
      : 어떤 테이블에 DML 작업이 발생하기전에 
        처리해주는 작업으로서 주로 검사(체크)용도로 쓰인다.

     -- After Statement Trigger
      : 어떤 테이블에 DML 작업이 발생한 다음에
        다른 테이블에 관련된 DML 작업이 자동적으로 일어나도록 만드는것.

  2. Row Trigger(행트리거)
     ==> 어떤 테이블에 DML 되어질(진) 행의 컬럼값을 알아올 수 있다.

     -- Before Row Trigger
      : 어떤 테이블에 DML 작업이 발생하기전에 
        처리해주는 작업으로서 주로 검사(체크)용도로 쓰인다.
     
     -- After Row Trigger 
      : 어떤 테이블에 DML 작업이 발생한 다음에
        다른 테이블에 관련된 DML 작업이 자동적으로 일어나도록 만드는것.
 
 
 select *
 from tbl_member_login;
 
 select *
 from tbl_member_detail;
 
 
 -- 1. Before Statement Trigger
 /*
    tbl_member_login 테이블에 insert, update, delete 를 할 수 있는 시간대를 제한하도록 하겠습니다.
    월 ~ 금 까지 오전 10시 부터 오후 5시 이전까지만 가능하다.
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
                raise_application_error(-20001, '회원가입은 월 ~ 금까지 가능합니다.');
           when err_impossibletime then
                raise_application_error(-20001, '회원가입은 시간은 오전 10시부터 오후 5시까지 가능합니다.');
 end stbstri_tbl_member_login;
 
 insert into tbl_member_login(userid, passwd, name)
 values('superman','qwer1234$','정영광');
 -- 오류 보고 - ( 10 ~ 5 시에 실행시키면 문제 없다. )
 -- SQL 오류: ORA-20002: 오전 10시 부터 오후 5시 이전까지만 가능합니다.
 
 select *
 from tbl_member_login;
 
 rollback;

-- 5594