 -- 5.3  등수 rank, 서열 dense_rank
  
  select department_id AS 부서번호, employee_id AS 사원번호, first_name || ' ' || last_name AS 사원명,
         salary AS 연봉, rank() over(order by salary desc) AS 전체기본급여순위,
                        dense_rank() over(order by salary desc) AS 전체기본급여서열,
                        rank() over( partition by department_id order by salary desc ) AS 부서내기본급여순위,  --  partition by department_id 부서 번호별로 순위를 맥이겠다.
                        dense_rank() over( partition by department_id order by salary desc ) AS 부서내기본급여서열
  from employees
  order by 1;
  
  
  select department_id AS 부서번호, employee_id AS 사원번호, first_name || ' ' || last_name AS 사원명,
         salary AS 연봉, rank() over(order by salary desc) AS 전체기본급여순위
  from employees
  where rank() over(order by salary desc) <= 10;  -- 오류 where절에는 rank() over()는 할 수 없다. ===> 인라인 뷰로 해결한다.
  
  
  select *
  from
 ( 
  select department_id AS 부서번호, employee_id AS 사원번호, first_name || ' ' || last_name AS 사원명,
         salary AS 연봉, rank() over(order by salary desc) AS RANKING,
         rank() over( partition by department_id order by salary desc ) AS DEPTRANKING
  from employees
 ) V
 where V.DEPTRANKING = 1;           -- 각 부서별로 연봉 탑 출력
 
 
 --  5.4  -- greatest, least  -- 가장 큰 것과 작은 것을 출력
 
 select greatest(10, 90, 100, 80),  -- 가장 큰 것
        least(10, 90, 100, 80)      -- 가장 작은 것
 from dual;
 
 select greatest('김유신', '윤봉길', '허준', '고두심'),
        least('김유신', '윤봉길', '허준', '고두심')
 from dual;

-- 1762