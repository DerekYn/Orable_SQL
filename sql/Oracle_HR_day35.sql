-- NON-EQUI JOIN 
--> 어떤 컬럼의 값이 특정 범위에 속할 때 사용하는 JOIN 이다.

-- 소득세율 지표관련 테이블
 create table tbl_taxindex
 ( 
   lowerincome  number,  -- 연봉의 최저
   highincome   number,  -- 연봉의 최대  
   taxpercent   number(2, 2)   -- 세율   (-0.99 ~ 0.99)
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