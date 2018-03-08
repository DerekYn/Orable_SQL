5. 기타함수 ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
  
 -- 5.1  case when then else end
  
  select case 5-2
          when 4 then '5-2 = 4 입니다.'
          when 1 then '5-2 = 1 입니다.'
          when 3 then '5-2 = 3 입니다.'
          else '나는 수학을 몰라요ㅜㅜ'
          end
  from dual;
  
  select case
          when 4 > 5 then '4는 5보다 큽니다.'
          when 5 > 7 then '5는 7보다 큽니다.'
          when 3 > 2 then '3은 2보다 큽니다.'
          else '나는 수학을 몰라요ㅜㅜ'
          end
  from dual;
  
  select case (   select count(*)
                  from tbl_user
                  where userid = 'batman' and
                        passwd = translate('qwEr1234$', 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789',
                                           'ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba9876543210')
               )
        when 1 then '로그인 성공'
        else '로그인 실패'
        end as "로그인 결과"
  from dual;
  
  
  select case ( select count(*) userid, passwd )
          when 1 then '로그인 성공'
          else (
                case ( select count(*) userid)
                when 1 then '로그인 실패 암호를 확인해주세요'
                else '로그인 실패 아이디를 확인해주세요'
                end
              )
          end
  from dual;
  
  
  
  select case (select count(*)
              from tbl_user
              where userid = 'batman' and
                    passwd = translate('qwEr1234$', 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789',
                                                    'ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba9876543210')
              )
         when 1 then '로그인 성공'
          else (
                case ( select count(*)
                       from tbl_user
                       where userid = 'batman'
                      )
                when 1 then '로그인 실패 암호를 확인해주세요'
                else '로그인 실패 아이디를 확인해주세요'
                end
              )
          end as "로그인 결과"
  from dual;
  
  select case (select count(*)
              from tbl_user
              where userid = 'eom' and
                    passwd = translate('qwEr1234$', 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789',
                                                    'ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba9876543210')
              )
         when 1 then '로그인 성공'
          else (
                case ( select count(*)
                       from tbl_user
                       where userid = 'eom'
                      )
                when 1 then '로그인 실패 암호를 확인해주세요'
                else '로그인 실패 아이디를 확인해주세요'
                end
              )
          end as "로그인 결과"
  from dual;
  
  -- 5.2 decode
  select decode(5-2, 4, '5-2=4 입니다.'
                   , 1, '5-2=1 입니다.'
                   , 3, '5-3=3 입니다.'
                      , '나는 수학을 몰라요')
          as "결과"
  from dual;
  
  select decode( ( select count(*)
                  from tbl_user
                  where userid = 'batman' and
                        passwd = translate('qwEr1234$', 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789',
                                                    'ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba9876543210')), 1, '로그인 성공'
                                                                                                                         , '로그인 실패'
              ) as "로그인 결과"
  from dual;
  
  
  
 select decode( ( select count(*)
                  from tbl_user
                  where userid = 'batman' and
                        passwd = translate('qwEr1234$', 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789',
                                                    'ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba9876543210')), 1, '로그인 성공'
                                                                                                                         , decode( ( select count(*)
                                                                                                                                      from tbl_user
                                                                                                                                      where userid = 'batman'
                                                                                                                                      ), 1, '로그인 실패 비밀번호를 확인해주세요'
                                                                                                                                          , '로그인 실패 아이디를 확인해주세요'
                                                                                                                                  )
              ) as "로그인 결과"
  from dual;
  
  
  -- case when then else end // decode
  select employee_id, first_name || ' ' || last_name, jubun,
  
        case substr(jubun, 7, 1)
         when '1' then '남자'
         when '3' then '남자'
         else '여자'
         end as "성별1",
         
        case
         when substr(jubun, 7, 1) in ('1', '3') then '남자'
         else '여자'
         end as "성별2",
         
        decode(substr(jubun, 7, 1), '1', '남자'
                                  , '3', '남자'
                                       , '여자') as "성별3"
  from employees;

-- 1723