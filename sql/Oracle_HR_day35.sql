-- NON-EQUI JOIN 
--> � �÷��� ���� Ư�� ������ ���� �� ����ϴ� JOIN �̴�.

-- �ҵ漼�� ��ǥ���� ���̺�
 create table tbl_taxindex
 ( 
   lowerincome  number,  -- ������ ����
   highincome   number,  -- ������ �ִ�  
   taxpercent   number(2, 2)   -- ����   (-0.99 ~ 0.99)
 );
 
 insert into tbl_taxindex(lowerincome, highincome, taxpercent)
 values(1, 99999, 0.02);
 
 insert into tbl_taxindex(lowerincome, highincome, taxpercent)
 values(100000, 149999, 0.05);
 
 insert into tbl_taxindex(lowerincome, highincome, taxpercent)
 values(150000, 199999, 0.08);
 
 insert into tbl_taxindex(lowerincome, highincome, taxpercent)
 values(200000, 1000000000, 0.10);
 
 commit;
 
 select employee_id,
        first_name || ' ' || last_name AS ENAME,
        nvl(salary + (salary * commission_pct), salary) * 12 AS YEARSAL
 from employees;
 
 select *
 from tbl_taxindex;
 
 select rowid, lowerincome, highincome, taxpercent
 from tbl_taxindex;
 
 'AAAE8WAAEAAAAHcAAA'
 'AAAE8WAAEAAAAHcAAB'
 'AAAE8WAAEAAAAHcAAC'
 'AAAE8WAAEAAAAHcAAD'


-- 3050