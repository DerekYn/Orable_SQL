select *
 from employees;   

 select *
 from tbl_user;

 -- tbl_user 테이블에 데이터 입력하기
 insert into tbl_user(userid, passwd, name, addr)
 values('hansk', 'qwer1234', '한석규', '서울시 종로구');

 rollback;

 commit;

/*
 ※ DML(Data Manuplation Language) -- 데이터 조작어
 ==> 1. insert(입력)   2. update(변경)   3. delete(삭제)
 DML문은 바로 디스크에 적용되지 않고 메모리(RAM)상에서만 적용되어진다. 
 그래서 디스크에 적용(저장)을 하려면 commit; 을 해야하고, 
 만약에 디스크에 적용(저장)을 하지않으려면 rollback; 을 한다.

 이미 commit; 되어진 정보는 rollback; 해봐야 소용없다. 
 */

 insert into tbl_user(userid, passwd, name, addr)
 values('dusk', 'qwer1234', '두석규', '서울시 강남구');

 insert into tbl_user(userid, passwd, name, addr)
 values('sesk', 'qwer1234', '세석규', '서울시 강북구'); 

 commit;

 -- tbl_user 테이블에 존재하는 데이터 값을 변경하기
 update tbl_user set name='이순신', addr='경기도 용인시'

 select *
 from tbl_user;
 
 rollback;

 update tbl_user set name='이순신', addr='경기도 군포시'
 where userid = 'dusk';

 select *
 from tbl_user;

 commit;

 delete from tbl_user; 
 -- tbl_user 테이블에 있는 모든 행들을 삭제한다.

 select *
 from tbl_user; 

 rollback;

 delete from tbl_user
 where userid = 'dusk';
 -- tbl_user 테이블에 있는 userid가 'dusk'인 행만 삭제한다.

 commit;    
   
 select *
 from employees;

 -- employees 테이블에서 각 부서번호마다 존재하는 
 -- 직종ID 값을 출력하세요.

 select department_id, job_id
 from employees;

 -- select 되어진 결과물에서 행의 결과값이 중복되어 나온다면 
 -- 중복된 행을 제거하고 1개만 보이고 싶다. 
 -- 이럴때 select 바로 다음에 distinct 를 쓰면 된다.
 
 select distinct department_id, job_id
 from employees;

 -- select 되어진 결과물을 정렬(sort)하려면 
 -- order by 절을 사용하면 된다.
 
 select distinct department_id, job_id 
 from employees
 order by department_id asc; -- 오름차순 정렬

 select distinct department_id, job_id 
 from employees
 order by department_id desc; -- 내림차순 정렬

 select distinct department_id, job_id 
 from employees
 order by department_id; -- 오름차순 정렬

 select distinct department_id, job_id 
 from employees
 order by job_id asc; -- 오름차순 정렬

 select distinct department_id, job_id 
 from employees
 order by job_id desc; -- 내림차순 정렬

-- 621