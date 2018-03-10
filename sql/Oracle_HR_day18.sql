--  ******** 요약값(rollup, cube, grouping sets) ******** --

 --  1. rollup(a,b,c) == grouping sets((a,b,c), (a,b), (a), ())   =>   (예제 rollup으로만)
 
 --     rollup(V.department_id, V.gender) == grouping sets((V.department_id, V.gender), ((V.department_id), ())
 
 --  2. cube(a,b,c) == grouping sets((a,b,c), (a,b), (a,c), (b,c), (a), (b), (c), ())   =>   (예제 cube를 하면)
 
 --     cube((V.department_id, V.gender)) == grouping sets((V.department_id, V.gender), (V.department_id), (V.gender), ())

                    
select case grouping(부서번호)                -- rollup으로만 하면 약간 정보가 부족 ( 전체 남자, 전체 여자 안뜸 )
           when 0 then nvl(to_char(부서번호), '인턴')
           else '전체'
       end AS 부서번호2,
       case grouping(GENDER)
            when 0 then Gender
            else '전체'
       end AS GENDER2,
       count(*),
       round(((count(*) / (select count(*) from employees)) * 100), 1) AS "%"
from            
(         
select case when substr(jubun, 7, 1) in('1', '3') then '남'
            else '여'
       end AS GENDER,
       department_id AS 부서번호
from employees
) V
-- group by rollup(부서번호, GENDER)     -- 아래와 같음
group by grouping sets((부서번호, GENDER), (부서번호), ())
order by 1, 2;



select case grouping(부서번호)                -- cube를 하면 rollup 보다 정보 많이 뜸 ( 전체 남자, 전체 여자 수 )
           when 0 then nvl(to_char(부서번호), '인턴')
           else '전체'
       end AS 부서번호2,
       case grouping(GENDER)
            when 0 then Gender
            else '전체'
       end AS GENDER2,
       count(*),
       round(((count(*) / (select count(*) from employees)) * 100), 1) AS "%"
from            
(         
select case when substr(jubun, 7, 1) in('1', '3') then '남'
            else '여'
       end AS GENDER,
       department_id AS 부서번호
from employees
) V
-- group by cube(부서번호, GENDER)     -- 아래와 같음
group by grouping sets((부서번호, GENDER), (부서번호), (GENDER), ())
order by 1, 2;



select case grouping(부서번호)               
           when 0 then nvl(to_char(부서번호), '인턴')
           else '전체'
       end AS 부서번호2,
       case grouping(GENDER)
            when 0 then Gender
            else '전체'
       end AS GENDER2,
       count(*),
       round(((count(*) / (select count(*) from employees)) * 100), 1) AS "%"
from            
(         
select case when substr(jubun, 7, 1) in('1', '3') then '남'
            else '여'
       end AS GENDER,
       department_id AS 부서번호
from employees
) V
group by grouping sets((부서번호, GENDER), (부서번호), ())
order by 1, 2;



select case grouping(부서번호)               
           when 0 then nvl(to_char(부서번호), '인턴')
           else '전체'
       end AS 부서번호2,
       case grouping(GENDER)
            when 0 then Gender
            else '전체'
       end AS GENDER2,
       count(*),
       round(((count(*) / (select count(*) from employees)) * 100), 1) AS "%"
from            
(         
select case when substr(jubun, 7, 1) in('1', '3') then '남'
            else '여'
       end AS GENDER,
       department_id AS 부서번호
from employees
) V
group by grouping sets((부서번호, GENDER), (부서번호), (GENDER), ())
order by 1, 2;



select case grouping(department_id)
           when 0 then nvl(to_char(department_id), '인턴')
           else '전체'
       end AS 부서번호,
       case grouping(gender)
           when 0 then gender
           else '전체'
       end AS 성별,
       count(*),
       round(((count(*) / (select count(*) from employees)) * 100), 1) AS "%"
from
(
select case 
          when substr(jubun, 7, 1) in('1','3') then '남'
          else '여'
       end AS Gender,
       department_id
from employees
) V
group by grouping sets((department_id, Gender), (department_id), (gender), ())
order by 1,2;




select case grouping(department_id)
           when 0 then nvl(to_char(department_id), '인턴')
           else '전체'
       end AS 부서번호,
       to_char(round(sum(nvl( salary + (salary * commission_pct), salary) / 12)), '$999,999,999') AS 월급의합계,
       round(((sum(nvl( salary + (salary * commission_pct), salary)) / (select sum(nvl( salary + (salary * commission_pct), salary)) from employees)) * 100), 1) AS "%",
       to_char(round(sum(nvl( salary + (salary * commission_pct), salary) / 12) / count(*)), '$999,999,999') AS 월급의평균
from employees
group by rollup(department_id);


select count(*) AS 전체사원수,
       sum(case 연령대 when 0 then 1  else null end) AS "10대미만",
       sum(case 연령대 when 10 then 1 else null end) AS "10대",
       sum(case 연령대 when 20 then 1 else null end) AS "20대",
       sum(case 연령대 when 30 then 1 else null end) AS "30대",
       sum(case 연령대 when 40 then 1 else null end) AS "40대",
       sum(case 연령대 when 50 then 1 else null end) AS "50대",
       sum(case 연령대 when 60 then 1 else null end) AS "60대"
from
(
select trunc(extract(year from sysdate) - (to_number(substr(jubun, 1, 2)) + (case when substr(jubun, 7, 1) in ('1','2') then 1900 else 2000 end)) + 1, -1) AS 연령대
from employees
) V;



select case grouping(부서번호)
           when 0 then nvl(to_char(부서번호), '인턴')
           else '전체'
       end AS 부서번호,
       sum(case 성별 when '남' then 1 else 0 end) AS 남자,
       sum(case 성별 when '여' then 1 else 0 end) AS 여자,
       count(*) AS 총인원수
from
(
select case when substr(jubun, 7, 1) in ('1', '3') then '남' else '여' end AS 성별,
       department_id AS 부서번호
from employees
) V
group by rollup(부서번호);



-- having  VS  where 의 차이점
-- having 은 무조건 group by와 같이 쓰며, group by 의 결과를 한번더 걸러서 출력한다.? ( 그룹함수에 대한 조건절 )
-- where 은 단순히 로우하나하나에 대한 조건

select department_id, count(*)
from employees
group by department_id
having count(*) >= 10       -- where count(*) >= 10   오류!!!
order by 1;


select department_id AS 부서번호, to_char(sum(nvl(salary + (salary * commission_pct), salary)), '$999,999,999') AS 월급의합
from employees
group by department_id
having sum(nvl(salary + (salary * commission_pct), salary)) >= 50000
order by 1;


-- 2085