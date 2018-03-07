-- 3.6  last_day(Ư����¥)
        --> Ư�� ��¥�� ���Ե� �޷¿��� �� ������ ���� �˷��ִ� ��.
  
  select last_day(sysdate), last_day('2015-03-02'), last_day('2017-05-11'), sysdate
  from dual;
  
  select sysdate, to_char(sysdate, 'day'), -- ������
                to_char(sysdate, 'dy'),  -- ��
                to_char(sysdate, 'd'),   -- 4 ('1', '2'.... �Ͽ��Ϻ��� ..... '7')
                case to_char(sysdate, 'd')
                  when '1' then '��'
                  when '2' then '��'
                  when '3' then 'ȭ'
                  when '4' then '��'
                  when '5' then '��'
                  when '6' then '��'
                  when '7' then '��'
                end as day
  from dual;
  
  number(4)  --> -9999 ~ 9999
  number(4,2)  --> -99.99 ~ 99.99
  number(4,1)  --> -999.9 ~ 999.9
  number(4,3)  --> -9.999 ~ 9.999
  number(2,2)  --> -0.99 ~ 0.99
  
  
  create table tbl_loan
  ( accountNum    varchar2(10),  -- ���¹�ȣ
    loanMoney     number,        -- �����
    interestRate  number(2, 2),  -- ������
    paymentDate   varchar(2),    -- ���ڸ� ���� ��¥ '05', '20', �ſ� ���� = '00'
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
   
   
   
select ���¹�ȣ, �����, ����������,
          to_char(case to_char(to_date(�̹��޻�ȯ���ڰ��), 'd')
                      when '1' then �̹��޻�ȯ���ڰ��+1
                      when '7' then �̹��޻�ȯ���ڰ��+2
                      else �̹��޻�ȯ���ڰ��
                   end, 'yyyy-mm-dd') AS �̹��޻�ȯ����,
          to_char(case to_char(to_date(�����޻�ȯ���ڰ��), 'd')
                      when '1' then �����޻�ȯ���ڰ��+1
                      when '7' then �����޻�ȯ���ڰ��+2
                      else �����޻�ȯ���ڰ��
                   end, 'yyyy-mm-dd') AS �����޻�ȯ����,
          (to_date(to_char(case to_char(to_date(�̹��޻�ȯ���ڰ��), 'd')
                      when '1' then �̹��޻�ȯ���ڰ��+1
                      when '7' then �̹��޻�ȯ���ڰ��+2
                      else �̹��޻�ȯ���ڰ��
                   end, 'yyyy-mm-dd')) - to_date(to_char(case to_char(to_date(�����޻�ȯ���ڰ��), 'd')
                      when '1' then �����޻�ȯ���ڰ��+1
                      when '7' then �����޻�ȯ���ڰ��+2
                      else �����޻�ȯ���ڰ��
                   end, 'yyyy-mm-dd'))) * (����� * ����������) AS �̹������ڱݾ�
  from
 ( 
  select accountNum AS ���¹�ȣ,
         loanMoney AS �����,
         interestRate AS ����������,
         case paymentDate
           when '00' then to_date(to_char(last_day(sysdate), 'yyyy-mm-dd'))
           else to_date(to_char(sysdate, 'yyyy-mm-') || paymentDate)
         end AS �̹��޻�ȯ���ڰ��,
         case paymentDate
           when '00' then to_date(to_char(last_day(add_months(sysdate,-1)), 'yyyy-mm-dd'))
           else to_date(to_char(add_months(sysdate,-1), 'yyyy-mm-') || paymentDate)
         end AS �����޻�ȯ���ڰ��
  from tbl_loan
  ) V3;


 -- 3.7  next_day -- ���ƿ��� ���ϸ��� ���� �������� �˷��ִ� ��.
 
 select sysdate,
        next_day(sysdate, '��'),
        next_day(sysdate, '��'),
        next_day(sysdate, '��')
 from dual;
 
 
  -- 3.8  to_yminterval, to_dsinterval  --  �����Ϸ� ���� 1�� 2���� 3�� 4�ð� 5�� 6�� �ڸ� ��Ÿ������.
  
  select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'),
         to_char(add_months(sysdate, 1*12+2) + 3 + 4/24 + 5/(24*60) + 6/(24*60*60), 'yyyy-mm-dd hh24:mi:ss'),
         to_char(sysdate + to_yminterval('01-02') + to_dsinterval('003 04:05:06'), 'yyyy-mm-dd hh24:mi:ss')
  from dual;
  
  select to_char(sysdate, 'yyyy-mm-dd'),
         add_months(sysdate, 1*12+2),
         sysdate + to_yminterval('01-02')
  from dual;

-- 1529