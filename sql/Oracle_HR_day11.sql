3. ��¥ �Լ�
  -- ���� ����Ŭ ���� �ý����� �ð��� �˷��ִ°�.
  
  select sysdate, current_date, localtimestamp, current_timestamp
  from dual;
  
  -- RR/MM/DD
  
  select sysdate, to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss')
  from dual;
  
  -- 3.1  
  /*
    ��¥ + ���� = ��¥
    ��¥ - ���� = ��¥
    
    ���⼭�� ������ ������ �� �� �̴�.
  */
  
  select sysdate -1 as "���� �ð�",
         sysdate as "���� �ð�",
         sysdate +1 as "���� �ð�"
  from dual;
  
  select to_char(sysdate -1, 'yyyy-mm-dd hh24:mi:ss') as "���� �ð�",
         to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') as "���� �ð�",
         to_char(sysdate +1, 'yyyy-mm-dd hh24:mi:ss') as "���� �ð�"
  from dual;
    
    
  select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') as "���� �ð�",
          to_char(sysdate+1+2/24+3/(24*60)+4/(24*60*60), 'yyyy-mm-dd hh24:mi:ss') as "1�� 2�ð� 3��  4�� ��"
  from dual;
  
  -- 3.2
  /*
    ��¥ - ��¥ = ����(������ ������ �� ��)
  */
  
  select (sysdate + 2) - (sysdate + 1)
  from dual;
  
  -- 3.3  add_months
  
  select add_months(sysdate, -2) as "2������",
          sysdate as "����",
          add_months(sysdate, 2) as "2������"
  from dual;
  
  
  select add_months(sysdate, 21) as "��������",
         (add_months(sysdate, 21) - sysdate + 1) *3 "���� �� �׸� ��"
  from dual;
  
  -- ���� �ð����κ��� ('2018-7-31 18:00:00')���� ���� �Ⱓ�� �� �ð� �� �ʷ� ��Ÿ������.
  
  select 1*24*60*60 + 2*60*60 + 3*60 + 4
  from dual;
  
  --93781 �ʸ� �� �ð� �� �ʷ� ��Ÿ������.
  select trunc(trunc(93784/60)/60/24) || '��' || mod(trunc(93784/60)/60, 24) || '��'
        || mod(trunc(93784,60),60) || '��' || mod(93784,60) || '��' as "����ı��� ���� �Ⱓ"
  from dual;
  
  -- D-day �����ִ� ��
  select trunc(trunc(trunc( ( to_date('2018-07-31 18:00:00', 'yyyy-mm-dd hh24:mi:ss') - sysdate ) * (24*60*60) )/60)/60/24) || '��' ||
  mod(trunc(trunc( ( to_date('2018-07-31 18:00:00', 'yyyy-mm-dd hh24:mi:ss') - sysdate ) * (24*60*60) )/60)/60, 24) || '�ð�' || 
  mod(trunc(trunc( ( to_date('2018-07-31 18:00:00', 'yyyy-mm-dd hh24:mi:ss') - sysdate ) * (24*60*60) )/60), 60) || '��' || 
  mod(trunc( ( to_date('2018-07-31 18:00:00', 'yyyy-mm-dd hh24:mi:ss') - sysdate ) * (24*60*60) ), 60) || '��'
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
         trunc(trunc(trunc( ( expire_date - sysdate ) * (24*60*60) )/60)/60/24) || '��' ||
          mod(trunc(trunc( ( expire_date - sysdate ) * (24*60*60) )/60)/60, 24) || '�ð�' || 
          mod(trunc(trunc( ( expire_date - sysdate ) * (24*60*60) )/60), 60) || '��' || 
          mod(trunc( ( expire_date - sysdate ) * (24*60*60) ), 60) || '��' as "������� �����Ⱓ"
  from tbl_auction;
  
  
  -- �����
   select auction_no, 
        to_char(expire_date, 'yyyy-mm-dd hh24:mi:ss') as expire_date
 from tbl_auction;

 select auction_no 
      , to_char(expire_date, 'yyyy-mm-dd hh24:mi:ss') as expire_date
      , trunc(trunc(trunc( (trunc( (expire_date - sysdate ) * (24*60*60) )) /60)/60)/24) || '�� ' ||
        mod(trunc(trunc( (trunc( (expire_date - sysdate ) * (24*60*60) )) /60)/60), 24) || '�ð� ' ||
        mod(trunc((trunc( (expire_date - sysdate ) * (24*60*60) ))/60), 60) || '�� ' ||
        mod((trunc( (expire_date - sysdate ) * (24*60*60) )),60) || '��' as "������������Ⱓ"
 from tbl_auction;
 
 
 desc employees;
 
 select employee_id, first_name, hire_date, jubun
 from employees;
 
 -- 3.4 extract -- ��¥���� ��, ��, ���� number Ÿ������ �������ִ� �Լ�
 
 select sysdate, to_char(sysdate, 'yyyy') as "�⵵1",
                 extract(year from sysdate) as "�⵵2",
                 to_char(sysdate, 'mm') as "��1",
                 extract(month from sysdate) as "��2",
                 to_char(sysdate, 'dd') as "��1",
                 extract(day from sysdate) as "��2"
 from dual;

  
  -- employees ���̺��� �Ʒ��� ���� �������� �ϼ���.
  -- �����ȣ, �����, �ֹι�ȣ, ����, ����, ���糪��
  
  
  select employee_id as "�����ȣ", first_name || ' ' || last_name as "�����", jubun
         as "�ֹι�ȣ", 
         case when substr(jubun, 7, 1) in ('1', '3') then '��' else '��' end
         as "����",
         to_number(substr(jubun, 1, 2)) + case when substr(jubun, 7, 1) in('1', '2') then 1900  else 2000 end
         as "����",
         extract(year from sysdate) - ( to_number(substr(jubun, 1, 2)) + case when substr(jubun, 7, 1) in('1', '2') then 1900 else 2000 end) +1
         as "���糪��"
  from employees;
  
  
  -- employees ���̺��� �����߿� ���̰� 20��� 40��
  -- �����ȣ , �����, �ֹι�ȣ, ����, ���糪��( gender�� age �÷��� ����)
  
  -- VIEW(��)��?
  -- ���̺��� �ƴ����� SELECT �Ǿ��� ������ �������
  -- ���̺� ���� �����Ƿ� �� ������� ���̺�ó��
  -- ���°�(�����ϴ°�)�� ���Ѵ�.

select V.* -- �Ǵ� *
from
( 
  select employee_id as "�����ȣ", first_name || ' ' || last_name as "�����", jubun as "�ֹι�ȣ", 
         case when substr(jubun, 7, 1) in ('1', '3') then '��' else '��' end
         as GENDER,
         to_number(substr(jubun, 1, 2)) + case when substr(jubun, 7, 1) in('1', '2') then 1900  else 2000 end
         as "����",
         extract(year from sysdate) - ( to_number(substr(jubun, 1, 2)) + case when substr(jubun, 7, 1) in('1', '2') then 1900 else 2000 end) +1
         as AGE
  from employees
) V -- inline View ��� �θ���.
where V.GENDER = '��' and trunc(V.AGE, -1) in (20,40);  -- ��� V. �� ���������ϴ�.(V�� ���� ���� �ϳ� ���̴ϱ�)





-- 3.5  months_between - �� ��¥�� ���� ���̸� �˷��ִ� ��.

select months_between ( add_months(sysdate, 5), sysdate ) as "between"  -- �� �� ���� �� ��
from dual;

-- 1390