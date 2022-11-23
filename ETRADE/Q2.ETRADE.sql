--Q2) Write the query that brings the information about how many sales are made per month according to the cities in the Saleorders Table.
SELECT CITY,MONTH_,SUM(LINETOTAL) FROM SALEORDERS
GROUP BY CITY,MONTH_
ORDER BY CITY,MONTH_