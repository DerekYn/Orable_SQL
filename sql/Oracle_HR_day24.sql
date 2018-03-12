----------------- ********** ������ ����(Query) ( = select �� ) ********* ---------------------
-- start with connect by prior �� => ( �Խ��ǿ��� �亯�� �Խ��ǿ��� ���� ���� )

select level, employee_id, first_name || ' ' || last_name AS ENAME,
       job_id, manager_id
from employees
start with employee_id = 106
connect by prior manager_id = employee_id;  -- connect by prior employee_id = manager_id �ʹ� �ϴð� �����̴�!!! ���� �ٸ���
 -- connect by prior ������ ������ manager_id �÷��� ���� start with employee_id�� ���ε� ���� �÷����̴�. �ڡڡڡڡڡڡڡڡڡڡڡڡ�
 -- �� �����ȣ 106 ���� manager_id �÷��� ���̴�. ( 103 )
 -- connect by prior 103 = employee_id �̴�.
 
 -- 106 -- 103 -- 102 -- 100  �̷������� ����ȴ� ������Ѻ��� ��.
 
 -- vs ���� �� �غ���
 
 select level, employee_id, first_name || ' ' || last_name AS ENAME,
       job_id, manager_id
from employees
start with employee_id = 100
connect by prior employee_id = manager_id
order by level;
 -- �̹����� �ְ��� ���� �Ųٷ� ����. �ְ������� ���߹޴»������ �����ϰ� �ٽ� �� ������� ���� �޴� ������� ����

  

 
 select level, employee_id,
        lpad(' ', (level - 1) * 3, ' ') || first_name || ' ' || last_name AS ENAME,
        job_id, manager_id
from employees
start with employee_id = 100
connect by prior employee_id = manager_id;


-- 2519