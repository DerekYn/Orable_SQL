----------------------$$$$$$$$$$$$$$$          �м��Լ�         $$$$$$$$$$$$$$$----------------------------

-- ntile(n) �Լ�
    --  ��Ÿ�� ����� n���� ������� ( �� �ȳ��� ���� 1�η��� 1�� �� ���� ������.. ������ 2�η�...)

select first_name || ' ' || last_name AS ENAME, salary
from employees
where department_id = 50;           -- 45 ��


select first_name || ' ' || last_name AS ENAME, salary
from employees
where department_id = 80;           -- 34 ��

select first_name || ' ' || last_name AS ENAME, salary,
       ntile(4) over(order by salary desc) AS CLASS
from employees
where department_id = 50;           -- 45 ��

 -- 111111111111            1 �η�  =>  12��
 -- 22222222222             2 �η�  =>  11��
 -- 33333333333             3 �η�  =>  11��
 -- 44444444444             4 �η�  =>  11��

select first_name || ' ' || last_name AS ENAME, salary,
       ntile(4) over(order by salary desc) AS CLASS
from employees
where department_id = 80;           -- 34 ��

 -- 111111111           1 �η�  =>  9��
 -- 222222222           2 �η�  =>  9��
 -- 33333333            3 �η�  =>  8��
 -- 44444444            4 �η�  =>  8��


-- 2293