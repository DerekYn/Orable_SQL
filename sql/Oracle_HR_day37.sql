--- *** �ڱ�����( Self JOIN ) *** ---
 
 create table tbl_authorbook
 (
    bookname     varchar2(100),
    authorname   varchar2(20),
    loyalty      number(5)
 );
 
 
 insert into tbl_authorbook(bookname, authorname, loyalty)
 values('���ΰ��ٴ�', '������', 1000);
 
 insert into tbl_authorbook(bookname, authorname, loyalty)
 values('����������', '�����', 800);
 
 insert into tbl_authorbook(bookname, authorname, loyalty)
 values('����������', '������', 500);
 
 insert into tbl_authorbook(bookname, authorname, loyalty)
 values('�����������', '������', 2500);
 
 insert into tbl_authorbook(bookname, authorname, loyalty)
 values('�ظ�����', '�ӱ���', 1200);
 
 insert into tbl_authorbook(bookname, authorname, loyalty)
 values('�ظ�����', '������', 1400);
 
 insert into tbl_authorbook(bookname, authorname, loyalty)
 values('���̾���ȭ���Ǳ���', '������', 1700);
 
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