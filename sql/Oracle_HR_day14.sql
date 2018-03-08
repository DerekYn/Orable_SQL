4. ��ȯ�Լ�

  -- 4.1  to_char -- ���ڳ� ��¥�� ����Ÿ������ ��ȯ���ִ� ��.
  
  select to_char(sysdate, 'yyyy') AS �⵵,
         to_char(sysdate, 'mm') AS ��,
         to_char(sysdate, 'dd') AS ��,
         to_char(sysdate, 'hh24') AS "24�ð�",
         to_char(sysdate, 'hh am') AS "12�ð�",
         to_char(sysdate, 'hh pm') AS "12�ð�",
         to_char(sysdate, 'mi') AS ��,
         to_char(sysdate, 'ss') AS ��,
         to_char(sysdate, 'q') AS �б�, -- 1��~3�� -> 1�б� ... 
         to_char(sysdate, 'day') AS �����ڿ��ϸ�,
         to_char(sysdate, 'dy') AS �ѱ��ڿ��ϸ�,
         to_char(sysdate, 'd') AS ���ڿ��ϸ�
  from dual;
  
  select to_char(sysdate, 'ddd'), -- sysdate ��, ���� ��¥�� ���Ե� ���� 1�� 1�� ���� ddd������ ���� ����
         to_char(sysdate, 'dd'),  -- sysdate ��, ���� ��¥�� ���Ե� ���� 1�� ���� dd������ ���� ����
         to_char(sysdate, 'd')    -- sysdate ��, ���� ��¥�� ���Ե� ��(�Ͽ���)���� d������ ���� ����
  from dual;


  select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'),
         to_char(sysdate, 'yyyy-mm-dd'),  --> �̷��� �ϸ� �ð��� �׳� �� 00:00:00�� �ȴ�.
         to_char(to_date(to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd'), 'yyyy-mm-dd hh24:mi:ss')
  from dual;
  
  select (sysdate - to_date(to_char(sysdate, 'yyyy-mm-dd'), 'yyyy-mm-dd')) * (24*60*60), -- ���ù� 00:00:00 ���� ���� ���� �귯�� ��
          to_char(sysdate, 'sssss') -- ���� ��
  from dual;
  
  select 123456789,
         to_char(123456789, 'L999,999,999'),  -- ���� ������ ������ �� ����
         to_char(123456789, '$999,999,999')   -- �޷� ����
  from dual;
  
  select employee_id,
         to_char(nvl(salary + (salary * commission_pct), salary) * 12, '$99,999,999')
  from employees;
  
  
  select employee_id,
         nvl(salary + (salary * commission_pct), salary) * 12 / 13 AS ����,
         round(nvl(salary + (salary * commission_pct), salary) * 12 / 13, 1) AS ����1,
         to_char(round(nvl(salary + (salary * commission_pct), salary) * 12 / 13, 1), '99999.0')  AS ����2  -- �Ҽ��� �ڸ��� ���� �� ���� ����.
  from employees;
  
  
  -- 4.2  to_date    -- ���ڸ� ��¥ Ÿ������ ��ȯ���ִ� ��
  -- 4.3  to_number  -- ���ڸ� ���� Ÿ������ ��ȯ���ִ� ��  
  
  select '2', to_number('2'), 2
  from dual;

-- 1585