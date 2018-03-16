----------------------------------------------------------------------------------       
 부서번호    부서번호     사원명      입사일자        직속상관번호       직속상관명
----------------------------------------------------------------------------------              
       
 -- 1992      
 select A1.Department_Id AS 부서번호,
        A1.Employee_Id AS 사원번호,
        A1.first_name || ' ' || A1.last_name AS 사원명,
        A1.Hire_Date AS 입사일자,
        A1.Manager_Id AS 직속상관번호,
        A2.first_name || ' ' || A2.last_name AS 직속상관명
 from employees A1, employees A2
 where A1.Manager_Id = A2.Employee_Id(+) and A1.department_id in(20, 50, 60)
 order by 1, 2;
 
 --1999
  select A1.Department_Id AS 부서번호,
        A1.Employee_Id AS 사원번호,
        A1.first_name || ' ' || A1.last_name AS 사원명,
        A1.Hire_Date AS 입사일자,
        A1.Manager_Id AS 직속상관번호,
        A2.first_name || ' ' || A2.last_name AS 직속상관명
 from employees A1 left join employees A2
 on A1.Manager_Id = A2.Employee_Id and A1.department_id in(20, 50, 60)
 order by 1, 2;


-- 3190