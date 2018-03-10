-- row_number �Լ� �ڡڡڡ�                               -- partition by �� ����� �� �ִ�. �׵鸸�� number�� ��������!!  ( 2422 ���� )
-- rownum �ڡڡڡڡ�     �ǻ��÷�( pseudocode ��¥ �÷� )    -- �������� ��� �Ұ� ������ �ζ��� �� �� AS ��Ī���� �ٿ� �������� ������ֱ�!!!!!!!!!!!

create table tbl_board
(writeno  number not null,               -- �۹�ȣ
userid    varchar2(20) not null,         -- �����ID
title     varchar(100) not null,         -- ������
writeday  date default sysdate not null, -- ���ۼ�����
constraint PK_tbl_board_writeno primary key(writeno)
);


--- *** ������ �����ϱ� *** ---
create sequence seq_tbl_board
start with 1
increment by 1
nomaxvalue       -- �Խ����� �ѹ��� �� �ȵ��� ������ ... �ٸ� ���̶�� maxvalue 20 ó�� ���� �ش�.
nominvalue
nocycle
nocache;


insert into tbl_board(writeno, userid, title)
values(seq_tbl_board.nextval, 'leess', '�ȳ��ϼ���? �̼��� �Դϴ�.');

insert into tbl_board(writeno, userid, title)
values(seq_tbl_board.nextval, 'hansk', '�ȳ��ϼ���? �Ѽ��� �Դϴ�.');

insert into tbl_board(writeno, userid, title)
values(seq_tbl_board.nextval, 'honggd', '�ȳ��ϼ���? ȫ�浿 �Դϴ�.');

insert into tbl_board(writeno, userid, title)
values(seq_tbl_board.nextval, 'leess', '�ȳ��ϼ���? �湫�� �̼��� �Դϴ�.');

insert into tbl_board(writeno, userid, title)
values(seq_tbl_board.nextval, 'honggd', '�ȳ��ϼ���? ���ع�½ ���� ��½ ȫ�浿 �Դϴ�.');

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
values(seq_tbl_board.nextval, 'eom', '����ȭ �λ�帳�ϴ�.');

insert into tbl_board(writeno, userid, title)
values(seq_tbl_board.nextval, 'dusk', '�������� �μ��� �λ�帳�ϴ�.');

commit;


select T.*              -- ���߿� �Խ��� ���鶧 ������ �о��!!!!! �ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ�
from
(
  select rownum AS RNO, V.writeno, userid, title,      -- rownum �� ���������� ����� �� ��� �ζ��� �� ���� AS �� ���༭ ��Ī���� ���ش�.!!!
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
-- where row_number() over(order by writeno) = 3; --------   ���� !!! ������ inline view �� ����ؼ� AS �������� ���ٰ�!!


select rno, writeno, userid, title, writeday
from
(
select row_number() over(order by writeno asc) AS RNO,
       writeno, userid, title,
       to_char(writeday, 'yyyy-mm-dd hh24:mi:ss') AS writeday
from tbl_board
) V
where rno = 3;
-- where row_number() over(order by writeno) = 3; --------   ���� !!! ������ inline view �� ����ؼ� AS �������� ���ٰ�!!




select RNO, �۹�ȣ, ������
from
(
  select rownum AS RNO, �۹�ȣ, ������
  from
  (
    select employee_id AS �۹�ȣ, first_name || ' ' || last_name AS ������
    from employees
    order by 1 asc
  ) V
  order by RNO desc
) T;



select RNO, �۹�ȣ, ������
from
(
select row_number() over(order by employee_id asc) AS RNO,
       employee_id AS �۹�ȣ, first_name || ' ' || last_name AS ������
from employees
) V
order by �۹�ȣ desc;


select department_id, RNO, �۹�ȣ, ������
from
(
select row_number() over( partition by department_id
                          order by employee_id asc) AS RNO,
       department_id,
       employee_id AS �۹�ȣ, first_name || ' ' || last_name AS ������
from employees
) V
order by department_id, �۹�ȣ desc;


-- 2433