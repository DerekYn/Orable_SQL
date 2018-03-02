show user;
-- USER이(가) "HR"입니다.

select *
from dba_users;
-- 오라클 서버에 존재하는 사용자 계정 정보를 조회해주는 것이다.
/*
  ORA-00942: table or view does not exist
  00942. 00000 -  "table or view does not exist"
  *Cause:    
  *Action:
  5행, 6열에서 오류 발생
*/

select *
from tab;
-- 현재 오라클 서버에 접속한 사용자(지금은 HR) 소유의 테이블명과 뷰명을 조회해주는 쿼리문이다.

/*
  --------★★★★★★★★★ 아주아주아주아주아주 중요함 ★★★★★★★★ ----------
  ===== select 문의 처리순서 ======
  
  select 컬럼명          --- ⑤
  from 테이블명(뷰명)     --- ①
  where 조건절           --- ②   where 절이 뜻하는 것은 해당 테이블에서 조건에 만족하는 행을 메모리(RAM)에 로딩(올리는것)하는 것이다.
  group by 절           --- ③
  having 그룹함수 조건절  --- ④
  order by 절           --- ⑥ 
*/

select *
from departments; -- 부서테이블

/* column = field = attribute = 열
   row = record = tuple = 행
   table = entity = 테이블 
*/

describe departments;
desc departments;
-- departments 테이블의 컬럼 구성을 조회하는 것
/*
  DEPARTMENT_ID      ==> 부서번호
  DEPARTMENT_NAME    ==> 부서명
  MANAGER_ID         ==> 부서장의 사원번호
  LOCATION_ID        ==> 부서가 위치하는 지역번호
*/

select *
from employees;

desc employees;
/*
  EMPLOYEE_ID      ==> 사원번호
  FIRST_NAME       ==> 성
  LAST_NAME        ==> 명
  EMAIL            ==> 이메일
  PHONE_NUMBER     ==> 전화번호
  HIRE_DATE        ==> 입사일자
  JOB_ID           ==> 직종아이디
  SALARY           ==> 기본급여
  COMMISSION_PCT   ==> 커미션(수당)퍼센티지  0.2 가 기본급의 20%라는 말이다.
  MANAGER_ID       ==> 직속상관(사수)의 사원번호  
  DEPARTMENT_ID    ==> 본인이 근무하는 부서번호
*/

select *
from locations;  -- 부서의 위치를 알려주는 테이블이다.

select *
from countries;  -- 국가정보를 알려주는 테이블이다.

select *
from regions;  -- 대륙정보를 알려주는 테이블이다.

---- **** 테이블 생성 이후에 해야할 일은 테이블명과 컬럼명에 주석문을 꼭 달아주어야 한다.!!!!!!!! ***** -----
select *
from user_tab_comments;
-- 현재 오라클 서버에 접속한 사용자(지금은 HR)가 만든 테이블명, 뷰명에 주석문을 단 것을 조회하는 것이다.

select *
from user_tab_comments
where table_name = 'EMPLOYEES';
-- EMPLOYEES 테이블에 달려진 주석문을 조회하는 것이다.

select *
from user_col_comments
where table_name = 'EMPLOYEES';
-- EMPLOYEES 테이블의 컬럼에 달려진 주석문을 조회하는 것이다.


create table tbl_user 
(userid    varchar2(20) not null 
,passwd    varchar2(20) not null
,name      varchar2(20) not null
,addr      varchar2(100) 
,constraint PK_tbl_user_userid primary key(userid)
);


comment on table tbl_user 
is '회원정보 연습 테이블';

comment on column tbl_user.userid
is '사용자 아이디 필수입력사항';

comment on column tbl_user.passwd
is '암호의 길이는 최소 8글자 이상의 영문자, 숫자, 특수기호가 혼합되어야 함.';

select *
from user_tab_comments;

desc tbl_user;

select *
from user_col_comments
where table_name = 'TBL_USER';
-- TBL_USER 테이블의 컬럼에 달려진 주석문을 조회하는 것이다.


   ----- **** NULL 을 처리해주는 함수 **** ------
   1. nvl 
   
      select nvl(7,3), nvl(null, 3),
             nvl('이순신','거북선'), nvl(null,'거북선')
      from dual;
   
   2. nvl2 
   
      select nvl2(7,3,2), nvl2(null,3,2)
      from dual;
   
   
   /*
      null 은 존재하지 않는 것이므로 사칙연산(+ - * /)에 들어가면 
      그 결과는 무조건 null 이 된다.
   */
   
   select 2+3, 2+null, 3-null, 0*null, 1/null
   from dual;
   
   select employee_id, first_name, last_name, 
          salary, commission_pct,
          salary * commission_pct,
          nvl(salary + (salary * commission_pct), salary),
          nvl2(commission_pct, salary + (salary * commission_pct), salary)
   from employees;
   
   
   select employee_id as "사원번호" 
        , first_name "성"
        , last_name 이름
        , nvl(salary + (salary * commission_pct), salary) "월급"
   from employees; 
   
   select '자바' || 1234 || '오라클' || sysdate
   from dual;
   -- 자바1234오라클18/02/22
   
   
   select sysdate, to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')
   from dual;
   -- 18/02/22	2018-02-22 16:11:40
   
 select *
 from employees;

 -- 테이블에 컬럼 추가하기
 (employees 테이블에 주민번호 컬럼을 추가해보겠습니다.)

 select 0207304234567, '0207304234567'
 from dual;

 select 1, 01, 001,
       '1', '01', '001'
 from dual;

 alter table employees
 add jubun varchar2(13);

 select *
 from employees; 

 -- 테이블에 컬럼 삭제하기
 (employees 테이블에 주민번호 컬럼을 삭제해보겠습니다.) 

 alter table employees
 drop column jubun;
 
 -- 테이블 컬럼명 변경하기.
 alter table tbl_user rename column address to addr;

 select *
 from employees;   -- 194