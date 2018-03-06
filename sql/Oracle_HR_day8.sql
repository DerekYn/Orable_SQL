-- *** like 연산자 *** --
select *
from employees
where department_id = 80;

select *
from employees
where department_id like 80;

update employees set first_name = 'J'
where employee_id = 100;

commit;

-- employees 테이블에서 first_name 의 값이 첫글자가
-- 'J'로 시작하는 사원들만 모든 정보를 나타내세요.

select *
from employees
where first_name like 'J%';
-- like 연산자와 함께 사용되어지는 %는 Wild Character 라고 부르는데
-- 그 뜻은 글자가 있든지 없든지 상관없다 라는 말이다

select *
from employees
where first_name like '%s';


select *
from employees
where first_name like '%ee%';

select *
from employees
where first_name like '%e%e%';


-- like 연산자와 함께 사용하는 _는 아무 글자 1개를 뜻한다. (무조건!! 글자가 들어와야한다.)
-- like 연산자와 함께 사용하는 %는 글자가 있든지 없든지 관계없다라는 말이다.
select first_name, last_name, department_id
from employees
where last_name like 'F_e%';


select employee_id as "사원번호", first_name || ' ' || last_name as "사원명", jubun as "주민번호"
from employees
where jubun like '______2%' or jubun like '______4';


create table tbl_watch
(watchname    varchar2(30),
blank         varchar2(200)
);

insert into tbl_watch(watchname, blank)
values('Gold', '순금 99.99% 함유 고급시계');

insert into tbl_watch(watchname, blank)
values('Silver', '고객만족도 99.99점 획득 고급시계');

commit;

-- tbl_watch 테이블에서 blank 컬럼에 99.99% 라는 
-- 글자가 들어있는 행만 추출하세요.

select *
from tbl_watch
where blank like '%99.99%%';

select *
from tbl_watch
where blank like '%99.99/%%' escape '/';

select *
from tbl_watch
where blank like '%99.99?%%' escape '?';

-- 939