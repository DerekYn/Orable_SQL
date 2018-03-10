----------------------$$$$$$$$$$$$$$$          분석함수         $$$$$$$$$$$$$$$----------------------------

-- ntile(n) 함수
    --  나타낼 행들을 n개로 나누어라 ( 딱 안나눠 지면 1부류가 1개 더 많은 식으로.. 다음은 2부류...)

select first_name || ' ' || last_name AS ENAME, salary
from employees
where department_id = 50;           -- 45 행


select first_name || ' ' || last_name AS ENAME, salary
from employees
where department_id = 80;           -- 34 행

select first_name || ' ' || last_name AS ENAME, salary,
       ntile(4) over(order by salary desc) AS CLASS
from employees
where department_id = 50;           -- 45 행

 -- 111111111111            1 부류  =>  12개
 -- 22222222222             2 부류  =>  11개
 -- 33333333333             3 부류  =>  11개
 -- 44444444444             4 부류  =>  11개

select first_name || ' ' || last_name AS ENAME, salary,
       ntile(4) over(order by salary desc) AS CLASS
from employees
where department_id = 80;           -- 34 행

 -- 111111111           1 부류  =>  9개
 -- 222222222           2 부류  =>  9개
 -- 33333333            3 부류  =>  8개
 -- 44444444            4 부류  =>  8개


-- 2293