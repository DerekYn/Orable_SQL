 ----- ***  상관 서브 쿼리를 이용한 UPDATE 처리 *** --------
 
 
 -- 테이블 복사하기
 create table tbl_empcopy
 as
 select * from employees;
 
 
 update employees set first_name = '윤찬영';
 
 commit;
 
 select *
 from employees;
 
 
 update employees set first_name = '이', last_name = '순신';
 
 rollback;

--2715