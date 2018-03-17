-- 테이블명 변경하기
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
 제품명               판매월               총판매량
 ------------------------------------------------
 
 
 select P_name AS 제품명,
        to_char(sales_date, 'yyyy-mm') AS 판매월,
        sum(amount) AS 총판매량
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
  from tbl_shop_2018_02;  -- tbl_shop(3월) 과 tbl_shop_2018_02의 교집합
  
  
  select *
  from tbl_shop
  minus
  select *
  from tbl_shop_2018_02;  -- tbl_shop(3월)에서 tbl_shop_2018_02를 뺀 차집합
  
  
  select *
  from tbl_shop_2018_02
  minus
  select *
  from tbl_shop;          -- tbl_shop_2018_02에서 tbl_shop(3월)을 뺀 차집합
  
  
  select *
   from tbl_shop_2018_01
   UNION
   select Sales_Date AS 판매일,
          P_name AS 제품명,
          amount AS 판매량                       -- 중간에 별명지으면 적용안됨
   from tbl_shop_2018_02
   UNION
   select *
   from tbl_shop;
   
   
   select to_char(Sales_Date, 'yyyy-mm') AS 판매일,
          P_name AS 제품명,
          amount AS 판매량                             -- 각 select문에는 같은 데이터 형으로 표현해줘야한다.
   from tbl_shop_2018_01                              -- 컬럼마다 다른 데이터 타입이 들어갈 수 없으니까.
   UNION
   select *                     
   from tbl_shop_2018_02
   UNION
   select *
   from tbl_shop;

   rank()


-- 3446