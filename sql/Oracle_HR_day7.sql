-- 범위를 나타내어주는 연산자가 있다.
-- A 부터 B 까지 ==> between A and B

select employee_id as "사원번호", first_name || ' ' || last_name as "사원명",
        nvl(salary + (salary * commission_pct), salary) * 12 as "연봉", department_id as "부서번호"
from employees
where department_id in(30, 50, 60) and
      nvl(salary + (salary * commission_pct), salary) * 12 between 20000 and 60000
order by 4, 3 desc;

-- in 보다는 or을, between and 보다는 >= 을 사용할 것을 권장

-- 860