-------------------------------------------------------------------------------
                         -- ★★★   JOIN    ★★★ --
-------------------------------------------------------------------------------
 JOIN(조인)은 테이블(뷰)와 테이블을 합치는 것을 말하는데 행(ROW)을 합치는 것이 아니라, 
                                        컬럼(COLUMN)과 컬럼을 합치는 것을 말한다.
 그리고 서로 다른 테이블(뷰)의 행(ROW)과 행을 합치는 것을 UNION 연산자를 사용하는 것이다.                        
 
 A = { 1, 2, 3 }  원소가 3개
 B = { a, b }     원소가 2개
 
 A ⊙ B = { (1,a), (1,b),
            (2,a), (2,b),
            (3,a), (3,b) }
            
  데카르트곱(수학) ==> 원소의 곱 : 3 * 2 = 6개 (모든 경우의 수)
  --> 데카르트곱을 데이터베이스에서는 Catersian Product
  
  
  select *
  from employees;
  
  select count(*)
  from employees;   -- 107개
  
  
  select department_id
  from employees;
  
  select count(*)
  from departments;   -- 27개
  
  select count(*), 107 * 27  -- 모든 행의 결합의 경우의 수 .. JOIN!!
  from employees, departments;

  -- JOIN : SQL 1992 CODE 방식(데이터베이스 밴더마다 문법이 다름)과
  --        SQL 1999 CODE 방식(ANSI SQL 표준화)
  
  -- 1. SQL 1992 CODE 방식 ==> 테이블(뷰)와 테이블(뷰) 사이에 comma(,)를 찍어주는 방식.
  -- 2.     1999 CODE 방식 ==> 테이블(뷰)와 테이블(뷰) 사이에 조인시 JOIN 이라는 단어를 넣는 방식.
  

-- 2807