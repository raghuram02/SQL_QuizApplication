A)	WITH fib (idx, fib) AS (SELECT 1 idx , 0 fib FROM dual UNION ALL 
    SELECT f1.idx + 1 idx , CASE f1.idx WHEN 1 THEN 1 ELSE ( SELECT SUM(fib) FROM fib fprev WHERE fprev.idx BETWEEN f1.idx-1 AND f1.idx) END fib
      FROM fib f1
      WHERE f1.idx < 10)
    SELECT FIB FROM FIB ORDER BY IDX; 
B)	SELECT fib FROM 
    (SELECT level idx , 
	        CASE level WHEN 1 THEN 0 WHEN 2 THEN 1 ELSE prior fib + prior prevfib END fib ,
            CASE level WHEN 1 THEN NULL WHEN 2 THEN 0 ELSE prior fib END prevfib
       FROM dual CONNECT BY level <= 10)
     ORDER BY IDX; 

