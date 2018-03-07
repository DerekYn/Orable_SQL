-- 3.6  last_day(특정날짜)
        --> 특정 날짜가 포함된 달력에서 맨 마지막 날을 알려주는 것.
  
  select last_day(sysdate), last_day('2015-03-02'), last_day('2017-05-11'), sysdate
  from dual;
  
  select sysdate, to_char(sysdate, 'day'), -- 수요일
                to_char(sysdate, 'dy'),  -- 수
                to_char(sysdate, 'd'),   -- 4 ('1', '2'.... 일요일부터 ..... '7')
                case to_char(sysdate, 'd')
                  when '1' then '일'
                  when '2' then '월'
                  when '3' then '화'
                  when '4' then '수'
                  when '5' then '목'
                  when '6' then '금'
                  when '7' then '토'
                end as day
  from dual;
  
  number(4)  --> -9999 ~ 9999
  number(4,2)  --> -99.99 ~ 99.99
  number(4,1)  --> -999.9 ~ 999.9
  number(4,3)  --> -9.999 ~ 9.999
  number(2,2)  --> -0.99 ~ 0.99
  
  
  create table tbl_loan
  ( accountNum    varchar2(10),  -- 계좌번호
    loanMoney     number,        -- 대출금
    interestRate  number(2, 2),  -- 이자율
    paymentDate   varchar(2),    -- 이자를 내는 날짜 '05', '20', 매월 말일 = '00'
    constraint PK_tbl_loan_accountNum primary key(accountNum)
  );

  insert into tbl_loan(accountNum, loanMoney, interestRate, paymentDate)
  values('10-1234-01', 5000, 0.03, '05');
  
  insert into tbl_loan(accountNum, loanMoney, interestRate, paymentDate)
  values('10-1234-02', 5000, 0.03, '07');
  
  insert into tbl_loan(accountNum, loanMoney, interestRate, paymentDate)
  values('10-1234-03', 5000, 0.03, '15');
  
  insert into tbl_loan(accountNum, loanMoney, interestRate, paymentDate)
  values('10-1234-04', 5000, 0.03, '00');
  
  insert into tbl_loan(accountNum, loanMoney, interestRate, paymentDate)
  values('10-1234-05', 5000, 0.03, '10');
  
  commit;
   
   
   
select 계좌번호, 대출금, 대출이자율,
          to_char(case to_char(to_date(이번달상환일자계산), 'd')
                      when '1' then 이번달상환일자계산+1
                      when '7' then 이번달상환일자계산+2
                      else 이번달상환일자계산
                   end, 'yyyy-mm-dd') AS 이번달상환일자,
          to_char(case to_char(to_date(저번달상환일자계산), 'd')
                      when '1' then 저번달상환일자계산+1
                      when '7' then 저번달상환일자계산+2
                      else 저번달상환일자계산
                   end, 'yyyy-mm-dd') AS 지난달상환일자,
          (to_date(to_char(case to_char(to_date(이번달상환일자계산), 'd')
                      when '1' then 이번달상환일자계산+1
                      when '7' then 이번달상환일자계산+2
                      else 이번달상환일자계산
                   end, 'yyyy-mm-dd')) - to_date(to_char(case to_char(to_date(저번달상환일자계산), 'd')
                      when '1' then 저번달상환일자계산+1
                      when '7' then 저번달상환일자계산+2
                      else 저번달상환일자계산
                   end, 'yyyy-mm-dd'))) * (대출금 * 대출이자율) AS 이번달이자금액
  from
 ( 
  select accountNum AS 계좌번호,
         loanMoney AS 대출금,
         interestRate AS 대출이자율,
         case paymentDate
           when '00' then to_date(to_char(last_day(sysdate), 'yyyy-mm-dd'))
           else to_date(to_char(sysdate, 'yyyy-mm-') || paymentDate)
         end AS 이번달상환일자계산,
         case paymentDate
           when '00' then to_date(to_char(last_day(add_months(sysdate,-1)), 'yyyy-mm-dd'))
           else to_date(to_char(add_months(sysdate,-1), 'yyyy-mm-') || paymentDate)
         end AS 저번달상환일자계산
  from tbl_loan
  ) V3;


 -- 3.7  next_day -- 돌아오는 요일명중 가장 빠른날을 알려주는 것.
 
 select sysdate,
        next_day(sysdate, '토'),
        next_day(sysdate, '금'),
        next_day(sysdate, '수')
 from dual;
 
 
  -- 3.8  to_yminterval, to_dsinterval  --  현재일로 부터 1년 2개월 3일 4시간 5분 6초 뒤를 나타내세요.
  
  select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'),
         to_char(add_months(sysdate, 1*12+2) + 3 + 4/24 + 5/(24*60) + 6/(24*60*60), 'yyyy-mm-dd hh24:mi:ss'),
         to_char(sysdate + to_yminterval('01-02') + to_dsinterval('003 04:05:06'), 'yyyy-mm-dd hh24:mi:ss')
  from dual;
  
  select to_char(sysdate, 'yyyy-mm-dd'),
         add_months(sysdate, 1*12+2),
         sysdate + to_yminterval('01-02')
  from dual;

-- 1529