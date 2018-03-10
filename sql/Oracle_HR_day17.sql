 ------------------------------------------------------------------------
    ★★★★★★★★★★★ >>>>> 그룹 함수(집계 함수) <<<<< ★★★★★★★★★★★
------------------------------------------------------------------------
※ 그룹 함수에서는 null은 무조건 제외하고서 연산을 한다.!!
------------------------------------------------------------------------
1. sum   -- 합계
2. avg   -- 평균
3. max   -- 최대값
4. min   -- 최소값
5. count -- select 되어서 나온 결과물의 행의 갯수
6. variance -- 분산
7. stddev   -- 표준편차

select count(salary)
from employees;

select count(commission_pct)
from employees;

select sum(salary * commission_pct) / count(commission_pct),   -- null 은 자동 제외
       avg(salary * commission_pct),   -- 위와 똑같음 // 커미션을 받는 직원들 '만'의 평균치
       avg(nvl(salary * commission_pct, 0))  --     // 107 명 모두의 커미션 평균
from employees;

select sum(salary)/count(salary),     -- 두 개가 똑같음 
       avg(salary)
from employees;


-- employees 테이블에서 부서번호별 인원수를 나타내세요.
select department_id, count(*) AS 인원수
from employees
group by department_id  -- 먼저 나타내고 싶은 연령대, 성별 등으로 나누고 뷰를 씌운 뒤, 밖의 select 문에서   AGE 또는 Gender, count(*) 만 해주면됨
order by 1;             -- group by 는 세로로 나타난다.



select GENDER, count(*) AS 인원수
from
(
select case when substr(jubun, 7, 1) in('1', '3') then '남자'
            else '여자'
            end AS GENDER
from employees
) V
group by GENDER;


select age, count(*) AS 인원수
from
(
select trunc(extract(year from sysdate) - to_number(substr(jubun, 1, 2)) - case when substr(jubun, 7, 1) in ('1', '2') then 1900 else 2000 end + 1, - 1) AS AGE
from employees
) V
group by age
order by 1;


select department_id, count(*) AS 인원수
from employees
group by rollup (department_id);  -- rollup ( ) 마지막에 총합을 한번 출력해준다.


select GENDER, count(*) AS 인원수
from
(
select case when substr(jubun, 7, 1) in('1', '3') then '남자'
            else '여자'
            end AS GENDER
from employees
) V
group by rollup (GENDER);



select age, count(*) AS 인원수
from
(
select trunc(extract(year from sysdate) - to_number(substr(jubun, 1, 2)) - case when substr(jubun, 7, 1) in ('1', '2') then 1900 else 2000 end + 1, - 1) AS AGE
from employees
) V
group by rollup (age);


select case grouping(department_id)     -- null 이 2개여서 비교 불가였지만 그룹핑 값을 이용하면 rollup의 총합을 구해주는 null과 리얼 부서번호가 없는 null을 구분가능
          when 0 then nvl(to_char(department_id), '인턴')
          else '총합'     -- 한 컬럼안에 두가지의 데이터 타입이 들어갈 수 없으므로, 숫자를 문자로 변경!!!!!!!!!!!!!!!!!!
       end AS 부서번호,
       count(*) AS 인원수    -- grouping(오직 0, 1의 값만 갖는다.) 은 group by 의 rollup 이 존재할때만 사용할 수 있다. !!!!!!!!!!!!!!!
from employees
group by rollup(department_id);



select nvl(GENDER, '전체'),              -- 결과값에 null 이 한개면  바로 nvl 해도 되지만 2개면 grouping  case~ 해야함
       count(*) AS 인원수,
       round((count(*) / (select count(*) from employees)) * 100, 1) AS "%"      -- % 구하는 법!!!!
from
(
select case when substr(jubun, 7, 1) in('1', '3') then '남자'
            else '여자'
            end AS GENDER
from employees
) V
group by rollup (GENDER);



select nvl(to_char(age), '전체'),
       count(*) AS 인원수,
       round((count(*) / (select count(*) from employees)) * 100, 1) AS "%"
from
(
select trunc(extract(year from sysdate) - to_number(substr(jubun, 1, 2)) - case when substr(jubun, 7, 1) in ('1', '2') then 1900 else 2000 end + 1, - 1) AS AGE
from employees
) V
group by rollup (age);



select case grouping(department_id)     
          when 0 then nvl(to_char(department_id), '인턴')
          else '총합'    
       end AS 부서번호,
       count(*) AS 인원수,
       round((count(*) / (select count(*) from employees)) * 100, 1) AS "%"
from employees
group by rollup(department_id);


-- 1892