--Q3) What was the best month for sales in a specific year?
--How much was earned that month?

SELECT MONTH_ID,SUM(SALES) AS SALESBYMONTH FROM SALESDATASAMPLE

WHERE YEAR_ID = '2003'
GROUP BY MONTH_ID
ORDER BY 2 DESC -- NOVEMBER=77741826 $

SELECT MONTH_ID,SUM(SALES) AS SALESBYMONTH FROM SALESDATASAMPLE

WHERE YEAR_ID = '2005'
GROUP BY MONTH_ID
ORDER BY 2 DESC --MAY= 31111615 $