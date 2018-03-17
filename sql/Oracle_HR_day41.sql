--======================================= 조인 끝 =========================================

 -- *********** UNION  /  UNION  /  ALL  /  INTERSECT  /  MINUS ************* --
 1. UNION 은 테이블(뷰)와 테이블(뷰)을 합쳐서 보여주는데 이것은 행과 행을 합친 결과를 보여주는 것이다.
 
   A = { a, x, b, e, g }
   
   B = { c, d, a, b, y, k, m }
   
   A ∪ B = { }  ==>  union [ 순서대로 중복 없이 정렬 ]
                      { a, b, c, d, e, g, k, m, x, y }
                      union all [ 순서고 중복이고 상관없이 A 다쓰고 B 쓴다. ]
                      { a, x, b, e, g, c, d, a, b, y, k, m }
   
   A ∩ B = { }  ==> intersect
                     { a, b }
   A - B = { }  ==> minus
                     { x, e, g }
   B - A = { }  ==> minus
                     { c, d, y, k }
                     
                     
   select *
   from tbl_shop;
   
   insert into tbl_shop(Sales_Date, p_name, amount)
   values(sysdate, 'shrimp', 15);
   
   insert into tbl_shop(Sales_Date, p_name, amount)
   values(sysdate, 'potato', 10);
   
   insert into tbl_shop(Sales_Date, p_name, amount)
   values(sysdate, 'shrimp', 5);

   commit;
   
   
   
 select *
 from tbl_shop
 where to_char(sales_date, 'yyyy-mm') = to_char(sysdate, 'yyyy-mm');

 select *
 from tbl_shop
 where to_char(sales_date, 'yyyy-mm') = to_char(add_months(sysdate, -1), 'yyyy-mm');
 
 select *
 from tbl_shop
 where to_char(sales_date, 'yyyy-mm') = to_char(add_months(sysdate, -2), 'yyyy-mm');
   
   
 create table tbl_shop_2018_01
 as
 select *
 from tbl_shop
 where to_char(sales_date, 'yyyy-mm') = to_char(add_months(sysdate, -2), 'yyyy-mm');
 
 create table tbl_shop_2018_02
 as
 select *
 from tbl_shop
 where to_char(sales_date, 'yyyy-mm') = to_char(add_months(sysdate, -1), 'yyyy-mm');
 
 create table tbl_2018_03
 as
 select *
 from tbl_shop
 where to_char(sales_date, 'yyyy-mm') = to_char(sysdate, 'yyyy-mm');

-- 3344