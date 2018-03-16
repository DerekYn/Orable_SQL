----------------------------------------------------------------------------------------------------------------
  부서번호      부서명      부서주소      부서장명      사원번호      사원명      연봉      부서연봉평균차액      부서내연봉등수
 ----------------------------------------------------------------------------------------------------------------
employees   departments  locations   departments  employees   employees  employees   employees       employees
    E             D          L            D           E           E           E         E                 E
 
 
 --1992
 select 부서번호, 부서명, 부서주소, 부서장명, 사원번호, 사원명, 연봉, 연봉 - 부서평균연봉 AS 부서연봉평균차액,
        rank() over(partition by 부서번호 order by 연봉 - 부서평균연봉 desc) AS 부서내연봉등수
 from
 (
  select E.department_id AS 부서번호,
        D.department_name AS 부서명,
        L.Street_Address AS 부서주소,
        E2.first_name || ' ' || E2.last_name AS 부서장명,
        E.Employee_Id AS 사원번호,
        E.first_name || ' ' || E.last_name AS 사원명,
        nvl(E.salary + (E.salary * E.commission_pct), E.salary) * 12 AS 연봉
 from employees E, employees E2, departments D, locations L
 where E.department_id = D.department_id(+) and
       D.Location_id = L.Location_id(+) and
       D.Manager_Id = E2.Employee_Id(+)
 ) V,
(
  select department_id, trunc( avg(nvl(salary + (salary*commission_pct), salary)) ) * 12 AS 부서평균연봉
  from employees
  group by department_id
) B
where V.부서번호 = B.Department_Id(+)
order by 1;