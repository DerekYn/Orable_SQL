-- *** 테이블 삭제하기(휴지통에 버리기) *** --
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
 
 --- *** 휴지통 보기 *** ---
 select *
 from user_recyclebin;
 
 --- *** 휴지통에 있던것을 복원하기 *** ---
 flashback table TBL_EMPCOPY1 to before drop;
 flashback table TBL_EMPCOPY2 to before drop;
 flashback table TBL_EMPCOPY3 to before drop;
 
 select *
 from tbl_empcopy1;
 
 select *
 from tbl_empcopy2;
 
 select *
 from tbl_empcopy3;
 
 -- *** 테이블 영구히 삭제하기(휴지통 비우기) *** -- 
 drop table tbl_empcopy1;
 drop table tbl_empcopy2;
 drop table tbl_empcopy3;
 
 select *
 from user_recyclebin;
 
 purge table TBL_EMPCOPY1;
 
 select *
 from user_recyclebin;
 
 -- 휴지통에 있는 모든 것을 비우기(삭제하기)
 purge recyclebin;

 select *
 from user_recyclebin;

 -- 테이블 삭제시 휴지통에 버리지 않고 영구히 삭제하기
 select *
 from tbl_empcopy4;

 select *
 from tbl_empcopy5;

 drop table tbl_empcopy4 purge; -- 영구히 삭제
 drop table tbl_empcopy5; -- 휴지통에 버리기

 select *
 from user_recyclebin;

-- 4237