----------------- ********** 계층형 쿼리(Query) ( = select 문 ) ********* ---------------------
-- start with connect by prior 절 => ( 게시판에서 답변형 게시판에서 많이 사용됨 )

select level, employee_id, first_name || ' ' || last_name AS ENAME,
       job_id, manager_id
from employees
start with employee_id = 106
connect by prior manager_id = employee_id;  -- connect by prior employee_id = manager_id 와는 하늘과 땅차이다!!! 완전 다른것
 -- connect by prior 다음에 나오는 manager_id 컬럼의 값은 start with employee_id에 매핑된 행의 컬럼값이다. ★★★★★★★★★★★★★
 -- 즉 사원번호 106 행의 manager_id 컬럼의 값이다. ( 103 )
 -- connect by prior 103 = employee_id 이다.
 
 -- 106 -- 103 -- 102 -- 100  이런식으로 연결된다 실행시켜보면 암.
 
 -- vs 위와 비교 해보기
 
 select level, employee_id, first_name || ' ' || last_name AS ENAME,
       job_id, manager_id
from employees
start with employee_id = 100
connect by prior employee_id = manager_id
order by level;
 -- 이번에는 최고참 부터 거꾸로 간다. 최고참에게 컴펌받는사람들을 나열하고 다시 그 사람에게 컴펌 받는 사람들을 나열

  

 
 select level, employee_id,
        lpad(' ', (level - 1) * 3, ' ') || first_name || ' ' || last_name AS ENAME,
        job_id, manager_id
from employees
start with employee_id = 100
connect by prior employee_id = manager_id;


-- 2519