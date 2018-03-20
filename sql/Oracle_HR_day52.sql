    -- ===== *** 제약조건의 삭제 *** ===== 
 select *
 from user_constraints A join user_cons_columns B
 on A.constraint_name = B.constraint_name
 where A.table_name = 'TBL_USERLOGIN';
 
 alter table tbl_userlogin
 drop constraint ck_tbl_userlogin_passwd;
 
 -- ** not null 제약의 삭제는 2가지 방법이 있다. --
 alter table tbl_userlogin
 drop constraint SYS_C007062;
 
 alter table tbl_userlogin
 modify name null;

-- 3958