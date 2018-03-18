   -- ===== *** 제약조건의 추가 *** ===== 
 alter table tbl_userlogin
 add constraint CK_tbl_userlogin_passwd check( 8 <= length(passwd) and length(passwd) <= 20);
 
 select *
 from tbl_userlogin;
 
 update tbl_userlogin set passwd = 'abcd123$'  -- 8글자 이상이면 변경 된다.
 where userid = 'superman';
 
 commit;
 
 desc tbl_userdetail;
 
 alter table tbl_userdetail
 add constraint NN_tbl_userdetail_tel tel not null;          -- 오류..
 
 제약조건의 추가시 primary key, unique, check, foreign key 제약의 추가는 아래와 같이 한다.
 alter table 테이블 명
 add constraint 컨스트레인트 명    primary key(컬럼명);
 add constraint 컨스트레인트 명    unique(컬럼명);
 add constraint 컨스트레인트 명    foreign key(컬럼명);
                references 부모테이블명(참조받는 컬럼명);
                
 제약조건 추가시 not null은 아래와 같이 한다.
 alter table tbl_userdetail
 modify tel not null;

-- 3940