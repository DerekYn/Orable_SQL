 ----- *****  데이터베이스 링크 생성하기 ***** ----------
 
 create database link teacherlink
 connect to hr identified by eclass
 using 'ORATEACHER';
 
 
 select *
 from employees;
 
 select *
 from employees@teacherlink;
 
 
 update employees ME set first_name = ( select first_name
                                        from employees@teacherlink
                                        where employee_id = ME.employee_id );
                                                                    
 select *
 from employees;
 
 commit;
 
 
 select *
 from global_name;

-- 2743