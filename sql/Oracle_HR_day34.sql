 ---- **** Multi Table Join(다중 테이블 조인) **** ----
  --> 3개 이상의 테이블을 가지고 조인 시켜주는 것이다.
  ---------------------------------------------------------------------------------
       부서번호           부서명      국가명       부서주소       사원번호    사원명    월급
  ---------------------------------------------------------------------------------
--  departments /  departments / countries /  locations /           employees
--   employees

   

 테이블명               조인조건컬러명
--------------------------------------------------------
 departments D         location_id       department_id
 locations   L         location_id       country_id
 countries   C         country_id
 employees   E                           department_id
 

 -- 1999 방법.
 select E.department_id,
        D.department_name,
        C.country_name,
        L.city || ' ' || L.street_address AS DEPTADDRESS,
        E.employee_id,
        E.first_name || ' ' || last_name AS ENAME,
        E.salary
 from departments D join locations L
 on D.location_id = L.location_id           -- 1 번째 결합
 
 right join employees E
 on D.department_id = E.department_id       -- 2 번째 결합   방향설정은 널값이 있는쪽으로 향하도록(NULL을 뽑기위함)
 
 join countries C
 on L.country_id = C.country_id             -- 3 번째 결합
 order by 1;           
 
 -- 1992 방법.


 -- 1999 방법.
 select E.department_id,      -- departments에도 있지만 null 값이 있는 employee에서 뽑아준다.
        D.department_name,
        E.Department_Id,
        E.first_name || ' ' || last_name AS ENAME,
        V.Avgmonthsal,
        nvl(E.salary + (E.salary * E.commission_pct), E.salary) AS MONTHSAL,
        nvl(E.salary + (E.salary * E.commission_pct), E.salary) - V.Avgmonthsal AS 부서평균차액
 from 
     (
      select department_id,
      trunc( avg(nvl(salary + (salary*commission_pct), salary)) ) AS AVGMONTHSAL
      from employees
      group by department_id
      ) V 
  left join departments D
  on V.department_id = D.department_id          -- 1 번째 조인
  
  left join employees E                         -- 2 번째 조인
  on nvl(V.department_id, -9999) = nvl(E.department_id, -9999)  -- desc employees;  해보고 not null인지 아닌지 확인후 조인(on) 작업하기
  order by 1, 6;
  
  desc employees;        -- 해보고 not null인지 아닌지 확인후 조인 작업하기




  -- 1992 방법
  select E.department_id,
        D.department_name,
        C.country_name,
        L.city || ' ' || L.street_address AS DEPTADDRESS,
        E.employee_id,
        E.first_name || ' ' || last_name AS ENAME,
        E.salary
  from countries C, locations L, departments D, employees E
  where C.country_id(+) = L.country_id AND
        L.location_id(+) = D.location_id AND
        D.department_id(+) = E.department_id
  order by 1;

  desc locations;
  desc employees;

-- 3007