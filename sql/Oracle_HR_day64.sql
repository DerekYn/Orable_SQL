 ------ *** procedure, function, trigger �� �ҽ� ���� *** ------
 
 
 select *
 from user_source
 where type = 'PROCEDURE';
 
 select *         
 from user_source
 where type = 'FUNCTION';
 
 select distinct name          -- distinct �ߺ��� �����ϰ� �� �Ѱ��� ����
 from user_source
 where type = 'FUNCTION';
 
 select *         
 from user_source
 where type = 'FUNCTION' and name = 'FUNC_GENDER';
 
 select line, text
 from user_source
 where type = 'PROCEDURE' and name = 'PCD EMPINFO';
 
 
   ----- **** ���(if ��) **** ------

�� ����
 if     ����1  then ���๮��1;
 elsif  ����2  then ���๮��2; 
 else   ���๮��3;
 end if;

-- 4707