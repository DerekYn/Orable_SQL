 --============================ 상관 Sub Query( == 서브 상관 쿼리) =======================
 -- 상관 Sub Query 라 함은 Main Query( == 외부쿼리)에서 사용된 테이블(뷰)에 존재하는 컬럼이
 -- Sub Query( == 내부쿼리)의 조건절(where절, having절)에 사용되어질 때를 말한다.
 
 
 
 -- 함수 없이 등수 구하기
 select department_id, employee_id, E.salary, (select count(*) + 1
                                               from employees
                                               where salary > E.salary) AS TOTALRANKING,
        rank() over(partition by department_id order by salary desc) AS DEPTRANKING
 from employees E
 order by E.salary desc;
 
 
 
 
 
 
  select department_id, employee_id, E.salary, (select count(*) + 1
                                               from employees
                                               where salary > E.salary) AS TOTALRANKING,
                                               (select count(*) + 1
                                               from employees
                                               where department_id > E.department_id
                                               and salary > E.salary) AS DEPTRANKING  -- 내가 속한 부서 내에서의 등수 AND!!!
 from employees E
 order by 1, 3 desc;

-- 2693