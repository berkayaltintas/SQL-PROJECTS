--Q5) What city has the highest number of sales in a specific country?

SELECT COUNTRY,SUM(SALES)  FROM SALESDATASAMPLE
GROUP BY COUNTRY
ORDER BY 1 DESC