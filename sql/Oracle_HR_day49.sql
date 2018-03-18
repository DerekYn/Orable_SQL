 ------------------------------------------------
        ��ǥ   ��ǰ��   �ֹ���   �ܰ�   �ֹ���
 ------------------------------------------------
 
 select A.orderno AS ��ǥ,
        C.Productname AS ��ǰ��,
        B.quantity AS �ֹ���,
        B.price AS �ܰ�,                     -- ���� �ܰ��� �ƴ� �� ��� ���� �ܰ�
        B.quantity * B.price AS �ֹ���
 from tbl_order A join tbl_order_detail B   -- ������ȭ �׶� �� �ܰ��� �� �ִ�.
 on A.orderno = B.FK_orderno
 join tbl_product C
 on B.FK_productcode = C.productcode
 where A.userid = 'superman';
 
 update tbl_product set price = price * 1.1  -- ������ ������ ����
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
  );            -- ���� primary key ������
  
  
  drop table tbl_woker purge;
 
 
  create table tbl_woker
 (
    wokerno      varchar2(20),
    wokername    varchar2(30),
    personalno   varchar2(13)   not null,
    constraint PK_tbl_woker_wokerno primary key(wokerno),
    constraint PK_tbl_woker_personalno unique(personalno),
    constraint PK_tbl_woker_wokername unique(wokername)
  );     -- �� ���̺� �� unique key  ������ ������ �����ϳ�, primary key ������ �� 1���� ����.
  
  
  select *
  from tbl_woker;
  
  insert into tbl_woker(wokerno, wokername, personalno)
  values('kh1001', '������', '9204301564599');
  
  insert into tbl_woker(wokerno, wokername, personalno)
  values('kh1002', '�Ѽ���', '9204301564599');  -- unique ���ට���� ����
  
  insert into tbl_woker(wokerno, wokername, personalno)
  values('kh1003', '������', '8718661249953');  -- unique ���ට���� ����
  
  insert into tbl_woker(wokerno, wokername, personalno)
  values('kh1004', null, '9204301564599');   -- ����Ŭ�� null�� �͵���
  
  insert into tbl_woker(wokerno, wokername, personalno)
  values('kh1005', null, '9204301564599');   -- �㳪 ms�� null�� ���� �ѹ��� ���� �� ���� ���ʹ� ����
  
  insert into tbl_woker(wokerno, wokername, personalno)
  values('kh1006', '������', null);       -- ����
  
  commit;


-- 3875