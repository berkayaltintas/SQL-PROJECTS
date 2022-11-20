--Q5) Write the query that brings customers living in Istanbul.(Join)

SELECT CT.CITY,C.CUSTOMERNAME FROM CUSTOMERS C
INNER JOIN CITIES CT ON CT.ID=C.CITYID
WHERE CT.CITY='ÝSTANBUL'
