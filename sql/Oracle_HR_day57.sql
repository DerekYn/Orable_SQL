 ------ **** Composite Index(�����ε���) **** ------
 
 -- Composite Index(�����ε���)��?
 -- 2�� �̻��� �÷��� ��� �ϳ��� �ε����� ����� ��.
 
 select jik, salary
 from tbl_woker
 where wokername = '�̼���';
 -- ���������� ���Ͱ��� ��ȸ�ϴ� ���� ���� ����ϴٸ�,
 -- wokername, jik, salary �÷��� ��� �ϳ��� Index(�ε���)��
 -- �����ϴ� ���� ��ȸ �ӵ��� ��������.
 -- ****** ���� �߿�!!!! ******
 -- Composite Index(�����ε���)�� ���鶧 �����÷���
 -- � �÷����� �������ΰ�? �� ���� �߿��ϴ�!!!
 
 create index idx_tblwoker_test
 on tbl_woker(salary, jik, wokername);
 --> �ε��� idx_tblwoker_test�� �����÷��� �� �� salary�̴�.
 
 -- *** �����÷��� �����ϴ� ������
 --     ù��°�� ���õ�(selectivity)�� ���ƾ� �Ѵ�.
 --     �ι�°�� where ���� �ܵ����� ���� ���Ǿ����� �Ѵ�.
 
 -- *** select(��ȸ)��
 --     Composite Index(�����ε���)�� �����Ǿ��� �ε�����
 --     ����ϱ� ���ؼ��� �ݵ�� where ���� �����÷��� �;� �Ѵ�!!!
 --     where ���� ���� �÷��� ���ٸ� �ε����� ������� �ʰ�
 --     ���̺� Full scan ���� �����̴�.
 
 ��>  create index idx_tblwoker_test
      on tbl_woker(wokername, jik, salary);
      --> �����÷��� wokername �̴�.
      
      select jik, salary
      from tbl_woker
      where wokername = '�̼���';
      --> �ε��� idx_tblwoker_test�� ����ؼ� �˻���.
      
      select jik, salary
      from tbl_woker
      where jik = '����' and salary = 5000;
      --> �ε��� idx_tblwoker_test�� ������� �ʰ� �˻���(Full scan).
 
      select jik, salary
      from tbl_woker
      where salary = 5000 and wokername = '�̼���';  
      -- �տ� ���� �ڿ� ���� where ���� ���� �÷��� �����⸸ �ϸ� 
      -- �ε��� idx_tblwoker_test�� ����ؼ� �˻���.

-- 4346