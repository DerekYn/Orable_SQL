-------------------------------------------------------------------------------
                         -- �ڡڡ�   JOIN    �ڡڡ� --
-------------------------------------------------------------------------------
 JOIN(����)�� ���̺�(��)�� ���̺��� ��ġ�� ���� ���ϴµ� ��(ROW)�� ��ġ�� ���� �ƴ϶�, 
                                        �÷�(COLUMN)�� �÷��� ��ġ�� ���� ���Ѵ�.
 �׸��� ���� �ٸ� ���̺�(��)�� ��(ROW)�� ���� ��ġ�� ���� UNION �����ڸ� ����ϴ� ���̴�.                        
 
 A = { 1, 2, 3 }  ���Ұ� 3��
 B = { a, b }     ���Ұ� 2��
 
 A �� B = { (1,a), (1,b),
            (2,a), (2,b),
            (3,a), (3,b) }
            
  ��ī��Ʈ��(����) ==> ������ �� : 3 * 2 = 6�� (��� ����� ��)
  --> ��ī��Ʈ���� �����ͺ��̽������� Catersian Product
  
  
  select *
  from employees;
  
  select count(*)
  from employees;   -- 107��
  
  
  select department_id
  from employees;
  
  select count(*)
  from departments;   -- 27��
  
  select count(*), 107 * 27  -- ��� ���� ������ ����� �� .. JOIN!!
  from employees, departments;

  -- JOIN : SQL 1992 CODE ���(�����ͺ��̽� ������� ������ �ٸ�)��
  --        SQL 1999 CODE ���(ANSI SQL ǥ��ȭ)
  
  -- 1. SQL 1992 CODE ��� ==> ���̺�(��)�� ���̺�(��) ���̿� comma(,)�� ����ִ� ���.
  -- 2.     1999 CODE ��� ==> ���̺�(��)�� ���̺�(��) ���̿� ���ν� JOIN �̶�� �ܾ �ִ� ���.
  

-- 2807