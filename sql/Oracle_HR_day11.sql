3. 날짜 함수
  -- 현재 오라클 서버 시스템의 시간을 알려주는것.
  
  select sysdate, current_date, localtimestamp, current_timestamp
  from dual;
  
  -- RR/MM/DD
  
  select sysdate, to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')
  from dual;
  
  -- 3.1  
  /*
    날짜 + 숫자 = 날짜
    날짜 - 숫자 = 날짜
    
    여기서는 숫자의 단위는 일 수 이다.
  */
  
  select sysdate -1 as "어제 시각",
         sysdate as "현재 시각",
         sysdate +1 as "내일 시각"
  from dual;
  
  select to_char(sysdate -1, 'yyyy-mm-dd hh24:mi:ss') as "어제 시각",
         to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') as "현재 시각",
         to_char(sysdate +1, 'yyyy-mm-dd hh24:mi:ss') as "현재 시각"
  from dual;
    
    
  select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') as "현재 시각",
          to_char(sysdate+1+2/24+3/(24*60)+4/(24*60*60), 'yyyy-mm-dd hh24:mi:ss') as "1일 2시간 3분  4초 후"
  from dual;
  
  -- 3.2
  /*
    날짜 - 날짜 = 숫자(숫자의 단위는 일 수)
  */
  
  select (sysdate + 2) - (sysdate + 1)
  from dual;
  
  -- 3.3  add_months
  
  select add_months(sysdate, -2) as "2개월전",
          sysdate as "현재",
          add_months(sysdate, 2) as "2개월후"
  from dual;
  
  
  select add_months(sysdate, 21) as "제대일자",
         (add_months(sysdate, 21) - sysdate + 1) *3 "남은 밥 그릇 수"
  from dual;
  
  -- 현재 시간으로부터 ('2018-7-31 18:00:00')까지 남은 기간을 일 시간 분 초로 나타내세요.
  
  select 1*24*60*60 + 2*60*60 + 3*60 + 4
  from dual;
  
  --93781 초를 일 시간 분 초로 나타내세요.
  select trunc(trunc(93784/60)/60/24) || '일' || mod(trunc(93784/60)/60, 24) || '시'
        || mod(trunc(93784,60),60) || '분' || mod(93784,60) || '초' as "수료식까지 남은 기간"
  from dual;
  
  -- D-day 구해주는 것
  select trunc(trunc(trunc( ( to_date('2018-07-31 18:00:00', 'yyyy-mm-dd hh24:mi:ss') - sysdate ) * (24*60*60) )/60)/60/24) || '일' ||
  mod(trunc(trunc( ( to_date('2018-07-31 18:00:00', 'yyyy-mm-dd hh24:mi:ss') - sysdate ) * (24*60*60) )/60)/60, 24) || '시간' || 
  mod(trunc(trunc( ( to_date('2018-07-31 18:00:00', 'yyyy-mm-dd hh24:mi:ss') - sysdate ) * (24*60*60) )/60), 60) || '분' || 
  mod(trunc( ( to_date('2018-07-31 18:00:00', 'yyyy-mm-dd hh24:mi:ss') - sysdate ) * (24*60*60) ), 60) || '초'
  from dual;
  
  
  create table tbl_auction
  (auction_no     number,
   expire_date    date);
  
  insert into tbl_auction(auction_no, expire_date)
  values(1, to_date('2018-02-26 20:00:00', 'yyyy-mm-dd hh24:mi:ss'));
  
  insert into tbl_auction(auction_no, expire_date)
  values(2, to_date('2018-02-27 09:00:00', 'yyyy-mm-dd hh24:mi:ss'));
  
  insert into tbl_auction(auction_no, expire_date)
  values(3, to_date('2018-03-01 12:00:00', 'yyyy-mm-dd hh24:mi:ss'));
  
  commit;
  
  select *
  from tbl_auction;
  
  select auction_no,
         to_char(expire_date, 'yyyy-mm-dd hh24:mi:ss') as expire_date,
         trunc(trunc(trunc( ( expire_date - sysdate ) * (24*60*60) )/60)/60/24) || '일' ||
          mod(trunc(trunc( ( expire_date - sysdate ) * (24*60*60) )/60)/60, 24) || '시간' || 
          mod(trunc(trunc( ( expire_date - sysdate ) * (24*60*60) )/60), 60) || '분' || 
          mod(trunc( ( expire_date - sysdate ) * (24*60*60) ), 60) || '초' as "종료까지 남은기간"
  from tbl_auction;
  
  
  -- 강사님
   select auction_no, 
        to_char(expire_date, 'yyyy-mm-dd hh24:mi:ss') as expire_date
 from tbl_auction;

 select auction_no 
      , to_char(expire_date, 'yyyy-mm-dd hh24:mi:ss') as expire_date
      , trunc(trunc(trunc( (trunc( (expire_date - sysdate ) * (24*60*60) )) /60)/60)/24) || '일 ' ||
        mod(trunc(trunc( (trunc( (expire_date - sysdate ) * (24*60*60) )) /60)/60), 24) || '시간 ' ||
        mod(trunc((trunc( (expire_date - sysdate ) * (24*60*60) ))/60), 60) || '분 ' ||
        mod((trunc( (expire_date - sysdate ) * (24*60*60) )),60) || '초' as "종료까지남은기간"
 from tbl_auction;
 
 
 desc employees;
 
 select employee_id, first_name, hire_date, jubun
 from employees;
 
 -- 3.4 extract -- 날짜에서 년, 월, 일을 number 타입으로 추출해주는 함수
 
 select sysdate, to_char(sysdate, 'yyyy') as "년도1",
                 extract(year from sysdate) as "년도2",
                 to_char(sysdate, 'mm') as "월1",
                 extract(month from sysdate) as "월2",
                 to_char(sysdate, 'dd') as "일1",
                 extract(day from sysdate) as "일2"
 from dual;

  
  -- employees 테이블에서 아래와 같이 나오도록 하세요.
  -- 사원번호, 사원명, 주민번호, 성별, 생년, 현재나이
  
  
  select employee_id as "사원번호", first_name || ' ' || last_name as "사원명", jubun
         as "주민번호", 
         case when substr(jubun, 7, 1) in ('1', '3') then '남' else '여' end
         as "성별",
         to_number(substr(jubun, 1, 2)) + case when substr(jubun, 7, 1) in('1', '2') then 1900  else 2000 end
         as "생년",
         extract(year from sysdate) - ( to_number(substr(jubun, 1, 2)) + case when substr(jubun, 7, 1) in('1', '2') then 1900 else 2000 end) +1
         as "현재나이"
  from employees;
  
  
  -- employees 테이블에서 여자중에 나이가 20대와 40대
  -- 사원번호 , 사원명, 주민번호, 성별, 현재나이( gender와 age 컬럼을 만들어서)
  
  -- VIEW(뷰)란?
  -- 테이블은 아니지만 SELECT 되어져 나오는 결과물이
  -- 테이블 모양과 같으므로 그 결과물을 테이블처럼
  -- 보는것(간주하는것)을 말한다.

select V.* -- 또는 *
from
( 
  select employee_id as "사원번호", first_name || ' ' || last_name as "사원명", jubun as "주민번호", 
         case when substr(jubun, 7, 1) in ('1', '3') then '남' else '여' end
         as GENDER,
         to_number(substr(jubun, 1, 2)) + case when substr(jubun, 7, 1) in('1', '2') then 1900  else 2000 end
         as "생년",
         extract(year from sysdate) - ( to_number(substr(jubun, 1, 2)) + case when substr(jubun, 7, 1) in('1', '2') then 1900 else 2000 end) +1
         as AGE
  from employees
) V -- inline View 라고 부른다.
where V.GENDER = '여' and trunc(V.AGE, -1) in (20,40);  -- 모든 V. 은 생략가능하다.(V가 지금 오직 하나 뿐이니까)





-- 3.5  months_between - 두 날짜의 개월 차이를 알려주는 것.

select months_between ( add_months(sysdate, 5), sysdate ) as "between"  -- 앞 달 빼기 뒷 달
from dual;

-- 1390