-- ���̺�� �����ϱ�
 rename tbl_2018_03 to tbl_shop_2018_03;
 
 
 select *
 from tbl_shop_2018_01;
 
 select *
 from tbl_shop_2018_02;
 
 select *
 from tbl_shop_2018_03;
 
 delete from tbl_shop
 where to_char(sales_date, 'yyyy-mm') != to_char(sysdate, 'yyyy-mm');
 
 commit;
 
 ------------------------------------------------
 ��ǰ��               �Ǹſ�               ���Ǹŷ�
 ------------------------------------------------
 
 
 select P_name AS ��ǰ��,
        to_char(sales_date, 'yyyy-mm') AS �Ǹſ�,
        sum(amount) AS ���Ǹŷ�
 from
 (
   select *
   from tbl_shop_2018_01
   UNION
   select *
   from tbl_shop_2018_02
   UNION
   select *
   from tbl_shop
  ) V
 group by rollup( P_name, to_char(sales_date, 'yyyy-mm') );
 
 
  select *
  from tbl_shop_2018_02
  UNION ALL
  select *
  from tbl_shop_2018_01
  UNION ALL
  select *
  from tbl_shop;
 
 
  insert into tbl_shop
  select *
  from tbl_shop_2018_02
  where P_name = 'shrimp';
   
  
  select *
  from tbl_shop
  Intersect
  select *
  from tbl_shop_2018_02;  -- tbl_shop(3��) �� tbl_shop_2018_02�� ������
  
  
  select *
  from tbl_shop
  minus
  select *
  from tbl_shop_2018_02;  -- tbl_shop(3��)���� tbl_shop_2018_02�� �� ������
  
  
  select *
  from tbl_shop_2018_02
  minus
  select *
  from tbl_shop;          -- tbl_shop_2018_02���� tbl_shop(3��)�� �� ������
  
  
  select *
   from tbl_shop_2018_01
   UNION
   select Sales_Date AS �Ǹ���,
          P_name AS ��ǰ��,
          amount AS �Ǹŷ�                       -- �߰��� ���������� ����ȵ�
   from tbl_shop_2018_02
   UNION
   select *
   from tbl_shop;
   
   
   select to_char(Sales_Date, 'yyyy-mm') AS �Ǹ���,
          P_name AS ��ǰ��,
          amount AS �Ǹŷ�                             -- �� select������ ���� ������ ������ ǥ��������Ѵ�.
   from tbl_shop_2018_01                              -- �÷����� �ٸ� ������ Ÿ���� �� �� �����ϱ�.
   UNION
   select *                     
   from tbl_shop_2018_02
   UNION
   select *
   from tbl_shop;

   rank()


-- 3446