 --======================★★★ Pairwise Sub Query ★★★========================
 
 -- employees 테이블에서 부서번호별로 월급이 최대인 사원과
 --                    부서번호별로 월급이 최소인 사원의 정보를 출력하세요.
 
 select department_id, max(salary)
 from employees
 group by department_id;
 
 select department_id, min(salary)
 from employees
 group by department_id;
 
 
 -- NULL인 사람도 뽑아주기
 select nvl(to_char(department_id), '인턴') AS 부서번호, employee_id AS 사원번호, first_name || ' ' || last_name AS 사원명,
        nvl(salary + (salary * commission_pct), salary) AS 월급
 from employees
 where (nvl(department_id, -9999), salary) in (select nvl(department_id, -9999), min(salary)
                                               from employees
                                               group by department_id)
 OR 
       (nvl(department_id, -9999), salary) in (select nvl(department_id, -9999), max(salary)
                                               from employees
                                               group by department_id)
 order by 1, 4;

-- 2662