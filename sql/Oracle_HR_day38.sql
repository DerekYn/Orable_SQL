----------------------------------------------------------------------------------       
 �μ���ȣ    �μ���ȣ     �����      �Ի�����        ���ӻ����ȣ       ���ӻ����
----------------------------------------------------------------------------------              
       
 -- 1992      
 select A1.Department_Id AS �μ���ȣ,
        A1.Employee_Id AS �����ȣ,
        A1.first_name || ' ' || A1.last_name AS �����,
        A1.Hire_Date AS �Ի�����,
        A1.Manager_Id AS ���ӻ����ȣ,
        A2.first_name || ' ' || A2.last_name AS ���ӻ����
 from employees A1, employees A2
 where A1.Manager_Id = A2.Employee_Id(+) and A1.department_id in(20, 50, 60)
 order by 1, 2;
 
 --1999
  select A1.Department_Id AS �μ���ȣ,
        A1.Employee_Id AS �����ȣ,
        A1.first_name || ' ' || A1.last_name AS �����,
        A1.Hire_Date AS �Ի�����,
        A1.Manager_Id AS ���ӻ����ȣ,
        A2.first_name || ' ' || A2.last_name AS ���ӻ����
 from employees A1 left join employees A2
 on A1.Manager_Id = A2.Employee_Id and A1.department_id in(20, 50, 60)
 order by 1, 2;


-- 3190