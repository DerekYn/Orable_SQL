-- lag, lead �Լ� (�Խ��ǿ��� ��Ϻ���� (������, ������) ���� ����)


select lag(writeno, 2) over(order by writeno desc) AS BFWRITENO,  -- writeno�� �������� ������ writeno �� 1�� ���� ��
       writeno, userid, title,
       to_char(writeday, 'yyyy-mm-dd hh24:mi:ss') AS WRITEDAY,
       lead(writeno, 2) over(order by writeno desc) AS AFWRITENO  -- writeno�� �������� ������ writeno �� 1�� ���� ��
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
�������ǹ�ȣ   ����۹�ȣ    userid     title      �ۼ���      �������� ��ȣ
-----------------------------------------------------------------------

select (select title
        from tbl_board
        where writeno = BFWRITENO) AS ����������,
        writeno, userid, title, WRITEDAY,
        (select title
         from tbl_board
         where writeno = AFWRITENO) AS ����������
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