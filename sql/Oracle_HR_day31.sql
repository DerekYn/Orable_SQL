 --=====================  *** DICTIONARY ��ȸ�ϱ� *** =====================
 select *
 from dictionary;
 
 ALL_CATALOG  ->  ���� ���� + ��� ����ڰ� ���� ��ɾ�
 USER_CATALOG ->  ���� ���� ���� ��ɾ�
 
 
 select *
 from dictionary
 where table_name like 'USER_%' and
       lower(comments) like '%view%';    -- ALL_ %�� ������ USER_ %���� comments�� table�̶�� �ܾ ���Ե� �͵�
 
 
 select *
 from USER_TABLES;

 select *
 from USER_VIEWS;

-- 2765