--  ******** ��ప(rollup, cube, grouping sets) ******** --

 --  1. rollup(a,b,c) == grouping sets((a,b,c), (a,b), (a), ())   =>   (���� rollup���θ�)
 
 --     rollup(V.department_id, V.gender) == grouping sets((V.department_id, V.gender), ((V.department_id), ())
 
 --  2. cube(a,b,c) == grouping sets((a,b,c), (a,b), (a,c), (b,c), (a), (b), (c), ())   =>   (���� cube�� �ϸ�)
 
 --     cube((V.department_id, V.gender)) == grouping sets((V.department_id, V.gender), (V.department_id), (V.gender), ())

                    
select case grouping(�μ���ȣ)                -- rollup���θ� �ϸ� �ణ ������ ���� ( ��ü ����, ��ü ���� �ȶ� )
           when 0 then nvl(to_char(�μ���ȣ), '����')
           else '��ü'
       end AS �μ���ȣ2,
       case grouping(GENDER)
            when 0 then Gender
            else '��ü'
       end AS GENDER2,
       count(*),
       round(((count(*) / (select count(*) from employees)) * 100), 1) AS "%"
from            
(         
select case when substr(jubun, 7, 1) in('1', '3') then '��'
            else '��'
       end AS GENDER,
       department_id AS �μ���ȣ
from employees
) V
-- group by rollup(�μ���ȣ, GENDER)     -- �Ʒ��� ����
group by grouping sets((�μ���ȣ, GENDER), (�μ���ȣ), ())
order by 1, 2;



select case grouping(�μ���ȣ)                -- cube�� �ϸ� rollup ���� ���� ���� �� ( ��ü ����, ��ü ���� �� )
           when 0 then nvl(to_char(�μ���ȣ), '����')
           else '��ü'
       end AS �μ���ȣ2,
       case grouping(GENDER)
            when 0 then Gender
            else '��ü'
       end AS GENDER2,
       count(*),
       round(((count(*) / (select count(*) from employees)) * 100), 1) AS "%"
from            
(         
select case when substr(jubun, 7, 1) in('1', '3') then '��'
            else '��'
       end AS GENDER,
       department_id AS �μ���ȣ
from employees
) V
-- group by cube(�μ���ȣ, GENDER)     -- �Ʒ��� ����
group by grouping sets((�μ���ȣ, GENDER), (�μ���ȣ), (GENDER), ())
order by 1, 2;



select case grouping(�μ���ȣ)               
           when 0 then nvl(to_char(�μ���ȣ), '����')
           else '��ü'
       end AS �μ���ȣ2,
       case grouping(GENDER)
            when 0 then Gender
            else '��ü'
       end AS GENDER2,
       count(*),
       round(((count(*) / (select count(*) from employees)) * 100), 1) AS "%"
from            
(         
select case when substr(jubun, 7, 1) in('1', '3') then '��'
            else '��'
       end AS GENDER,
       department_id AS �μ���ȣ
from employees
) V
group by grouping sets((�μ���ȣ, GENDER), (�μ���ȣ), ())
order by 1, 2;



select case grouping(�μ���ȣ)               
           when 0 then nvl(to_char(�μ���ȣ), '����')
           else '��ü'
       end AS �μ���ȣ2,
       case grouping(GENDER)
            when 0 then Gender
            else '��ü'
       end AS GENDER2,
       count(*),
       round(((count(*) / (select count(*) from employees)) * 100), 1) AS "%"
from            
(         
select case when substr(jubun, 7, 1) in('1', '3') then '��'
            else '��'
       end AS GENDER,
       department_id AS �μ���ȣ
from employees
) V
group by grouping sets((�μ���ȣ, GENDER), (�μ���ȣ), (GENDER), ())
order by 1, 2;



select case grouping(department_id)
           when 0 then nvl(to_char(department_id), '����')
           else '��ü'
       end AS �μ���ȣ,
       case grouping(gender)
           when 0 then gender
           else '��ü'
       end AS ����,
       count(*),
       round(((count(*) / (select count(*) from employees)) * 100), 1) AS "%"
from
(
select case 
          when substr(jubun, 7, 1) in('1','3') then '��'
          else '��'
       end AS Gender,
       department_id
from employees
) V
group by grouping sets((department_id, Gender), (department_id), (gender), ())
order by 1,2;




select case grouping(department_id)
           when 0 then nvl(to_char(department_id), '����')
           else '��ü'
       end AS �μ���ȣ,
       to_char(round(sum(nvl( salary + (salary * commission_pct), salary) / 12)), '$999,999,999') AS �������հ�,
       round(((sum(nvl( salary + (salary * commission_pct), salary)) / (select sum(nvl( salary + (salary * commission_pct), salary)) from employees)) * 100), 1) AS "%",
       to_char(round(sum(nvl( salary + (salary * commission_pct), salary) / 12) / count(*)), '$999,999,999') AS ���������
from employees
group by rollup(department_id);


select count(*) AS ��ü�����,
       sum(case ���ɴ� when 0 then 1  else null end) AS "10��̸�",
       sum(case ���ɴ� when 10 then 1 else null end) AS "10��",
       sum(case ���ɴ� when 20 then 1 else null end) AS "20��",
       sum(case ���ɴ� when 30 then 1 else null end) AS "30��",
       sum(case ���ɴ� when 40 then 1 else null end) AS "40��",
       sum(case ���ɴ� when 50 then 1 else null end) AS "50��",
       sum(case ���ɴ� when 60 then 1 else null end) AS "60��"
from
(
select trunc(extract(year from sysdate) - (to_number(substr(jubun, 1, 2)) + (case when substr(jubun, 7, 1) in ('1','2') then 1900 else 2000 end)) + 1, -1) AS ���ɴ�
from employees
) V;



select case grouping(�μ���ȣ)
           when 0 then nvl(to_char(�μ���ȣ), '����')
           else '��ü'
       end AS �μ���ȣ,
       sum(case ���� when '��' then 1 else 0 end) AS ����,
       sum(case ���� when '��' then 1 else 0 end) AS ����,
       count(*) AS ���ο���
from
(
select case when substr(jubun, 7, 1) in ('1', '3') then '��' else '��' end AS ����,
       department_id AS �μ���ȣ
from employees
) V
group by rollup(�μ���ȣ);



-- having  VS  where �� ������
-- having �� ������ group by�� ���� ����, group by �� ����� �ѹ��� �ɷ��� ����Ѵ�.? ( �׷��Լ��� ���� ������ )
-- where �� �ܼ��� �ο��ϳ��ϳ��� ���� ����

select department_id, count(*)
from employees
group by department_id
having count(*) >= 10       -- where count(*) >= 10   ����!!!
order by 1;


select department_id AS �μ���ȣ, to_char(sum(nvl(salary + (salary * commission_pct), salary)), '$999,999,999') AS ��������
from employees
group by department_id
having sum(nvl(salary + (salary * commission_pct), salary)) >= 50000
order by 1;


-- 2085