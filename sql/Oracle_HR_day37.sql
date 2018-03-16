--- *** 자기조인( Self JOIN ) *** ---
 
 create table tbl_authorbook
 (
    bookname     varchar2(100),
    authorname   varchar2(20),
    loyalty      number(5)
 );
 
 
 insert into tbl_authorbook(bookname, authorname, loyalty)
 values('노인과바다', '정영관', 1000);
 
 insert into tbl_authorbook(bookname, authorname, loyalty)
 values('반지의제왕', '김규전', 800);
 
 insert into tbl_authorbook(bookname, authorname, loyalty)
 values('반지의제왕', '김종성', 500);
 
 insert into tbl_authorbook(bookname, authorname, loyalty)
 values('빵가게재습격', '김종성', 2500);
 
 insert into tbl_authorbook(bookname, authorname, loyalty)
 values('해리포터', '임규하', 1200);
 
 insert into tbl_authorbook(bookname, authorname, loyalty)
 values('해리포터', '이정원', 1400);
 
 insert into tbl_authorbook(bookname, authorname, loyalty)
 values('나미야잡화점의기적', '이정원', 1700);
 
 commit;
 
 select *
 from tbl_authorbook;
 
 select bookname, count(*)
 from tbl_authorbook
 group by bookname
 having count(*) > 1;
 
 select *
 from tbl_authorbook
 where bookname in( select bookname
                    from tbl_authorbook
                    group by bookname
                    having count(*) > 1);
 
 
 select *
 from tbl_authorbook A1, tbl_authorbook A2
 where A1.bookname = A2.bookname and
       A1.authorname != A2.authorname;

-- 3164