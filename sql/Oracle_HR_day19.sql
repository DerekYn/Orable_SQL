----- *** 누적에 대해서 *** -----

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


select p_name AS 제품명, to_char(sales_date, 'yyyy-mm-dd') AS 판매일자,
       sum(amount) AS 판매량                                    -- select은 무조건 group 지어진 것들에서만 계산 된다. 그래서 sum 도 !!!!!
from tbl_shop
where p_name = 'shrimp'
group by p_name, to_char(sales_date, 'yyyy-mm-dd') -- 같은 날자만 있으므로, having 은 필요없다.( 만약 판매수량의 범위까지 물어보면 써야함 )
order by 2;


select p_name AS 제품명, to_char(sales_date, 'yyyy-mm') AS 판매일자,
       sum(amount) AS 판매량
from tbl_shop
where p_name = 'shrimp'
group by p_name, to_char(sales_date, 'yyyy-mm')
order by 2;


select employee_id, hire_date, salary,               -- 누계는 group by 할 필요가 없다!!!!!!!!!!!!
       sum(salary) over(order by employee_id)
from employees;

select employee_id, hire_date, salary,
       sum(salary) over(order by hire_date)
from employees;





select p_name AS 제품명, SALES_MONTH AS 판매월, AMOUNT_OF_THISMONTH AS 월별판매량,
       sum(AMOUNT_OF_THISMONTH) over(order by SALES_MONTH) AS 누계판매량
from
(
select p_name, to_char(sales_date, 'yyyy-mm') AS SALES_MONTH,
       sum(amount) AS AMOUNT_OF_THISMONTH
from tbl_shop
where p_name = 'shrimp'
group by p_name, to_char(sales_date, 'yyyy-mm')
) V;




select p_name AS 제품명, SALES_TODAY AS 판매일, AMOUNT_OF_TODAY AS 일별판매량,
       sum(AMOUNT_OF_TODAY) over(order by SALES_TODAY) AS 누계판매량
from
(
select p_name, to_char(sales_date, 'yyyy-mm-dd') AS SALES_TODAY,
       sum(amount) AS AMOUNT_OF_TODAY
from tbl_shop
where p_name = 'shrimp'
group by p_name, to_char(sales_date, 'yyyy-mm-dd')
) V;



select p_name AS 제품명, to_char(sales_date, 'yyyy-mm') AS 판매월, sum(amount) AS 판매량,
       sum(sum(amount)) over( partition by p_name order by to_char(sales_date, 'yyyy-mm')) AS 누계판매량     -- 출력될 내용들을 한번더 정렬 해주는 partition by
from tbl_shop
group by p_name, to_char(sales_date, 'yyyy-mm');


-- 2216