-- *** 테이블에 컬럼 추가하기 *** --
 -- tbl_woker 테이블에 email 이라는 컬럼 추가
 alter table tbl_woker
 add email varchar2(30);
 
 desc tbl_woker;
 
 select *
 from tbl_woker;
 
 
 -- *** 테이블 삭제하기 *** --
 -- tbl_woker 테이블에 email 이라는 컬럼 삭제
 alter table tbl_woker
 drop column email;
 
 
 
  -- tbl_woker 테이블에 email 이라는 컬럼 추가 but email 컬럼은 not null 제약을 주고자 한다.
 alter table tbl_woker
 add email varchar2(30) not null;  -- 오류 because 이미 tbl_woker 테이블에는 
                                   -- 데이터가 들어가 있는 상태인데
                                   -- email 컬럼을 넣어주자 마자 not null로
                                   -- 해야하는데 값을 넣어줄 수가 없기 때문에 오류가 발생!!
                                   
 alter table tbl_woker
 add email varchar2(30) default ' ' not null;    -- default ' ' 을 not null과 연관되어 생각해보기!!
 
 
 
 
 -- *** 특정 테이블에 default 값이 무엇이 있는지 조회하기 *** --
  
 select *
 from user_tab_columns
 where table_name = 'TBL_WOKER';
 
 select column_name, Data_Default
 from user_tab_columns
 where table_name = 'TBL_WOKER';
 
 select column_name, Data_Default
 from user_tab_columns
 where table_name = 'TBL_ORDER';
 
 
 
 -- *** default 값 변경하기 *** --
 
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