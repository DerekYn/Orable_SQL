----- *** ������ ���ؼ� *** -----

commit;

create table tbl_shop
(
sales_date date,
p_name varchar(20),
amount number
);

insert into tbl_shop(sales_date, p_name, amount)
values( add_months(sysdate, -2) + 3, 'shrimp', 15);

insert into tbl_shop(sales_date, p_name, amount)
values( add_months(sysdate, -2) + 1, 'potato', 20);

insert into tbl_shop(sales_date, p_name, amount)
values( add_months(sysdate, -2) + 3, 'shrimp', 10);

insert into tbl_shop(sales_date, p_name, amount)
values( add_months(sysdate, -1), 'sweet_potato', 7);

insert into tbl_shop(sales_date, p_name, amount)
values( add_months(sysdate, -1) + 1, 'shrimp', 10);

insert into tbl_shop(sales_date, p_name, amount)
values( add_months(sysdate, -1) + 3, 'potato', 10);

insert into tbl_shop(sales_date, p_name, amount)
values( add_months(sysdate, -2), 'shrimp', 10);

insert into tbl_shop(sales_date, p_name, amount)
values( sysdate -4, 'honey_butter_chip', 30);

insert into tbl_shop(sales_date, p_name, amount)
values( sysdate -3, 'sweet_potato', 15);

insert into tbl_shop(sales_date, p_name, amount)
values( sysdate -2, 'sweet_potato', 10);

insert into tbl_shop(sales_date, p_name, amount)
values( sysdate -1, 'honey_butter_chip', 20);

insert into tbl_shop(sales_date, p_name, amount)
values( sysdate, 'shrimp', 10);

insert into tbl_shop(sales_date, p_name, amount)
values( sysdate, 'shrimp', 10);

insert into tbl_shop(sales_date, p_name, amount)
values( sysdate, 'potato', 5);

insert into tbl_shop(sales_date, p_name, amount)
values( sysdate, 'honey_butter_chip', 15);

insert into tbl_shop(sales_date, p_name, amount)
values( sysdate, 'sweet_potato', 20);

insert into tbl_shop(sales_date, p_name, amount)
values( sysdate, 'potato', 10);

commit;


select *
from tbl_shop;


select p_name AS ��ǰ��, to_char(sales_date, 'yyyy-mm-dd') AS �Ǹ�����,
       sum(amount) AS �Ǹŷ�                                    -- select�� ������ group ������ �͵鿡���� ��� �ȴ�. �׷��� sum �� !!!!!
from tbl_shop
where p_name = 'shrimp'
group by p_name, to_char(sales_date, 'yyyy-mm-dd') -- ���� ���ڸ� �����Ƿ�, having �� �ʿ����.( ���� �Ǹż����� �������� ����� ����� )
order by 2;


select p_name AS ��ǰ��, to_char(sales_date, 'yyyy-mm') AS �Ǹ�����,
       sum(amount) AS �Ǹŷ�
from tbl_shop
where p_name = 'shrimp'
group by p_name, to_char(sales_date, 'yyyy-mm')
order by 2;


select employee_id, hire_date, salary,               -- ����� group by �� �ʿ䰡 ����!!!!!!!!!!!!
       sum(salary) over(order by employee_id)
from employees;

select employee_id, hire_date, salary,
       sum(salary) over(order by hire_date)
from employees;





select p_name AS ��ǰ��, SALES_MONTH AS �Ǹſ�, AMOUNT_OF_THISMONTH AS �����Ǹŷ�,
       sum(AMOUNT_OF_THISMONTH) over(order by SALES_MONTH) AS �����Ǹŷ�
from
(
select p_name, to_char(sales_date, 'yyyy-mm') AS SALES_MONTH,
       sum(amount) AS AMOUNT_OF_THISMONTH
from tbl_shop
where p_name = 'shrimp'
group by p_name, to_char(sales_date, 'yyyy-mm')
) V;




select p_name AS ��ǰ��, SALES_TODAY AS �Ǹ���, AMOUNT_OF_TODAY AS �Ϻ��Ǹŷ�,
       sum(AMOUNT_OF_TODAY) over(order by SALES_TODAY) AS �����Ǹŷ�
from
(
select p_name, to_char(sales_date, 'yyyy-mm-dd') AS SALES_TODAY,
       sum(amount) AS AMOUNT_OF_TODAY
from tbl_shop
where p_name = 'shrimp'
group by p_name, to_char(sales_date, 'yyyy-mm-dd')
) V;



select p_name AS ��ǰ��, to_char(sales_date, 'yyyy-mm') AS �Ǹſ�, sum(amount) AS �Ǹŷ�,
       sum(sum(amount)) over( partition by p_name order by to_char(sales_date, 'yyyy-mm')) AS �����Ǹŷ�     -- ��µ� ������� �ѹ��� ���� ���ִ� partition by
from tbl_shop
group by p_name, to_char(sales_date, 'yyyy-mm');


-- 2216