select *
 from employees;   

 select *
 from tbl_user;

 -- tbl_user ���̺� ������ �Է��ϱ�
 insert into tbl_user(userid, passwd, name, addr)
 values('hansk', 'qwer1234', '�Ѽ���', '����� ���α�');

 rollback;

 commit;

/*
 �� DML(Data Manuplation Language) -- ������ ���۾�
 ==> 1. insert(�Է�)   2. update(����)   3. delete(����)
 DML���� �ٷ� ��ũ�� ������� �ʰ� �޸�(RAM)�󿡼��� ����Ǿ�����. 
 �׷��� ��ũ�� ����(����)�� �Ϸ��� commit; �� �ؾ��ϰ�, 
 ���࿡ ��ũ�� ����(����)�� ������������ rollback; �� �Ѵ�.

 �̹� commit; �Ǿ��� ������ rollback; �غ��� �ҿ����. 
 */

 insert into tbl_user(userid, passwd, name, addr)
 values('dusk', 'qwer1234', '�μ���', '����� ������');

 insert into tbl_user(userid, passwd, name, addr)
 values('sesk', 'qwer1234', '������', '����� ���ϱ�'); 

 commit;

 -- tbl_user ���̺� �����ϴ� ������ ���� �����ϱ�
 update tbl_user set name='�̼���', addr='��⵵ ���ν�'

 select *
 from tbl_user;
 
 rollback;

 update tbl_user set name='�̼���', addr='��⵵ ������'
 where userid = 'dusk';

 select *
 from tbl_user;

 commit;

 delete from tbl_user; 
 -- tbl_user ���̺� �ִ� ��� ����� �����Ѵ�.

 select *
 from tbl_user; 

 rollback;

 delete from tbl_user
 where userid = 'dusk';
 -- tbl_user ���̺� �ִ� userid�� 'dusk'�� �ุ �����Ѵ�.

 commit;    
   
 select *
 from employees;

 -- employees ���̺��� �� �μ���ȣ���� �����ϴ� 
 -- ����ID ���� ����ϼ���.

 select department_id, job_id
 from employees;

 -- select �Ǿ��� ��������� ���� ������� �ߺ��Ǿ� ���´ٸ� 
 -- �ߺ��� ���� �����ϰ� 1���� ���̰� �ʹ�. 
 -- �̷��� select �ٷ� ������ distinct �� ���� �ȴ�.
 
 select distinct department_id, job_id
 from employees;

 -- select �Ǿ��� ������� ����(sort)�Ϸ��� 
 -- order by ���� ����ϸ� �ȴ�.
 
 select distinct department_id, job_id 
 from employees
 order by department_id asc; -- �������� ����

 select distinct department_id, job_id 
 from employees
 order by department_id desc; -- �������� ����

 select distinct department_id, job_id 
 from employees
 order by department_id; -- �������� ����

 select distinct department_id, job_id 
 from employees
 order by job_id asc; -- �������� ����

 select distinct department_id, job_id 
 from employees
 order by job_id desc; -- �������� ����

-- 621