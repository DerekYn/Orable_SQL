-- row_number 함수 ★★★★                               -- partition by 를 사용할 수 있다. 그들만의 number를 지정가능!!  ( 2422 참조 )
-- rownum ★★★★★     의사컬럼( pseudocode 가짜 컬럼 )    -- 조건절에 사용 불가 무조건 인라인 뷰 후 AS 별칭으로 붙여 조건절에 사용해주기!!!!!!!!!!!

create table tbl_board
(writeno  number not null,               -- 글번호
userid    varchar2(20) not null,         -- 사용자ID
title     varchar(100) not null,         -- 글제목
writeday  date default sysdate not null, -- 글작성일자
constraint PK_tbl_board_writeno primary key(writeno)
);


--- *** 시퀀스 생성하기 *** ---
create sequence seq_tbl_board
start with 1
increment by 1
nomaxvalue       -- 게시판은 한바퀴 잘 안돌기 때문에 ... 다른 것이라면 maxvalue 20 처럼 값을 준다.
nominvalue
nocycle
nocache;


insert into tbl_board(writeno, userid, title)
values(seq_tbl_board.nextval, 'leess', '안녕하세요? 이순신 입니다.');

insert into tbl_board(writeno, userid, title)
values(seq_tbl_board.nextval, 'hansk', '안녕하세요? 한석규 입니다.');

insert into tbl_board(writeno, userid, title)
values(seq_tbl_board.nextval, 'honggd', '안녕하세요? 홍길동 입니다.');

insert into tbl_board(writeno, userid, title)
values(seq_tbl_board.nextval, 'leess', '안녕하세요? 충무공 이순신 입니다.');

insert into tbl_board(writeno, userid, title)
values(seq_tbl_board.nextval, 'honggd', '안녕하세요? 동해번쩍 서해 번쩍 홍길동 입니다.');

select writeno, userid, title,
       to_char(writeday, 'yyyy-mm-dd hh24:mi:ss') AS writeday
from tbl_board;

delete from tbl_board
where writeno = 2;

commit;

delete from tbl_board
where writeno = 4;

commit;

insert into tbl_board(writeno, userid, title)
values(seq_tbl_board.nextval, 'eom', '엄정화 인사드립니다.');

insert into tbl_board(writeno, userid, title)
values(seq_tbl_board.nextval, 'dusk', '여러분의 두석규 인사드립니다.');

commit;


select T.*              -- 나중에 게시판 만들때 무조건 읽어보기!!!!! ★☆★☆★☆★☆★☆★☆★☆
from
(
  select rownum AS RNO, V.writeno, userid, title,      -- rownum 은 조건절에서 사용할 수 없어서 인라인 뷰 이후 AS 를 해줘서 별칭으로 써준다.!!!
         writeday
  from
  (
    select writeno, userid, title,
           to_char(writeday, 'yyyy-mm-dd hh24:mi:ss') AS writeday
    from tbl_board
    order by writeno asc
  ) V
) T
order by T.RNO desc;


select rno, writeno, userid, title, writeday
from
(
select row_number() over(order by writeno asc) AS RNO,
       writeno, userid, title,
       to_char(writeday, 'yyyy-mm-dd hh24:mi:ss') AS writeday
from tbl_board
) V
order by writeno desc;
-- where row_number() over(order by writeno) = 3; --------   오류 !!! 무조건 inline view 를 사용해서 AS 별명으로 해줄것!!


select rno, writeno, userid, title, writeday
from
(
select row_number() over(order by writeno asc) AS RNO,
       writeno, userid, title,
       to_char(writeday, 'yyyy-mm-dd hh24:mi:ss') AS writeday
from tbl_board
) V
where rno = 3;
-- where row_number() over(order by writeno) = 3; --------   오류 !!! 무조건 inline view 를 사용해서 AS 별명으로 해줄것!!




select RNO, 글번호, 글제목
from
(
  select rownum AS RNO, 글번호, 글제목
  from
  (
    select employee_id AS 글번호, first_name || ' ' || last_name AS 글제목
    from employees
    order by 1 asc
  ) V
  order by RNO desc
) T;



select RNO, 글번호, 글제목
from
(
select row_number() over(order by employee_id asc) AS RNO,
       employee_id AS 글번호, first_name || ' ' || last_name AS 글제목
from employees
) V
order by 글번호 desc;


select department_id, RNO, 글번호, 글제목
from
(
select row_number() over( partition by department_id
                          order by employee_id asc) AS RNO,
       department_id,
       employee_id AS 글번호, first_name || ' ' || last_name AS 글제목
from employees
) V
order by department_id, 글번호 desc;


-- 2433