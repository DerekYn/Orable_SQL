 --===== ������ �����ϱ� =====
 drop sequence seq_tbl_order;
 
 create sequence seq_tbl_order
 start with 1
 increment by 1
 nomaxvalue
 nominvalue
 nocycle
 nocache;
              
              
 create table tbl_order
 (
    orderno   varchar2(30)   not null,
    userid    varchar2(20)   not null,
    orderday date default sysdate not null,
    constraint PK_tbl_order_orderno primary key(orderno),
    constraint FK_tbl_order_userid foreign key(userid)
               references tbl_userdetail(userid)                   -- ���� �޴� �÷��� �������� ������ ����!!!
 );
 

 insert into tbl_order(orderno, userid, orderday)
 values(to_char(sysdate, 'yyyymmdd') || '-' || seq_tbl_order.nextval, 'superman', default);
 
 commit;
 
 
 select *
 from tbl_order;


-- 3713