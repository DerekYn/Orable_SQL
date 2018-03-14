  -- 1. SQL 1992 CODE 방식 ( WHERE )
  select *                      -- 2889  
  from employees, departments;  -- 모든 경우의 수 (Catersian Product)
    
  select *                      -- EQUI JOIN 이라 부른다.          
  from employees, departments
  where employees.department_id = departments.department_id;
  
  select *                      -- EQUI JOIN 이라 부른다.          
  from employees E, departments D
  where E.department_id = D.department_id;
  
  -- 2. SQL 1999 CODE 방식 ( ON )
  select *                       -- INNER JOIN 이라 부른다. ( 내부조인 )  --> null 값은 생략한다.
  from employees E inner join departments D  -- INNER JOIN 에서 ( INNER )는 생략가능하다.
  on E.department_id = D.department_id;
  
  ----------------------------------------------------------------------------------
  -- 1. SQL 1992 CODE 방식 ( WHERE )
  select *                               
  from employees E, departments D      -- (+)로 null 값도 표현
  where E.department_id = D.department_id(+); -- employees 를 다보여준다.
  
  select *                              
  from employees E, departments D
  where E.department_id(+) = D.department_id; -- department 를 다보여준다.
  
  
  -- 2. SQL 1999 CODE 방식 ( ON ) -- OUTER JOIN 이라 부른다. ( 외부조인 )  --> null 값은 어떻게 할지 결정 할 수 있다.
  select *                         -- employees 를 다보여준다.
  from employees E left outer join departments D  
  on E.department_id = D.department_id;
                                  -- OUTER JOIN 에서 (OUTER)는 생략이 가능하다.
  select *                         -- department 를 다보여준다.
  from employees E right outer join departments D  
  on E.department_id = D.department_id;
  
--===============================================================================
  -- INNER JOIN 과 OUTER JOIN 의 공통점
  -- INNER, OUTER 에서는 그 구분을 LEFT와 RIGHT로 한다. 위에 참조       ( ON )
  -- 차이점 알아보기.. null의 처리 방법(내부조인은 무시 / 외부조인은 처리 방법 결정가능)
  
  select *
  from employees E full join departments D  -- OUTER 생략가능
  on E.department_id = D.department_id;
  
  select *
  from employees E full join departments D  -- 왼쪽보고 싶다. left
  on E.department_id = D.department_id;     -- 오른쪽보고 싶다. right
                                            -- 전부다보고 싶다. full
                                            
                                            
 ----------------------------------------------------------------
  부서번호    사원번호    사원이름    월급     전체평균월급     평균차액
 ----------------------------------------------------------------
  
  select department_id, employee_id, first_name || ' ' || last_name AS ENAME,
         nvl(salary + (salary * commission_pct), salary) AS MONTHSAL
  from employees;
  
  
  select trunc(avg(nvl(salary + (salary * commission_pct), salary))) AS AVGSAL
  from employees;
  
  -----------------------------------------------------------------------------
  
  select department_id AS 부서번호, employee_id AS 사원번호, first_name || ' ' || last_name AS 사원이름,
         nvl(salary + (salary * commission_pct), salary) AS 월급,
         V.AVGSAL AS 전체평균월급, nvl(salary + (salary * commission_pct), salary) - V.AVGSAL AS 평균차액
  from employees cross join (
                    select trunc(avg(nvl(salary + (salary * commission_pct), salary))) AS AVGSAL
                    from employees
                    ) V
  order by 5 desc;
  
  ------------------------------------------------
    부서번호    부서명    사원번호    사원명    월급
  ------------------------------------------------
  select E.department_id AS 부서번호, D.department_name AS 부서명,  -- 애매하게 양쪽에 있는 컬럼명은 E. 으로 표현해주기
         employee_id AS 사원번호, first_name || ' ' || last_name AS 사원명,
         nvl(salary + (salary * commission_pct), salary) AS 월급
  from employees E left join departments D
  on E.department_id = D.department_id;
  
   -------------------------------------------------------------------------
    부서번호    부서명    부서평균월급    사원번호    사원명    월급    부서평균과의차액
   -------------------------------------------------------------------------
    
   select A.department_id
      , A.department_name
      , B.employee_id
      , B.ENAME
      , A.AVGMONTHSAL
      , B.MONTHSAL
      , B.MONTHSAL - A.AVGMONTHSAL
        AS 부서평균차액
 from (select V.department_id, D.department_name, V.AVGMONTHSAL
       from departments D right join (select department_id  -- 방향설정은 NULL 값을 출력하기 위해 NULL 값이 있는 방향으로 한다.
                                           , trunc( avg(nvl(salary + (salary*commission_pct), salary)) )
                                             AS AVGMONTHSAL
                                      from employees
                                      group by department_id ) V
 on D.department_id = V.department_id) A join (select department_id
                                                    , employee_id
                                                    , first_name || ' ' || last_name
                                                      AS ENAME
                                                    , nvl(salary + (salary*commission_pct), salary)
                                                      AS MONTHSAL
                                               from employees) B
 on nvl(A.department_id, -9999) = nvl(B.department_id, -9999)
 order by 1, 6 desc;

-- 2919