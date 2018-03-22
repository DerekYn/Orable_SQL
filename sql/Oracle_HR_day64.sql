 ------ *** procedure, function, trigger 의 소스 보기 *** ------
 
 
 select *
 from user_source
 where type = 'PROCEDURE';
 
 select *         
 from user_source
 where type = 'FUNCTION';
 
 select distinct name          -- distinct 중복을 제거하고 단 한개만 선택
 from user_source
 where type = 'FUNCTION';
 
 select *         
 from user_source
 where type = 'FUNCTION' and name = 'FUNC_GENDER';
 
 select line, text
 from user_source
 where type = 'PROCEDURE' and name = 'PCD EMPINFO';
 
 
   ----- **** 제어문(if 문) **** ------

※ 형식
 if     조건1  then 실행문장1;
 elsif  조건2  then 실행문장2; 
 else   실행문장3;
 end if;

-- 4707