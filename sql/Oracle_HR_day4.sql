----- ****  비교연산자 **** ------

 /* 
    employees 테이블에서 부서번호가 50번인 부서에
    근무하는 사원들의 부서번호, 사원번호, 사원명, 월급을
    나타내세요. 
 */

 select department_id as "부서번호"
      , employee_id as "사원번호"
      , first_name || ' ' || last_name as "사원명"
      , nvl( salary + (salary * commission_pct), salary) as "월급" 
 from employees
 where department_id = 50
 order by nvl( salary + (salary * commission_pct), salary) desc; 


 select department_id as "부서번호"
      , employee_id as "사원번호"
      , first_name || ' ' || last_name as "사원명"
      , nvl( salary + (salary * commission_pct), salary) as "월급" 
 from employees
 where department_id = 50
 order by "월급" desc;
 

 select department_id as "부서번호"
      , employee_id as "사원번호"
      , first_name || ' ' || last_name as "사원명"
      , nvl( salary + (salary * commission_pct), salary) as "월급" 
 from employees
 where department_id = 50
 order by 4 desc;

/*
  employees 테이블에서 부서번호가 50번에 근무하는 사원들을 제외한 사원들에 대해서
  부서번호, 사원번호, 사원명, 월급을 나타내세요.
*/
  select department_id as "부서번호"
      , employee_id as "사원번호"
      , first_name || ' ' || last_name as "사원명"
      , nvl( salary + (salary * commission_pct), salary) as "월급" 
 from employees
 where nvl(department_id, -9999) != 50       -- 50번은 NULL(존재하지 않는) 이라서 아예 비교 조차 할 수 없으므로
 order by 1;                                 -- nvl(department_id, -9999) = -9999 처럼 department_id가 NULL 이면 -9999를 대입 후 비교해준다.

-- null 은 존재하지 않는 것이므로 비교대상이 될 수가
-- 없으므로 비교연산자(=, !=, <>, ^=, >, <, >=, <=)를
-- 사용할 수 없다. 그래서 is를 사용해야하고, 비교연산자를 사용하려면
-- nvl() 함수로 처리해야 한다.

select *
from employees
where department_id is null;

  select department_id, nvl(department_id, -9999), first_name, last_name
  from employees;

desc employees;

select department_id, first_name, last_name
from employees
where nvl(department_id, -9999) = -9999;

  select department_id as "부서번호"
      , employee_id as "사원번호"
      , first_name || ' ' || last_name as "사원명"
      , nvl( salary + (salary * commission_pct), salary) as "월급" 
 from employees
 where nvl(department_id, -9999) <> 50      -- 같지 않다.  [ != , <> ]
 order by 1;  
  
 select department_id as "부서번호"
      , employee_id as "사원번호"
      , first_name || ' ' || last_name as "사원명"
      , nvl( salary + (salary * commission_pct), salary) as "월급" 
 from employees
 where not nvl(department_id, -9999) = 50
 order by 4 desc;
 
 select *
 from employees
 where department_id is not null;


/*
  오라클은 테이블에 저장된 데이터값에 대해서만
  대, 소문자를 구분한다.
  employees 테이블에서 성(first_name)이 'John'인
  사원만 사원번호, 사원명, 기본급여의 정보를
  추출하세요.
*/

select employee_id, first_name || ' ' || last_name, salary
from employees
where first_name = 'John';

-- 719