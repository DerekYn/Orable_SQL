 ----------------------------------------------------------------------------------------------------------------
  부서번호      부서명      부서주소      부서장명      사원번호      사원명      연봉      부서연봉평균차액      부서내연봉등수
 ----------------------------------------------------------------------------------------------------------------
employees   departments  locations   departments  employees   employees  employees   employees       employees
    E             D          L            D           E           E           E         E                 E
 
 --1999
 select E.Department_Id AS 부서번호,
        D.Department_Name AS 부서명,
        L.Street_Address AS 부서주소,
        E3.first_name || ' ' || E3.last_name AS 부서장명,
        E.employee_id AS 사원번호,
        E.first_name || ' ' || E.last_name AS 사원명,
        nvl(E.salary + (E.salary * E.commission_pct), E.salary) * 12 AS 연봉,
        nvl(E.salary + (E.salary * E.commission_pct), E.salary) * 12 - 부서연봉평균 AS 부서연봉평균차액,
        rank() over(partition by E.department_id order by nvl(E.salary + (E.salary * E.commission_pct), E.salary) * 12 - 부서연봉평균 desc) AS 부서내연봉등수
 from employees E left join departments D
 on E.department_id = D.department_id
 
 left join locations L
 on D.location_id = L.location_id
 
 left join ( 
              select department_id,
                     trunc(avg(nvl(salary + (salary * commission_pct), salary)) * 12) AS 부서연봉평균
              from employees
              group by department_id 
            ) E2
 on D.department_id = E2.department_id
 
 left join employees E3
 on D.manager_id = E3.employee_id;

-- 3257