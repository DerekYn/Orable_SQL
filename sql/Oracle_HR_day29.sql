 ----- ***  ��� ���� ������ �̿��� UPDATE ó�� *** --------
 
 
 -- ���̺� �����ϱ�
 create table tbl_empcopy
 as
 select * from employees;
 
 
 update employees set first_name = '������';
 
 commit;
 
 select *
 from employees;
 
 
 update employees set first_name = '��', last_name = '����';
 
 rollback;

--2715