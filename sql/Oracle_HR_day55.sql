-- *** ���̺� �����ϱ�(�����뿡 ������) *** --
 drop table tbl_empcopy1;
 
 drop table tbl_empcopy2;
 
 select * from tab;
 
 drop table tbl_empcopy3;
 
 select * from tab;
 
 select *
 from tbl_empcopy1;

 select *
 from tbl_empcopy2;

 select *
 from tbl_empcopy3;
 
 select *
 from "BIN$PGwKN9kwQYiZdBrx50eEug==$0";

 select *
 from "BIN$Wg5Lub4uQrStwcWHwr+nNg==$0";

 select *
 from "BIN$xMunQdPDTx69pUhV9sh7fw==$0";
 
 --- *** ������ ���� *** ---
 select *
 from user_recyclebin;
 
 --- *** �����뿡 �ִ����� �����ϱ� *** ---
 flashback table TBL_EMPCOPY1 to before drop;
 flashback table TBL_EMPCOPY2 to before drop;
 flashback table TBL_EMPCOPY3 to before drop;
 
 select *
 from tbl_empcopy1;
 
 select *
 from tbl_empcopy2;
 
 select *
 from tbl_empcopy3;
 
 -- *** ���̺� ������ �����ϱ�(������ ����) *** -- 
 drop table tbl_empcopy1;
 drop table tbl_empcopy2;
 drop table tbl_empcopy3;
 
 select *
 from user_recyclebin;
 
 purge table TBL_EMPCOPY1;
 
 select *
 from user_recyclebin;
 
 -- �����뿡 �ִ� ��� ���� ����(�����ϱ�)
 purge recyclebin;

 select *
 from user_recyclebin;

 -- ���̺� ������ �����뿡 ������ �ʰ� ������ �����ϱ�
 select *
 from tbl_empcopy4;

 select *
 from tbl_empcopy5;

 drop table tbl_empcopy4 purge; -- ������ ����
 drop table tbl_empcopy5; -- �����뿡 ������

 select *
 from user_recyclebin;

-- 4237