-- *** ���̺� �÷� �߰��ϱ� *** --
 -- tbl_woker ���̺� email �̶�� �÷� �߰�
 alter table tbl_woker
 add email varchar2(30);
 
 desc tbl_woker;
 
 select *
 from tbl_woker;
 
 
 -- *** ���̺� �����ϱ� *** --
 -- tbl_woker ���̺� email �̶�� �÷� ����
 alter table tbl_woker
 drop column email;
 
 
 
  -- tbl_woker ���̺� email �̶�� �÷� �߰� but email �÷��� not null ������ �ְ��� �Ѵ�.
 alter table tbl_woker
 add email varchar2(30) not null;  -- ���� because �̹� tbl_woker ���̺��� 
                                   -- �����Ͱ� �� �ִ� �����ε�
                                   -- email �÷��� �־����� ���� not null��
                                   -- �ؾ��ϴµ� ���� �־��� ���� ���� ������ ������ �߻�!!
                                   
 alter table tbl_woker
 add email varchar2(30) default ' ' not null;    -- default ' ' �� not null�� �����Ǿ� �����غ���!!
 
 
 
 
 -- *** Ư�� ���̺� default ���� ������ �ִ��� ��ȸ�ϱ� *** --
  
 select *
 from user_tab_columns
 where table_name = 'TBL_WOKER';
 
 select column_name, Data_Default
 from user_tab_columns
 where table_name = 'TBL_WOKER';
 
 select column_name, Data_Default
 from user_tab_columns
 where table_name = 'TBL_ORDER';
 
 
 
 -- *** default �� �����ϱ� *** --
 
 alter table tbl_woker
 modify email default ' ';
 
 alter table tbl_order
 modify orderday default sysdate;
 
 select column_name, Data_Default
 from user_tab_columns
 where table_name = 'TBL_WOKER';
 
 select column_name, Data_Default
 from user_tab_columns
 where table_name = 'TBL_ORDER';

-- 4024