 ------------------------------------------------------------------------
    �ڡڡڡڡڡڡڡڡڡڡ� >>>>> �׷� �Լ�(���� �Լ�) <<<<< �ڡڡڡڡڡڡڡڡڡڡ�
------------------------------------------------------------------------
�� �׷� �Լ������� null�� ������ �����ϰ� ������ �Ѵ�.!!
------------------------------------------------------------------------
1. sum   -- �հ�
2. avg   -- ���
3. max   -- �ִ밪
4. min   -- �ּҰ�
5. count -- select �Ǿ ���� ������� ���� ����
6. variance -- �л�
7. stddev   -- ǥ������

select count(salary)
from employees;

select count(commission_pct)
from employees;

select sum(salary * commission_pct) / count(commission_pct),   -- null �� �ڵ� ����
       avg(salary * commission_pct),   -- ���� �Ȱ��� // Ŀ�̼��� �޴� ������ '��'�� ���ġ
       avg(nvl(salary * commission_pct, 0))  --     // 107 �� ����� Ŀ�̼� ���
from employees;

select sum(salary)/count(salary),     -- �� ���� �Ȱ��� 
       avg(salary)
from employees;


-- employees ���̺��� �μ���ȣ�� �ο����� ��Ÿ������.
select department_id, count(*) AS �ο���
from employees
group by department_id  -- ���� ��Ÿ���� ���� ���ɴ�, ���� ������ ������ �並 ���� ��, ���� select ������   AGE �Ǵ� Gender, count(*) �� ���ָ��
order by 1;             -- group by �� ���η� ��Ÿ����.



select GENDER, count(*) AS �ο���
from
(
select case when substr(jubun, 7, 1) in('1', '3') then '����'
            else '����'
            end AS GENDER
from employees
) V
group by GENDER;


select age, count(*) AS �ο���
from
(
select trunc(extract(year from sysdate) - to_number(substr(jubun, 1, 2)) - case when substr(jubun, 7, 1) in ('1', '2') then 1900 else 2000 end + 1, - 1) AS AGE
from employees
) V
group by age
order by 1;


select department_id, count(*) AS �ο���
from employees
group by rollup (department_id);  -- rollup ( ) �������� ������ �ѹ� ������ش�.


select GENDER, count(*) AS �ο���
from
(
select case when substr(jubun, 7, 1) in('1', '3') then '����'
            else '����'
            end AS GENDER
from employees
) V
group by rollup (GENDER);



select age, count(*) AS �ο���
from
(
select trunc(extract(year from sysdate) - to_number(substr(jubun, 1, 2)) - case when substr(jubun, 7, 1) in ('1', '2') then 1900 else 2000 end + 1, - 1) AS AGE
from employees
) V
group by rollup (age);


select case grouping(department_id)     -- null �� 2������ �� �Ұ������� �׷��� ���� �̿��ϸ� rollup�� ������ �����ִ� null�� ���� �μ���ȣ�� ���� null�� ���а���
          when 0 then nvl(to_char(department_id), '����')
          else '����'     -- �� �÷��ȿ� �ΰ����� ������ Ÿ���� �� �� �����Ƿ�, ���ڸ� ���ڷ� ����!!!!!!!!!!!!!!!!!!
       end AS �μ���ȣ,
       count(*) AS �ο���    -- grouping(���� 0, 1�� ���� ���´�.) �� group by �� rollup �� �����Ҷ��� ����� �� �ִ�. !!!!!!!!!!!!!!!
from employees
group by rollup(department_id);



select nvl(GENDER, '��ü'),              -- ������� null �� �Ѱ���  �ٷ� nvl �ص� ������ 2���� grouping  case~ �ؾ���
       count(*) AS �ο���,
       round((count(*) / (select count(*) from employees)) * 100, 1) AS "%"      -- % ���ϴ� ��!!!!
from
(
select case when substr(jubun, 7, 1) in('1', '3') then '����'
            else '����'
            end AS GENDER
from employees
) V
group by rollup (GENDER);



select nvl(to_char(age), '��ü'),
       count(*) AS �ο���,
       round((count(*) / (select count(*) from employees)) * 100, 1) AS "%"
from
(
select trunc(extract(year from sysdate) - to_number(substr(jubun, 1, 2)) - case when substr(jubun, 7, 1) in ('1', '2') then 1900 else 2000 end + 1, - 1) AS AGE
from employees
) V
group by rollup (age);



select case grouping(department_id)     
          when 0 then nvl(to_char(department_id), '����')
          else '����'    
       end AS �μ���ȣ,
       count(*) AS �ο���,
       round((count(*) / (select count(*) from employees)) * 100, 1) AS "%"
from employees
group by rollup(department_id);


-- 1892