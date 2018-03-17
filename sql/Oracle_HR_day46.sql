  create table tbl_category           -- ��ǰ ī�װ� ���̺�
 (
     categorycode   number(5)     not null,
     categoryname   varchar2(100) not null,
     constraint PK_tbl_category_categorycode primary key(categorycode)
 );
 
 insert into tbl_category(categorycode, categoryname)
 values(1, '������ǰ');
 
 insert into tbl_category(categorycode, categoryname)
 values(2, '�Ƿ�');
 
 insert into tbl_category(categorycode, categoryname)
 values(3, '����');
 
 commit;
 
 
 create table tbl_product             -- ��ǰ ���̺�
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
 values('ss12345', 1, '�̳̽����', 700000, to_date('2017-05-01', 'yyyy-mm-dd') );
 
 insert into tbl_product(productcode, fk_categorycode, productname, price, launchingday)
 values('jj12345', 1, 'LED ���̵� Tv', 900000, to_date('2017-03-01', 'yyyy-mm-dd') );
 
 commit;


-- 3680