--Q6) What is the best product in United States ?

SELECT COUNTRY,PRODUCTLINE,YEAR_ID,SUM(SALES) FROM SALESDATASAMPLE WHERE 
COUNTRY='USA'
GROUP BY PRODUCTLINE,COUNTRY,YEAR_ID
ORDER BY 4
