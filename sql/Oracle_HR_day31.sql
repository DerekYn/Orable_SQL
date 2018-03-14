 --=====================  *** DICTIONARY 조회하기 *** =====================
 select *
 from dictionary;
 
 ALL_CATALOG  ->  내가 만든 + 모든 사용자가 만든 명령어
 USER_CATALOG ->  오직 내가 만든 명령어
 
 
 select *
 from dictionary
 where table_name like 'USER_%' and
       lower(comments) like '%view%';    -- ALL_ %를 제외한 USER_ %에서 comments에 table이라는 단어가 포함된 것들
 
 
 select *
 from USER_TABLES;

 select *
 from USER_VIEWS;

-- 2765