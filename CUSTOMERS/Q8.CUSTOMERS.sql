--Q8) Write a query showing how many people live in cities.(Subquery)

SELECT *,
(SELECT COUNT(*) FROM CUSTOMERS WHERE CITYID=CT.ID) AS CUSTOMERCOUNT 
FROM CITIES CT