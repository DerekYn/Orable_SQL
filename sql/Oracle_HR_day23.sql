-- lag, lead 함수 (게시판에서 목록보기시 (이전글, 다음글) 많이 사용됨)


select lag(writeno, 2) over(order by writeno desc) AS BFWRITENO,  -- writeno로 내림차순 했을때 writeno 의 1개 이전 글
       writeno, userid, title,
       to_char(writeday, 'yyyy-mm-dd hh24:mi:ss') AS WRITEDAY,
       lead(writeno, 2) over(order by writeno desc) AS AFWRITENO  -- writeno로 내림차순 했을때 writeno 의 1개 다음 글
from tbl_board;



select BFWRITENO, writeno, userid, title, WRITEDAY,
       AFWRITENO
from
(
select lag(writeno, 2) over(order by writeno desc) AS BFWRITENO,
       writeno, userid, title,
       to_char(writeday, 'yyyy-mm-dd hh24:mi:ss') AS WRITEDAY,
       lead(writeno, 2) over(order by writeno desc) AS AFWRITENO
from tbl_board
) V
where writeno = 3;

-----------------------------------------------------------------------
이전글의번호   현재글번호    userid     title      작성일      다음글의 번호
-----------------------------------------------------------------------

select (select title
        from tbl_board
        where writeno = BFWRITENO) AS 이전글제목,
        writeno, userid, title, WRITEDAY,
        (select title
         from tbl_board
         where writeno = AFWRITENO) AS 다음글제목
from
(
select lag(writeno, 1) over(order by writeno desc) AS BFWRITENO,
       writeno, userid, title,
       to_char(writeday, 'yyyy-mm-dd hh24:mi:ss') AS WRITEDAY,
       lead(writeno, 1) over(order by writeno desc) AS AFWRITENO
from tbl_board
) V
where writeno = 3;


-- 2482