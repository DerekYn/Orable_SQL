--==================================  ANY, ALL ==================================
 Sub Query 절에서 사용되어지는 ANY, ALL 은
 ANY는 OR와 흡사하고, ALL는 AND와 비슷하다.
 
 -- employees 테이블에서 salary 가 부서번호 30번의 salary와 동일한 사원들만 추출하세요.
 
 select department_id AS 부서번호, employee_id AS 사원번호, first_name || ' ' || last_name AS 사원명,
        nvl(salary + (salary * commission_pct), salary) AS 월급
 from employees
 where salary in(select salary
                 from employees
                 where department_id = 30);  -- in 을 썼을때(이것 또는 저것 또는 .. 또는 또는)...
                                             -- 그리고 ( in 대신에 = 을 쓰는 경우는 딱 한개의 값만 일치할때!!)
                 
 select department_id AS 부서번호, employee_id AS 사원번호, first_name || ' ' || last_name AS 사원명,
        nvl(salary + (salary * commission_pct), salary) AS 월급
 from employees
 where salary = ANY(select salary            -- any랑 in 은 완전 똑같.
                    from employees
                    where department_id = 30);
 
 
 select salary
 from employees
 where department_id = 30;   -- 11000, 3100, 2900, 2800, 2600, 2500
 
 
 -- 기본급여(salary)가 제일 꼴지를 제외한 모든 사원들만 사원번호, 월급을 나타내세요.
 
 select employee_id AS 사원번호, first_name || ' ' || last_name AS 사원명,
        nvl(salary + (salary * commission_pct), salary) AS 월급
 from employees
 where salary > ANY(select salary from employees)  -- 최저값 2100 보다는 크면 다 올라온다. OR의 특성상 
 order by 3;
      -- 3000 > 3100   => 거짓
      -- 3100 > 3000   => 참
 


 select employee_id AS 사원번호, first_name || ' ' || last_name AS 사원명,
        nvl(salary + (salary * commission_pct), salary) AS 월급
 from employees
 where salary >= ALL(select salary from employees);  -- 최댓값 24000 보다 크면 다 올린다. 허나 24000이 제일 크므로 최댓값을 출력
      -- 3000 >= 3100   => 거짓
      -- 3100 >= 3000   => 참
 
 
 
-- ★★★
 
 select employee_id AS 사원번호, first_name || ' ' || last_name AS 사원명,
        salary * commission_pct AS COMM
 from employees
 where salary * commission_pct >= All(select salary * commission_pct from employees
                                      where commission_pct is not null);   -- where (    ) is not null  => NULL 값은 제외하고.!!
                        -- 3000 >= 3100   => 거짓
                        -- 3100 >= 3000   => 참


-- 2632