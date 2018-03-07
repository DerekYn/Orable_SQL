/*
    [퀴즈]
    employees 테이블에서
    사원번호, 사원명, 주민번호, 성별, 현재나이, 월급, 입사일자, 정년퇴직일을 나타내세요.
    
    정년퇴직일이라함은 [교육원공무원법상]
    해당 사원의 생월 3월에서 8월로 태어난 사람은 해당사원 나이(한국나이)가 63세가 되는 년도의 8월 31일로 하고,
    해당 사원의 생월이 9월에서 2월에 태어난 사람은 하당사원 나이(한국나이)가 63세가 되는 년도의 2월말일(2월28일 또는 2월29일)으로 한다.
  */
select V2.사원번호, V2.사원명, V2.주민번호, V2.성별, V2.age, V2.월급, V2.입사일자,
       to_char(last_day(to_char(add_months(sysdate, ((63 - age) * 12)), 'yyyy-') ||
       case when ( to_number(substr(V2.주민번호, 3, 2)) between 3 and 8 ) then '08-01' else '02-01' end), 'yyyy-mm-dd') as 정년퇴직일
from
(
select employee_id as "사원번호",
       first_name || ' ' || last_name as "사원명",
       jubun as "주민번호",
       case when substr(jubun, 7, 1) in ('1', '3') then '남' else '여' end as "성별", 
       extract(year from sysdate) - (to_number(substr(jubun, 1, 2)) + case when substr(jubun, 7, 1) in ('1', '2')
                                                                           then 1900 else 2000 end ) +1 as age,
       trunc(nvl((salary + salary * commission_pct), salary) / 12) as "월급",
       hire_date as "입사일자"
from employees
) V2;

-- 1415