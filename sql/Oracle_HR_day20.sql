---- **** Stored View �����ϱ� **** ----
create or replace view view_shop            -- view_shop �̶� �並 ����µ� �̹� ������ ���� ��ü�ϰ� ������ ���� ������~~!
AS
select p_name AS ��ǰ��, to_char(sales_date, 'yyyy-mm') AS �Ǹſ�, sum(amount) AS �Ǹŷ�,
       sum(sum(amount)) over( partition by p_name order by to_char(sales_date, 'yyyy-mm')) AS �����Ǹŷ�     -- ��µ� ������� �ѹ��� ���� ���ִ� partition by
from tbl_shop
group by p_name, to_char(sales_date, 'yyyy-mm');


select *
from view_shop
where ��ǰ�� in ('potato', 'shrimp');

select *
from view_shop
where �Ǹſ� = to_char(sysdate, 'yyyy-mm');


desc view_shop;

-- ** ȸ�簡�� ó�� DB�� ���� ..

select * from tab;
-- ���� ����Ŭ ������ ������ �����(������ HR) ������ ���̺��� ����� ��� �����ش�.

select *
from user_views;

select text
from user_views
where view_name = 'VIEW_SHOP';

create or replace view view_shop
AS
select p_name AS ��ǰ��, to_char(sales_date, 'yyyy-mm') AS �Ǹſ�, sum(amount) AS ���Ǹŷ�,
       sum(sum(amount)) over( partition by p_name order by to_char(sales_date, 'yyyy-mm')) AS �����Ǹŷ�     -- ��µ� ������� �ѹ��� ���� ���ִ� partition by
from tbl_shop
group by p_name, to_char(sales_date, 'yyyy-mm');

desc view_shop;


-- 2258