--================= *** 테이블 생성하기 *** =====================

-- 1.      1 : 1 관계의 테이블 생성하기

 create table tbl_userlogin
 (
    userid  varchar2(20)   not null,
    passwd  varchar2(20)   not null,
    name    varchar2(30)   not null,
    constraint PK_tbl_userlogin_userid primary key(userid)
 );
 
 create table tbl_userdetail
 (
    userid  varchar2(20)   not null,
    gender  number(1)      not null,
    birth   varchar2(10)   not null,
    address varchar2(200)  not null,
    tel     varchar2(20),
    registerday  date default sysdate,
    constraint PK_tbl_userdetail_userid primary key(userid),
    constraint FK_tbl_userdetail_userid foreign key(userid)
               references tbl_userlogin(userid)                      -- 참조받는 컬럼은 고유하면서 not null 이어야 하며,
                on delete cascade,                                   -- 부모테이블인 tbl_userlogin 테이블에서 
    constraint CK_tbl_userdetail_gender check( gender in(1, 2) )     -- 어떤 행을 삭제(delete)하면 자동적으로 
 );                                                                    -- 자식테이블인 tbl_userdetail 테이블에서도
                                                                     -- userid를 가지는 행도 삭제된다.
                                                                     -- 그래서 테이블과 테이블의 관계가 1 : 1이라면
                                                                     -- foreign key 생성시 on delete cascade를 해준다.


 insert into tbl_userlogin(userid, passwd, name)
 values('superman', 'qewr1234$', '윤찬영');
  
 insert into tbl_userdetail(userid, gender, birth, address, tel)
 values('superman', 1, '1992-04-20', '경기도 용인시', '010-3223-4813');

 insert into tbl_userlogin(userid, passwd, name)
 values('wonderwoman', 'qewr1234$', '배은장');
 
 insert into tbl_userdetail(userid, gender, birth, address, tel)
 values('wonderwoman', 2, '1993-09-14', '경기도 용인시', '010-9348-2187');
 
 
 select *
 from tbl_userlogin;
 
 select *
 from tbl_userdetail;
 
 
 -- 회원 탈퇴
 delete from tbl_userlogin
 where userid = 'superman';

 rollback;


--  3506