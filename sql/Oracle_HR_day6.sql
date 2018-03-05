-- *** or, and, not, in 연산자에 대해서 알아본다. *** --
/*
  employees 테이블에서 부서번호가 30, 60, 90번 부서에 근무하는 사원들에 대해서
  사원번호, 사원명, 연봉(월급 * 12), 부서번호를 출력하세요.
*/


select employee_id as "사원번호", first_name || ' ' || last_name as "사원명",
    nvl(salary + (salary * commission_pct), salary) * 12 as "연봉", department_id as "부서번호"
from employees
where  department_id = 30 or department_id = 60 or department_id = 90;


select employee_id as "사원번호", first_name || ' ' || last_name as "사원명",
    nvl(salary + (salary * commission_pct), salary) as "월급", department_id as "부서번호"
from employees
where  department_id in(30, 60, 90);


select employee_id as "사원번호", first_name || ' ' || last_name as "사원명",
    nvl(salary + (salary * commission_pct), salary) * 12 as "연봉", department_id as "부서번호"
from employees
where department_id != 30 and  department_id != 60 and department_id != 90;


select employee_id as "사원번호", first_name || ' ' || last_name as "사원명",
    nvl(salary + (salary * commission_pct), salary) * 12 as "연봉", department_id as "부서번호"
from employees
where nvl(department_id, -9999) != 30 and
      nvl(department_id, -9999) != 60 and
      nvl(department_id, -9999) != 90
order by 4;
      
      
select employee_id as "사원번호", first_name || ' ' || last_name as "사원명",
        nvl(salary + (salary * commission_pct), salary) * 12 as "연봉", department_id as "부서번호"
from employees
where nvl(department_id, -9999) not in(30, 60, 90)
order by 4;


select employee_id as "사원번호", first_name || ' ' || last_name as "사원명",
        nvl(salary + (salary * commission_pct), salary)* 12 as "연봉", department_id as "부서번호"
from employees
where nvl(department_id, -9999) not in(30, 60, 90)
order by 4, 3 desc;



-- *** and, or, not 연산자의 우선순위가 있다. *** --
-- and, or, not 연산자가 혼용되어지면 우선순위를
-- 따르는데 not > and > or > 의 순위를 따라간다.
-- 우선순위에 있어서 최우선은 ( ) 이다.

select 2+3*4
from dual;
-- 14

/*
  employees 테이블에서 부서번호가 30, 50, 60번 부서에
  근무하는 사원들중에 연봉이 20000 이상 60000 이하인
  사원들만 사원번호, 사원명, 연봉(월금 * 12), 부서번호를 출력해라.
  부서번호별로 오름차순 정렬한 후
  연봉의 내림차순으로 정렬하여 출력하세요
*/

select employee_id as "사원번호", first_name || ' ' || last_name as "사원명",
        nvl(salary + (salary * commission_pct), salary) * 12 as "연봉", department_id as "부서번호"
from employees
where department_id = 30 or
      department_id = 50 or
      department_id = 60 and
      nvl(salary + (salary * commission_pct), salary) * 12 >= 20000 and
      nvl(salary + (salary * commission_pct), salary) * 12 <= 60000
order by 4, 3 desc;


select employee_id as "사원번호", first_name || ' ' || last_name as "사원명",
        nvl(salary + (salary * commission_pct), salary) * 12 as "연봉", department_id as "부서번호"
from employees
where (department_id = 30 or
      department_id = 50 or
      department_id = 60) and
      nvl(salary + (salary * commission_pct), salary) * 12 >= 20000 and
      nvl(salary + (salary * commission_pct), salary) * 12 <= 60000
order by 4, 3 desc;


select employee_id as "사원번호", first_name || ' ' || last_name as "사원명",
        nvl(salary + (salary * commission_pct), salary) * 12 as "연봉", department_id as "부서번호"
from employees
where department_id in(30, 50, 60) and
      nvl(salary + (salary * commission_pct), salary) * 12 >= 20000 and
      nvl(salary + (salary * commission_pct), salary) * 12 <= 60000
order by 4, 3 desc;

-- 847