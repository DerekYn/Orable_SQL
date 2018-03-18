  -- ===== *** 제약조건의 조회 *** ===== 
  -- 제약조건의 종류
 /*
  1. Primary Key    (P)
  2. Unique         (U)
  3. Check          (C)
  4. Foreign Key    (R)
  5. Not NULL       (C)
 */
 
 select *
 from user_constraints
 where table_name = 'TBL_WOKER';
 
 select *
 from user_constraints
 where table_name = 'TBL_USER';
 
 select *
 from user_cons_columns
 where table_name = 'TBL_USERDETAIL';
 
 select *
 from user_constraints
 where table_name = 'TBL_USERDETAIL';
 
 -- 제약조건의 조회는 다음과 같이 JOIN을 이용하여 확인한다.
 
 select *
 from user_constraints A join user_cons_columns B
 on A.constraint_name = B.constraint_name
 where A.table_name = 'TBL_USERDETAIL';


-- 3909