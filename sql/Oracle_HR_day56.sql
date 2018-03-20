  ---- *** Index(인덱스) *** -----
 
 -- Index(인덱스)를 생성하는 이유는 검색(select)을 빨리하기 위함이다.
 -- Index(인덱스)는 책의 뒷면에 나오는 색인(인덱스)과 같은 의미를 갖는다.
 -- Index(인덱스)를 생성하면 select 속도는 향상되지만
 -- DML(insert, update, delete, merge) 속도는 떨어진다.
 -- 그러므로 Index(인덱스)는 모든 컬럼에 생성하면 안되고,
 -- Index(인덱스)는 모든 컬럼에 생성하면 안되고, where절에 빈번히 사용되어지는 컬럼에 만들어야한다.
 
 
 -- Important!!!
 -- Index(인덱스)로 사용되어지는 컬럼은 선택도(selectivity)가 좋은 컬럼이어야 한다.
 -- 선택도(selectivity)가 좋다는 말은 고유한 정도가 높다라는 말이다.
 -- 예 : 주민번호, 학번, 사원번호 컬럼은 선택도가 높고 좋다.
 -- 예 : 성별, 출신지(시도)은 선택도가 낮음.
 
 --<< 사원 >>
 -----------------------------------------------------
 사원번호    사원명       직급      주민번호     급여    입사일
 -----------------------------------------------------
 number    varchar2  varchar2  varchar2   number   date(sysdate)
 
 -- Index(인덱스)로 사용되어지는 컬럼은 조회시(select)
 -- 변형되지 않고 그대로 사용되어지는 컬럼이어야 한다.
 -- 왜냐하면 Index(인덱스)로 사용되어지는 컬럼이 함수를
 -- 사용하여 값이 변형되면 Index(인덱스) 기능을 잃어버리기 때문이다.
 -- 예> 위의 "사원" 테이블에서 입사일(date default로 sysdate) 컬럼에
 -- Index(인덱스)를 주었다라고 가정하면    조회시 
                                       -- where 입사일자 = '2018-03-13 10:05:07'
                                       -- 이런식으로 조회해야만 Index(인덱스)를 사용해서 검색한다.
 -- 그런데 일반적으로 조회시 
                    -- where to_char(입사일자, 'yyyy-mm-dd') = '2018-03-13'
                    -- 이런식으로 조회를 하므로 입사일자 컬럼의 값이 함수를 사용하여
                    -- 변경되므로 Index(인덱스)를 사용하지 않고, 테이블 Full scan 하여 검색한다.
                    
 -- 제약조건 Primary key, Unique 제약이 걸려진 컬럼은 자동적으로 Unique 한 Index(인덱스)가 생성되어진다.
 -- 사원번호 => Primary key / 주민번호 => Unique을 주면
 -- 사원번호와 주민번호에는 자동적으로 Unique 한 Index(인덱스)가 생성되어진다.
 -- 그런데 검색조건(where)에 사원명을 자주 사용한다면 사원명 컬럼에 대해서 Index(인덱스)를 생성해주면 된다.
 
 create index idx_woker_wokername
 on tbl_woker(wokername);
  ==> tbl_woker 테이블의 wokername 컬럼의 값은
     insert OR update 시 고유한 값만 갖는다.
     한마디로 동명이인을 가능하다.
 
 create unique index idx_woker_wokername
 on tbl_woker(wokername);
 ==> tbl_woker 테이블의 wokername 컬럼의 값은
     insert OR update 시 고유한 값만 갖는다.
     한마디로 동명이인을 불가하다.
     
 create index idx_woker_wokername
 on tbl_woker(wokername desc);
 ==> 인덱스의 특징은 정렬되어지는 것인데
     wokername 을 내림차순으로 정렬하여 인덱스 페이지를 만들겠다는 말이다.
     만약에 desc 을 빼면 기본값은 ASC(오름차순) 정렬이다.

-- 4296