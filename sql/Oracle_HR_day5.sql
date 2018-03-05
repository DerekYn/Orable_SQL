/*
  오라클은 입력된 데이터값에 대해서만
  대, 소문자를 구분한다.
  문자열 함수 중에 대, 소문자를 변경해 주는 것이 있다.
  
  1. upper : 모든 문자를 대문자로 변경해주는 함수.
  2. lower : 모든 문자를 소문자로 변경해주는 함수.
  3. initcap : 단어를 중심으로 첫글자만 대문자로, 나머지는 소문자로 변경해주는 함수이다.
*/

select first_name, upper(first_name), lower(first_name)
from employees;

select street_address, upper(street_address), lower(street_address),
        initcap(street_address)       -- 공백 기준으로 첫번째 글자만 대문자로 변경
from locations;


select 'seOUL cITy', upper('seOUL cITy'), lower('seOUL cITy'), initcap('seOUL cITy')
from dual;

select employee_id, first_name, first_name || ' ' || last_name, salary
from employees
where lower(first_name) = lower('jOHn');


select employee_id, first_name || ' ' || last_name, salary
from employees
where upper(first_name || ' ' || last_name) = upper('jOHn sEo');

-- 750