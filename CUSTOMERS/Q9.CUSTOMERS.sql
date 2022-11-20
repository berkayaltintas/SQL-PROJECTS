--Q9) Bring the cities with more than 10 customers in order from most to least, 
--together with the number of customers.(JOIN)

SELECT CT.CITY,COUNT(C.ID) FROM CUSTOMERS C
INNER JOIN CITIES CT ON CT.ID=C.CITYID
GROUP BY CT.CITY
HAVING COUNT(C.ID) >10
ORDER BY 2 DESC