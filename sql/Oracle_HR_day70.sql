 --------------------------------- *** 회원가입 *** ---------------------------------
 
 create table tbl_member_login
 (
    userid   varchar2(20)   not null,
    passwd   varchar2(20)   not null,   -- 그냥 varchar2(20)은 20 byte...
    name     Nvarchar2(20)   not null,  -- Nvarchar2(20)은 한글 영자 20글자수 가능...
    constraint PK_tbl_member_login primary key(userid)
 );
 
 create table tbl_member_detail
 (
    fk_userid     varchar2(20)   not null,
    jubun         varchar2(13),
    address       varchar2(200),
    tel           varchar2(20),
    email         varchar2(30),
    point         number default 0,
    registerday   date default sysdate,
    constraint PK_tbl_member_detail primary key(fk_userid),
    constraint FK_tbl_member_detail_fk_userid foreign key(fk_userid)
               references tbl_member_login(userid)
               on delete cascade,
    constraint UQ_tbl_member_detail_jubun unique(jubun)
 );
  
 
 create or replace procedure pcd_member_register
 (p_userid  IN  tbl_member_login.userid%type
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

 begin
  
     select func_passwdcheck(p_passwd) 
          into
            v_passwdresult
     from dual;

     if (v_passwdresult = 0) then
        dbms_output.put_line('암호는 8글자 이상의 영문자,숫자,특수기호가 혼합되어야 합니다.'); 
        return;
     end if;

     select fun_jubuncheck(p_jubun)
          into
            v_jubunresult 
     from dual;
     
     if (v_jubunresult = 0) then
        dbms_output.put_line('올바른 주민번호가 아닙니다.');
        return;
     end if;

     insert into tbl_member_login(userid, passwd, name)
     values(p_userid, p_passwd, p_name);

     insert into tbl_member_detail(fk_userid, jubun, address, tel, email)
     values(p_userid, p_jubun, p_address, p_tel, p_email); 

     select count(*) 
          into v_cnt_loginfrom tbl_member_login
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

end pcd_member_register;
 
 
 commit;
 
 delete from tbl_member_login
 where userid = 'hongkd';
 
 exec pcd_member_register('hongkd', 'asdfqwer12!3', '홍길동', '9511561651651', '경기도 용인시', '01012345678', 'ghdrlfehd@gmail.com');
 
 select *
 from tbl_member_login;
 
 select *
 from tbl_member_detail;

-- 5189