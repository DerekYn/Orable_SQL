2. 숫자함수
  -- 2.1  mod : 나머지를 구해주는 함수
    select 5/2, mod(5, 2), trunc(5/2)
    from dual;  
    
  -- 2.2 round : 반올림을 해주는 것
   select 94.547, round(94.547), round(94.547, 2), round(94.547, -1)
   from dual;
   
  -- 2.3 trunc : 버림해주는 것
   select 94.547, trunc(94.547), trunc(94.547, 2), trunc(94.547, -1)
   from dual;

  create table tbl_grade
  (studentNum    varchar2(20) not null,
   name          varchar2(20) not null ,
   kor           number(3) not null,
   eng           number(3) not null,
   math          number(3) not null,
   constraint PK_tbl_grade_studentNum primary key(studentNum)
  );
  
  insert into tbl_grade(studentNum, name, kor, eng, math)
  values('KH0001', '한석규', 100, 100, 100);
  
  insert into tbl_grade(studentNum, name, kor, eng, math)
  values('KH0002', '두석규', 89, 95, 93);
  
  insert into tbl_grade(studentNum, name, kor, eng, math)
  values('KH0003', '세석규', 76, 66, 63);
  
  insert into tbl_grade(studentNum, name, kor, eng, math)
  values('KH0004', '네석규', 88, 33, 22);
  
  insert into tbl_grade(studentNum, name, kor, eng, math)
  values('KH0005', '오석규', 80, 82, 80);
  
  commit;
  
  select *
  from tbl_grade;
  
  select studentNum as "학번", name as "학생명", kor as "국어 점수", eng as "영어 점수", math as "수학 점수",
        (kor + eng + math) as "총점", round((kor + eng + math)/3) as "평균",
         case trunc( round ( (kor + eng + math) / 3), -1 )
          when 100 then 'A'
          when 90 then 'B'
          when 80 then 'C'
          when 70 then 'D'
          when 60 then 'E'
          else 'F'
          end as "학점1",
          
          decode(trunc( round ( (kor + eng + math) / 3), -1 ), 100, 'A'
                                                             ,  90, 'B'
                                                             ,  80, 'C'
                                                             ,  70, 'D'
                                                             ,  60, 'E'
                                                                  , 'F') as "학점2"
  from tbl_grade;
  
  -- 2.4  power : 거듭 제곱
  select 2*2*2*2*2, power(2,5)
  from dual;
  
  -- 2.5  sqrt : 제곱근
  select sqrt(4), sqrt(2), sqrt(3)
  from dual;
  
  -- 2.6  sign : 결과값이 양수라면 1,
  --             결과값이 0이라면  0,
  --             결과값이 음수라면 -1
  
  select sign(5-2), sign(5-5), sign(2-5)
  from dual;
  
  -- 2.7  ascii / chr : 아스키코드 숫자 변환
  select ascii('A'), ascii('a'), ascii('0'), ascii(' ')
  from dual;
  
  select chr(65), chr(97), chr(48), chr(32)
  from dual;
  
  -- 2.8  sin, cos, tan, asin, acos, atan
  select sin(90), cos(90), tan(90), asin(0.3), acos(0.3), atan(0.3)
  from dual;
  
  -- 2.9  log
  select log(10, 100)
  from dual;

-- 1212