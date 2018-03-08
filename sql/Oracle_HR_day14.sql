4. 변환함수

  -- 4.1  to_char -- 숫자나 날짜를 문자타입으로 변환해주는 것.
  
  select to_char(sysdate, 'yyyy') AS 년도,
         to_char(sysdate, 'mm') AS 월,
         to_char(sysdate, 'dd') AS 일,
         to_char(sysdate, 'hh24') AS "24시간",
         to_char(sysdate, 'hh am') AS "12시간",
         to_char(sysdate, 'hh pm') AS "12시간",
         to_char(sysdate, 'mi') AS 분,
         to_char(sysdate, 'ss') AS 초,
         to_char(sysdate, 'q') AS 분기, -- 1월~3월 -> 1분기 ... 
         to_char(sysdate, 'day') AS 세글자요일명,
         to_char(sysdate, 'dy') AS 한글자요일명,
         to_char(sysdate, 'd') AS 숫자요일명
  from dual;
  
  select to_char(sysdate, 'ddd'), -- sysdate 즉, 현재 날짜가 포함된 연의 1월 1일 부터 ddd까지의 날의 갯수
         to_char(sysdate, 'dd'),  -- sysdate 즉, 현재 날짜가 포함된 달의 1일 부터 dd까지의 날의 갯수
         to_char(sysdate, 'd')    -- sysdate 즉, 현재 날짜가 포함된 주(일요일)부터 d까지의 날의 갯수
  from dual;


  select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'),
         to_char(sysdate, 'yyyy-mm-dd'),  --> 이렇게 하면 시간은 그날 밤 00:00:00로 된다.
         to_char(to_date(to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd'), 'yyyy-mm-dd hh24:mi:ss')
  from dual;
  
  select (sysdate - to_date(to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd')) * (24*60*60), -- 오늘밤 00:00:00 부터 지금 까지 흘러간 초
          to_char(sysdate, 'sssss') -- 위와 상동
  from dual;
  
  select 123456789,
         to_char(123456789, 'L999,999,999'),  -- 현재 설정된 국가의 돈 단위
         to_char(123456789, '$999,999,999')   -- 달러 단위
  from dual;
  
  select employee_id,
         to_char(nvl(salary + (salary * commission_pct), salary) * 12, '$99,999,999')
  from employees;
  
  
  select employee_id,
         nvl(salary + (salary * commission_pct), salary) * 12 / 13 AS 연봉,
         round(nvl(salary + (salary * commission_pct), salary) * 12 / 13, 1) AS 연봉1,
         to_char(round(nvl(salary + (salary * commission_pct), salary) * 12 / 13, 1), '99999.0')  AS 연봉2  -- 소수점 자리를 설정 할 수도 있음.
  from employees;
  
  
  -- 4.2  to_date    -- 문자를 날짜 타입으로 변환해주는 것
  -- 4.3  to_number  -- 문자를 숫자 타입으로 변환해주는 것  
  
  select '2', to_number('2'), 2
  from dual;

-- 1585