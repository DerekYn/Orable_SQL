5. ��Ÿ�Լ� �ڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡ�
  
 -- 5.1  case when then else end
  
  select case 5-2
          when 4 then '5-2 = 4 �Դϴ�.'
          when 1 then '5-2 = 1 �Դϴ�.'
          when 3 then '5-2 = 3 �Դϴ�.'
          else '���� ������ �����̤�'
          end
  from dual;
  
  select case
          when 4 > 5 then '4�� 5���� Ů�ϴ�.'
          when 5 > 7 then '5�� 7���� Ů�ϴ�.'
          when 3 > 2 then '3�� 2���� Ů�ϴ�.'
          else '���� ������ �����̤�'
          end
  from dual;
  
  select case (   select count(*)
                  from tbl_user
                  where userid = 'batman' and
                        passwd = translate('qwEr1234$', 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789',
                                           'ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba9876543210')
               )
        when 1 then '�α��� ����'
        else '�α��� ����'
        end as "�α��� ���"
  from dual;
  
  
  select case ( select count(*) userid, passwd )
          when 1 then '�α��� ����'
          else (
                case ( select count(*) userid)
                when 1 then '�α��� ���� ��ȣ�� Ȯ�����ּ���'
                else '�α��� ���� ���̵� Ȯ�����ּ���'
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
         when 1 then '�α��� ����'
          else (
                case ( select count(*)
                       from tbl_user
                       where userid = 'batman'
                      )
                when 1 then '�α��� ���� ��ȣ�� Ȯ�����ּ���'
                else '�α��� ���� ���̵� Ȯ�����ּ���'
                end
              )
          end as "�α��� ���"
  from dual;
  
  select case (select count(*)
              from tbl_user
              where userid = 'eom' and
                    passwd = translate('qwEr1234$', 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789',
                                                    'ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba9876543210')
              )
         when 1 then '�α��� ����'
          else (
                case ( select count(*)
                       from tbl_user
                       where userid = 'eom'
                      )
                when 1 then '�α��� ���� ��ȣ�� Ȯ�����ּ���'
                else '�α��� ���� ���̵� Ȯ�����ּ���'
                end
              )
          end as "�α��� ���"
  from dual;
  
  -- 5.2 decode
  select decode(5-2, 4, '5-2=4 �Դϴ�.'
                   , 1, '5-2=1 �Դϴ�.'
                   , 3, '5-3=3 �Դϴ�.'
                      , '���� ������ �����')
          as "���"
  from dual;
  
  select decode( ( select count(*)
                  from tbl_user
                  where userid = 'batman' and
                        passwd = translate('qwEr1234$', 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789',
                                                    'ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba9876543210')), 1, '�α��� ����'
                                                                                                                         , '�α��� ����'
              ) as "�α��� ���"
  from dual;
  
  
  
 select decode( ( select count(*)
                  from tbl_user
                  where userid = 'batman' and
                        passwd = translate('qwEr1234$', 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789',
                                                    'ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba9876543210')), 1, '�α��� ����'
                                                                                                                         , decode( ( select count(*)
                                                                                                                                      from tbl_user
                                                                                                                                      where userid = 'batman'
                                                                                                                                      ), 1, '�α��� ���� ��й�ȣ�� Ȯ�����ּ���'
                                                                                                                                          , '�α��� ���� ���̵� Ȯ�����ּ���'
                                                                                                                                  )
              ) as "�α��� ���"
  from dual;
  
  
  -- case when then else end // decode
  select employee_id, first_name || ' ' || last_name, jubun,
  
        case substr(jubun, 7, 1)
         when '1' then '����'
         when '3' then '����'
         else '����'
         end as "����1",
         
        case
         when substr(jubun, 7, 1) in ('1', '3') then '����'
         else '����'
         end as "����2",
         
        decode(substr(jubun, 7, 1), '1', '����'
                                  , '3', '����'
                                       , '����') as "����3"
  from employees;

-- 1723