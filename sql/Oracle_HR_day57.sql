 ------ **** Composite Index(복합인덱스) **** ------
 
 -- Composite Index(복합인덱스)란?
 -- 2개 이상의 컬럼을 묶어서 하나의 인덱스로 만드는 것.
 
 select jik, salary
 from tbl_woker
 where wokername = '이순신';
 -- 전제조건이 위와같이 조회하는 것이 아주 빈번하다면,
 -- wokername, jik, salary 컬럼을 묶어서 하나의 Index(인덱스)를
 -- 생성하는 것이 조회 속도가 빨라진다.
 -- ****** 아주 중요!!!! ******
 -- Composite Index(복합인덱스)를 만들때 선행컬럼을
 -- 어떤 컬럼으로 잡을것인가? 가 아주 중요하다!!!
 
 create index idx_tblwoker_test
 on tbl_woker(salary, jik, wokername);
 --> 인덱스 idx_tblwoker_test의 선행컬럼은 맨 앞 salary이다.
 
 -- *** 선행컬럼을 선택하는 기준은
 --     첫번째로 선택도(selectivity)가 좋아야 한다.
 --     두번째로 where 절에 단독으로 많이 사용되어져야 한다.
 
 -- *** select(조회)시
 --     Composite Index(복합인덱스)로 생성되어진 인덱스를
 --     사용하기 위해서는 반드시 where 절에 선행컬럼이 와야 한다!!!
 --     where 절에 선행 컬럼이 없다면 인덱스를 사용하지 않고
 --     테이블 Full scan 하지 때문이다.
 
 예>  create index idx_tblwoker_test
      on tbl_woker(wokername, jik, salary);
      --> 선행컬럼은 wokername 이다.
      
      select jik, salary
      from tbl_woker
      where wokername = '이순신';
      --> 인덱스 idx_tblwoker_test를 사용해서 검색함.
      
      select jik, salary
      from tbl_woker
      where jik = '과장' and salary = 5000;
      --> 인덱스 idx_tblwoker_test를 사용하지 않고 검색함(Full scan).
 
      select jik, salary
      from tbl_woker
      where salary = 5000 and wokername = '이순신';  
      -- 앞에 오든 뒤에 오든 where 절에 선행 컬럼이 들어오기만 하면 
      -- 인덱스 idx_tblwoker_test를 사용해서 검색함.

-- 4346