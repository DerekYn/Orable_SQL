------------------------------------------------------------------------
                         >>>>> ������ �Լ� <<<<<
------------------------------------------------------------------------
�� ������ �Լ��� ����

1. �����Լ�
2. �����Լ�
3. ��¥�Լ�
4. ��ȯ�Լ�
5. ��Ÿ�Լ�
------------------------------------------------------------------------

1. �����Լ�
 -- 1.1  lower
 -- 1.2  upper
 -- 1.3  initcap
 -- 1.4  substring : ���ڿ� �� Ư������ �Ǵ� ���ڿ��� �Ϻκ��� �����Ҷ� �����.
select 'KH����������',
        substr('KH����������',3 ,2),
        substr('KH����������',3)
from dual;

select employee_id as "�����ȣ", first_name || ' ' || last_name as "�����", jubun as "�ֹι�ȣ"
from employees
where substr(jubun,7,1) = '1' or substr(jubun,7,1) = '3';

select employee_id as "�����ȣ", first_name || ' ' || last_name as "�����", jubun as "�ֹι�ȣ"
from employees
where substr(jubun,7,1) in ('1', '3');

 -- 1.5  length : ���ڿ��� ���̸� �˷��ִ� ��.
select length('KH����������'),
       length('korea')
from dual;
 -- 1.6  lengthb : ���ڿ��� byte ���� �˷��ִ� ��.
select lengthb('KH����������'),
       lengthb('korea')
from dual;
 -- 1.7  instr : � ���ڿ����� ���� ������ ��ġ�� �˷��ִ� ��.
select instr('KH���������� ���������� ������ȭ��', '����', 1, 1),
       instr('KH���������� ���������� ������ȭ��', '����', 1, 2),
       instr('KH���������� ���������� ������ȭ��', '����', 4, 1),
       instr('KH���������� ���������� ������ȭ��', '����', 4, 3),
       instr('KH���������� ���������� ������ȭ��', '����', 1),
       instr('KH���������� ���������� ������ȭ��', '����', 4),
       instr('KH���������� ���������� ������ȭ��', '����', -1, 1),
       instr('KH���������� ���������� ������ȭ��', '����', -1, 2),
       instr('KH���������� ���������� ������ȭ��', '����', -4, 1),
       instr('KH���������� ���������� ������ȭ��', '����', -4, 3)
from dual;
 -- 1.8  reverse : � ���ڿ��� �Ųٷ� �����ִ� ���̴�.
select 'ORACLE', reverse('ORACLE'),
       '���ѹα�', reverse('���ѹα�'),
       reverse( reverse('���ѹα�') )
from dual;

create table tbl_files
(fileno number(3),   -- -999 ~ 999 ������ ��
filepath varchar2(100));

insert into tbl_files(fileno, filepath)
values(1, 'c:\documents\resume.hwp');
insert into tbl_files(fileno, filepath)
values(2, 'd:\mymusic.mp3');
insert into tbl_files(fileno, filepath)
values(3, 'c:\myphoto\abc\def\face.jpg');

commit;

select fileno as "���Ϲ�ȣ", reverse(substr(reverse(filepath),1,(instr(reverse(filepath), '\',1,1))-1)) as "���ϸ�"
from tbl_files;

select fileno as "���Ϲ�ȣ", substr(filepath, instr(filepath,'\',-1,1)+1) as "���ϸ�"
from tbl_files;

 -- 1.9   lpad : ���ʺ��� ���ڸ� �ڸ�ä��
 -- 1.10  rpad : �����ʺ��� ���ڸ� �ڸ�ä��
  
  select lpad('����������', 20, '*'),
         rpad('����������', 20, '*')
  from dual;
  
  select lpad('���ѹα�', length('���ѹα�')*2*5, '���ѹα�')
  from dual;
  
 -- 1.11  ltrim : ���ʺ��� ���ڸ� �����ϴ� �Լ�
 -- 1.12  rtrim : �����ʺ��� ���ڸ� �����ϴ� �Լ�
  
  select ltrim('aabccdadsabcd', 'abcd'),
         rtrim('aabbbtddabca','abcd')
  from dual;
  
  
  select 'KH' || '                   ����              ������',
         'KH' || ltrim('                   ����              ������'),
         rtrim('KH                  ') || '����              ������'
  from dual;
  
  -- 1.13  translate
  
  select translate('010-3456-0987',
                    '0123456789',
                    '�����̻�����ĥ�ȱ�')
  from dual;
  
  
  select *
  from tbl_user;
  
  insert into tbl_user(userid, passwd, name, addr)
  values('superman', 'qwEr1234$', '���۸�', '����� ���α�');
  
  insert into tbl_user(userid, passwd, name, addr)
  values('lss', 'abcd1234', '�̼���', '�뷮��');
  
  commit;
  
  insert into tbl_user(userid, passwd, name, addr)
  values('batman', translate('qwEr1234$', 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789',
                  'ZYXWVUTSRQPONMLKJIHGFEDCBAzyxwvutsrqponmlkjihgfedcba987654321'), '��Ʈ��', '��⵵ ���ν�');

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
     
   select replace('KH���������� ��������� ���ﱳ�����б�',
                   '����', 'education')
   from dual;
   
   insert into tbl_user(userid, passwd, name, addr)
   values('kimys', 'abcd', '������', '����');
   
   insert into tbl_user(userid, passwd, name, addr)
   values('young2', 'abcd', '�̿���', '����');
   
   insert into tbl_user(userid, passwd, name, addr)
   values('leesa', 'abcd', '�̿�����', '����');
   
   insert into tbl_user(userid, passwd, name, addr)
   values('park', 'abcd', '���̳�', '����');
   
   insert into tbl_user(userid, passwd, name, addr)
   values('leebon', 'abcd', '�̺�', '����');
   
   commit;
   
   select *
   from tbl_user;
   
   -- quiz : tbl_user ���̺��� ���� '��' ���� ����� ���� '��'���� ����(update)�ϼ���.  
    update tbl_user set name = '��' || substr(name, 2)
    where name like '��%';
    
    rollback;


-- 1119