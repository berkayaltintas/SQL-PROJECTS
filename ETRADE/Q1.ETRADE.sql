
--Q1) Write the SQL query on the SALEORDERS Table, which brings the information of how much sales were made in which city.

SELECT CITY ,SUM(LINETOTAL) FROM SALEORDERS
GROUP BY CITY
ORDER BY 2 DESC -- 2=SUM(LINETOTAL) --> LINETOTAL= AMOUNT X PRICE
