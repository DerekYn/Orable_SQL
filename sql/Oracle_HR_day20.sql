---- **** Stored View 생성하기 **** ----
create or replace view view_shop            -- view_shop 이란 뷰를 만드는데 이미 있으면 새로 교체하고 없으면 새로 만들어라~~!
AS
select p_name AS 제품명, to_char(sales_date, 'yyyy-mm') AS 판매월, sum(amount) AS 판매량,
       sum(sum(amount)) over( partition by p_name order by to_char(sales_date, 'yyyy-mm')) AS 누계판매량     -- 출력될 내용들을 한번더 정렬 해주는 partition by
from tbl_shop
group by p_name, to_char(sales_date, 'yyyy-mm');


select *
from view_shop
where 제품명 in ('potato', 'shrimp');

select *
from view_shop
where 판매월 = to_char(sysdate, 'yyyy-mm');


desc view_shop;

-- ** 회사가서 처음 DB를 보면 ..

select * from tab;
-- 현재 오라클 서버에 접속한 사용자(지금은 HR) 소유의 테이블명과 뷰명을 모두 보여준다.

select *
from user_views;

select text
from user_views
where view_name = 'VIEW_SHOP';

create or replace view view_shop
AS
select p_name AS 제품명, to_char(sales_date, 'yyyy-mm') AS 판매월, sum(amount) AS 월판매량,
       sum(sum(amount)) over( partition by p_name order by to_char(sales_date, 'yyyy-mm')) AS 누계판매량     -- 출력될 내용들을 한번더 정렬 해주는 partition by
from tbl_shop
group by p_name, to_char(sales_date, 'yyyy-mm');

desc view_shop;


-- 2258