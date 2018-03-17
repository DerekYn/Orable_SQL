 --===== 시퀀스 삭제하기 =====
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
               references tbl_userdetail(userid)                   -- 참조 받는 컬럼이 고유하지 않으면 오류!!!
 );
 

 insert into tbl_order(orderno, userid, orderday)
 values(to_char(sysdate, 'yyyymmdd') || '-' || seq_tbl_order.nextval, 'superman', default);
 
 commit;
 
 
 select *
 from tbl_order;


-- 3713