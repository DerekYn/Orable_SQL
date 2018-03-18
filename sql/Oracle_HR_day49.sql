 ------------------------------------------------
        전표   제품명   주문량   단가   주문액
 ------------------------------------------------
 
 select A.orderno AS 전표,
        C.Productname AS 제품명,
        B.quantity AS 주문량,
        B.price AS 단가,                     -- 현재 단가가 아닌 그 당시 결제 단가
        B.quantity * B.price AS 주문액
 from tbl_order A join tbl_order_detail B   -- 역정규화 그때 그 단가가 들어가 있다.
 on A.orderno = B.FK_orderno
 join tbl_product C
 on B.FK_productcode = C.productcode
 where A.userid = 'superman';
 
 update tbl_product set price = price * 1.1  -- 물건의 가격이 변경
 where productcode = 'ss12345';
 
 
 insert into tbl_order(orderno, userid, orderday)
 values(to_char(sysdate, 'yyyymmdd') || '-' || seq_tbl_order.nextval, 'superman', default);
 
 
 insert into tbl_order_detail(orderdetailno, fk_orderno, fk_productcode, quantity, price)
 values(seq_tbl_order_detail.nextval,
        ( select max(orderno)
          from tbl_order 
          where userid = 'superman'),
         'ss12345',
         2,
         ( select price
           from tbl_product
           where productcode = 'ss12345'
          )
 );
 
 commit;
 
 
 
 create table tbl_woker
 (
    wokerno      varchar2(20),
    wokername    varchar2(30)   not null,
    personalno   varchar2(13)   not null,
    constraint PK_tbl_woker_wokerno primary key(wokerno, personalno)
  );            -- 복합 primary key 설정법
  
  
  drop table tbl_woker purge;
 
 
  create table tbl_woker
 (
    wokerno      varchar2(20),
    wokername    varchar2(30),
    personalno   varchar2(13)   not null,
    constraint PK_tbl_woker_wokerno primary key(wokerno),
    constraint PK_tbl_woker_personalno unique(personalno),
    constraint PK_tbl_woker_wokername unique(wokername)
  );     -- 한 테이블 당 unique key  제약은 여러번 가능하나, primary key 제약은 단 1번만 가능.
  
  
  select *
  from tbl_woker;
  
  insert into tbl_woker(wokerno, wokername, personalno)
  values('kh1001', '리순신', '9204301564599');
  
  insert into tbl_woker(wokerno, wokername, personalno)
  values('kh1002', '한석규', '9204301564599');  -- unique 제약때문에 오류
  
  insert into tbl_woker(wokerno, wokername, personalno)
  values('kh1003', '리순신', '8718661249953');  -- unique 제약때문에 오류
  
  insert into tbl_woker(wokerno, wokername, personalno)
  values('kh1004', null, '9204301564599');   -- 오라클은 null이 와도됨
  
  insert into tbl_woker(wokerno, wokername, personalno)
  values('kh1005', null, '9204301564599');   -- 허나 ms는 null은 오직 한번만 가능 이 이후 부터는 오류
  
  insert into tbl_woker(wokerno, wokername, personalno)
  values('kh1006', '엄순정', null);       -- 오류
  
  commit;


-- 3875