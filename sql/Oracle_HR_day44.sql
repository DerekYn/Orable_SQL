         ��        ������          �ֹ�         �ֹ���
         1      :     1               ��
                  userid(P.K)      userid(F.K)
                                        1      :     ��         
                                   �ֹ���ȣ(P.K)     �ֺй�ȣ(F.K) cascade
 
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
               references tbl_userdetail(userid)                   -- ���� �޴� �÷��� �������� ������ ����!!!
 );
 
 select *
 from tbl_order;
    
 insert into tbl_order(orderno, userid, orderday)
 values(to_char(sysdate, 'yyyymmdd') || '-' || seq_tbl_order.nextval, 'superman', default);
 
  -- ȸ�� Ż��
 delete from tbl_userlogin
 where userid = 'superman';


-- 3551