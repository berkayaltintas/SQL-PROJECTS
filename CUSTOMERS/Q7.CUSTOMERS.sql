--Q7) Write a query showing how many people live in cities.(Join)

SELECT CT.CITY,COUNT(C.ID) FROM CUSTOMERS C
INNER JOIN CITIES CT ON CT.ID=C.CITYID
GROUP BY CT.CITY