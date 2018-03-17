         고객        고객세부          주문         주문상세
         1      :     1               다
                  userid(P.K)      userid(F.K)
                                        1      :     다         
                                   주문번호(P.K)     주분번호(F.K) cascade
 
 select *              
 from dictionary
 where table_name like 'USER_%' and
       lower(comments) like '%sequence%';
       
 select *
 from USER_SEQUENCES;
 
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
 
 select *
 from tbl_order;
    
 insert into tbl_order(orderno, userid, orderday)
 values(to_char(sysdate, 'yyyymmdd') || '-' || seq_tbl_order.nextval, 'superman', default);
 
  -- 회원 탈퇴
 delete from tbl_userlogin
 where userid = 'superman';


-- 3551