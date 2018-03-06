------------------------------------------------------------------------
                         >>>>> 단일행 함수 <<<<<
------------------------------------------------------------------------
※ 단일행 함수의 종류

1. 문자함수
2. 숫자함수
3. 날짜함수
4. 변환함수
5. 기타함수
------------------------------------------------------------------------

1. 문자함수
 -- 1.1  lower
 -- 1.2  upper
 -- 1.3  initcap
 -- 1.4  substring : 문자열 중 특정문자 또는 문자열의 일부분을 선택할때 사용함.
select 'KH정보교육원',
        substr('KH정보교육원',3 ,2),
        substr('KH정보교육원',3)
from dual;

select employee_id as "사원번호", first_name || ' ' || last_name as "사원명", jubun as "주민번호"
from employees
where substr(jubun,7,1) = '1' or substr(jubun,7,1) = '3';

select employee_id as "사원번호", first_name || ' ' || last_name as "사원명", jubun as "주민번호"
from employees
where substr(jubun,7,1) in ('1', '3');

 -- 1.5  length : 문자열의 길이를 알려주는 것.
select length('KH정보교육원'),
       length('korea')
from dual;
 -- 1.6  lengthb : 문자열의 byte 수를 알려주는 것.
select lengthb('KH정보교육원'),
       lengthb('korea')
from dual;
 -- 1.7  instr : 어떤 문자열에서 명명된 문자의 위치를 알려주는 것.
select instr('KH정보교육원 국가정보원 정보문화사', '정보', 1, 1),
       instr('KH정보교육원 국가정보원 정보문화사', '정보', 1, 2),
       instr('KH정보교육원 국가정보원 정보문화사', '정보', 4, 1),
       instr('KH정보교육원 국가정보원 정보문화사', '정보', 4, 3),
       instr('KH정보교육원 국가정보원 정보문화사', '정보', 1),
       instr('KH정보교육원 국가정보원 정보문화사', '정보', 4),
       instr('KH정보교육원 국가정보원 정보문화사', '정보', -1, 1),
       instr('KH정보교육원 국가정보원 정보문화사', '정보', -1, 2),
       instr('KH정보교육원 국가정보원 정보문화사', '정보', -4, 1),
       instr('KH정보교육원 국가정보원 정보문화사', '정보', -4, 3)
from dual;
 -- 1.8  reverse : 어떤 문자열을 거꾸로 보여주는 것이다.
select 'ORACLE', reverse('ORACLE'),
       '대한민국', reverse('대한민국'),
       reverse( reverse('대한민국') )
from dual;

create table tbl_files
(fileno number(3),   -- -999 ~ 999 까지는 뜻
filepath varchar2(100));

insert into tbl_files(fileno, filepath)
values(1, 'c:\documents\resume.hwp');
insert into tbl_files(fileno, filepath)
values(2, 'd:\mymusic.mp3');
insert into tbl_files(fileno, filepath)
values(3, 'c:\myphoto\abc\def\face.jpg');

commit;

select fileno as "파일번호", reverse(substr(reverse(filepath),1,(instr(reverse(filepath), '\',1,1))-1)) as "파일명"
from tbl_files;

select fileno as "파일번호", substr(filepath, instr(filepath,'\',-1,1)+1) as "파일명"
from tbl_files;

 -- 1.9   lpad : 왼쪽부터 문자를 자리채움
 -- 1.10  rpad : 오른쪽부터 문자를 자리채움
  
  select lpad('정보교육원', 20, '*'),
         rpad('정보교육원', 20, '*')
  from dual;
  
  select lpad('대한민국', length('대한민국')*2*5, '대한민국')
  from dual;
  
 -- 1.11  ltrim : 왼쪽부터 문자를 제거하는 함수
 -- 1.12  rtrim : 오른쪽부터 문자를 제거하는 함수
  
  select ltrim('aabccdadsabcd', 'abcd'),
         rtrim('aabbbtddabca','abcd')
  from dual;
  
  
  select 'KH' || '                   정보              교육원',
         'KH' || ltrim('                   정보              교육원'),
         rtrim('KH                  ') || '정보              교육원'
  from dual;
  
  -- 1.13  translate
  
  select translate('010-3456-0987',
                    '0123456789',
                    '영일이삼사오육칠팔구')
  from dual;
  
  
  select *
  from tbl_user;
  
  insert into tbl_user(userid, passwd, name, addr)
  values('superman', 'qwEr1234$', '슈퍼맨', '서울시 종로구');
  
  insert into tbl_user(userid, passwd, name, addr)
  values('lss', 'abcd1234', '이순신', '노량진');
  
  commit;
  
  insert into tbl_user(userid, passwd, name, addr)
  values('batman', translate('qwEr1234$', 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789',
                  'ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba987654321'), '배트맨', '경기도 용인시');

  select *
  from tbl_user;
  
  select userid,
        translate(passwd, 'ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba987654321',
                  'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789') as passwd
  from tbl_user;
  
  select count(*)
  from employees;
  
  select count(*)
  from employees
  where department_id = 50;   -- 45
  
  select count(*)
  from employees
  where department_id = 777;   -- 0
  
  select *
  from tbl_user
  where userid = 'batman' and
    passwd = translate('qwEr1234$', 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789',
                       'ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba987654321');
                       
                       
  -- 1.14  replace                   
     
   select replace('KH정보교육원 교육진흥원 서울교육대학교',
                   '교육', 'education')
   from dual;
   
   insert into tbl_user(userid, passwd, name, addr)
   values('kimys', 'abcd', '김유신', '서울');
   
   insert into tbl_user(userid, passwd, name, addr)
   values('young2', 'abcd', '이영이', '서울');
   
   insert into tbl_user(userid, passwd, name, addr)
   values('leesa', 'abcd', '이엘리사', '서울');
   
   insert into tbl_user(userid, passwd, name, addr)
   values('park', 'abcd', '박이남', '서울');
   
   insert into tbl_user(userid, passwd, name, addr)
   values('leebon', 'abcd', '이본', '서울');
   
   commit;
   
   select *
   from tbl_user;
   
   -- quiz : tbl_user 테이블에서 성이 '이' 씨인 사람만 성을 '리'씨로 변경(update)하세요.  
    update tbl_user set name = '리' || substr(name, 2)
    where name like '이%';
    
    rollback;


-- 1119