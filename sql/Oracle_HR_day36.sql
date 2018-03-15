 -- case 规侥
 select employee_id, ename, yearsal,
        case when 1 <= yearsal and yearsal <= 99999 then 0.02
             when 100000 <= yearsal and yearsal <= 149999 then 0.05
             when 150000 <= yearsal and yearsal <= 199999 then 0.08
             else 0.1
        end AS 技啦,
        case when 1 <= yearsal and yearsal <= 99999 then 0.02 * yearsal
             when 100000 <= yearsal and yearsal <= 149999 then 0.05 * yearsal
             when 150000 <= yearsal and yearsal <= 199999 then 0.08 * yearsal
             else 0.1 * yearsal
        end AS 家垫技
 from
 (  select employee_id,
           first_name || ' ' || last_name AS ENAME,
           nvl(salary + (salary * commission_pct), salary) * 12 AS YEARSAL
    from employees
 ) V;
   
   
   update tbl_taxindex set lowerincome = 1,
                           highincome = 109999,
                           taxpercent = 0.025
   where rowid = 'AAAE8WAAEAAAAHcAAA';
   
   update tbl_taxindex set lowerincome = 110000,
                           highincome = 169999,
                           taxpercent = 0.053
   where rowid = 'AAAE8WAAEAAAAHcAAB';
   
   update tbl_taxindex set lowerincome = 170000,
                           highincome = 229999,
                           taxpercent = 0.088
   where rowid = 'AAAE8WAAEAAAAHcAAC';
   
   update tbl_taxindex set lowerincome = 230000,
                           highincome = 1000000000,
                           taxpercent = 0.125
   where rowid = 'AAAE8WAAEAAAAHcAAD';
   
   commit;
   
  
 -- 1992 规侥
 select A.*,
        B.Taxpercent,
        A.YEARSAL * B.Taxpercent AS 家垫技,
        A.YEARSAL - B.Taxpercent AS REALYEARSAL
 from 
 (
     select employee_id,
            first_name || ' ' || last_name AS ENAME,
            nvl(salary + (salary * commission_pct), salary) * 12 AS YEARSAL
     from employees
 ) A, tbl_taxindex B
 where A.YEARSAL between B.lowerincome and B.highincome;


-- 3108