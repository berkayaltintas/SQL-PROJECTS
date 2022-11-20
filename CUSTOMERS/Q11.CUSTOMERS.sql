--Q11) Bring the query showing how many men and how many women live in the cities.

SELECT CT.CITY,C.GENDER,COUNT(C.ID)FROM CUSTOMERS C 
INNER JOIN CITIES CT ON CT.ID=C.CITYID
GROUP BY CT.CITY,C.GENDER
ORDER BY CT.CITY,C.GENDER 