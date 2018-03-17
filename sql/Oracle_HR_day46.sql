  create table tbl_category           -- 제품 카테고리 테이블
 (
     categorycode   number(5)     not null,
     categoryname   varchar2(100) not null,
     constraint PK_tbl_category_categorycode primary key(categorycode)
 );
 
 insert into tbl_category(categorycode, categoryname)
 values(1, '전자제품');
 
 insert into tbl_category(categorycode, categoryname)
 values(2, '의류');
 
 insert into tbl_category(categorycode, categoryname)
 values(3, '도서');
 
 commit;
 
 
 create table tbl_product             -- 제품 테이블
 (
    productcode      varchar2(20)   not null,
    fk_categorycode  number(5)      not null,
    productname      varchar2(100)  not null,
    price            number         not null,
    launchingday     date,
    constraint PK_tbl_product_productcode primary key(productcode),
    constraint FK_tbl_product_fk_categorycode foreign key(fk_categorycode)
               references tbl_category(categorycode)
               on delete cascade
 );
 
 insert into tbl_product(productcode, fk_categorycode, productname, price, launchingday)
 values('ss12345', 1, '싱싱냉장고', 700000, to_date('2017-05-01', 'yyyy-mm-dd') );
 
 insert into tbl_product(productcode, fk_categorycode, productname, price, launchingday)
 values('jj12345', 1, 'LED 와이드 Tv', 900000, to_date('2017-03-01', 'yyyy-mm-dd') );
 
 commit;


-- 3680