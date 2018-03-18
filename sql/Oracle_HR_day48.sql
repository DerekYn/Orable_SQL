 -- ===== 회원탈퇴 =====
 delete from Tbl_Userlogin
 where userid = 'superman'; -- 이렇게 탈퇴하는게 아니고, update로 해야한다.
 
 update tbl_userlogin set status = 0
 where userid = 'superman';
 
 update tbl_userdetail set status = 0
 where userid = 'superman';


 select *
 from tbl_userlogin;
 
 select *
 from tbl_userdetail;
 

 create sequence seq_tbl_order_detail
 start with 1
 increment by 1
 nomaxvalue
 nominvalue
 nocycle
 nocache;

 create table tbl_order_detail             -- 주문 상세
 (
    orderdetailno   number  not null,           -- 시퀀스 일련번호
    fk_orderno      varchar2(30)  not null,
    fk_productcode  varchar2(30)  not null,
    quantity        number        not null,
    price           number        not null,     -- 역정규화
    constraint PK_tbl_order_detail primary key(orderdetailno),
    constraint FK_tbl_order_detail_orderno foreign key(fk_orderno)
             references tbl_order(orderno)
             on delete cascade,
    constraint FK_tbl_order_detail_fk_pcode foreign key(fk_productcode)
             references tbl_product(productcode)
 );
 
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
 
 
 insert into tbl_order_detail(orderdetailno, fk_orderno, fk_productcode, quantity, price)
 values(seq_tbl_order_detail.nextval,
        ( select max(orderno)
          from tbl_order 
          where userid = 'superman'),
         'jj12345',
         1,
         ( select price
           from tbl_product
           where productcode = 'jj12345'
          )
 ); 
 
 commit;
 
 select * 
 from tbl_order;
 
 select *
 from tbl_order_detail;


-- 3789