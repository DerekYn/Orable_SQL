--================ *** Sub Query (서브 쿼리) *** ======================

-- Sub Query(서브 쿼리)란?
select 문 속에 또 다른 select 문이 포함되어져 있을때
포함되어진 select 문 Sub Query(서브 쿼리)라고 부른다.

select .....
from .....                       -> 바깥쪽 은 Main Query(메인쿼리) == 외부 쿼리
where ..... in( select .....
                from ......  )   ->  안쪽 은 Sub Query(서브쿼리) == 내부 쿼리


-- employees 테이블에서 기본급여가 가장 많은 사람과 가장 적은 사람의 정보를 나타내세요.

select *
from employees
where salary = (select max(salary) from employees) or
      salary = (select min(salary) from employees);
      
      
최고급여 ==> select max(salary) from employees;
최저급여 ==> select min(salary) from employees;

5492354426301
02-3704-7700

/*
--60, 80번 부서에서 근무하는 직원들중 20번 부서의 월급 평균보다 많이 받는 직원들의 정보를 출력하세요.
select employee_id
from employees                                            뭐뭐 중에 ~~ And 이용할 것
where department_id in(60,80) and
      월급 > (50번 부서 직원들의 '평균월급');
*/
      
select department_id AS 부서번호, employee_id AS 사원번호, first_name || ' ' || last_name AS 사원명,
       nvl(salary + (salary * commission_pct), salary) AS 월급
from employees
where department_id in(60,80) and
      nvl(salary + (salary * commission_pct), salary) > (select avg(nvl(salary + (salary * commission_pct), salary))
                                                         from employees
                                                         where department_id = 20);
                                     
                                     

select avg(nvl(salary + (salary * commission_pct), salary))
from employees
where department_id = 50;

select count(*)
from employees;


-- 2574