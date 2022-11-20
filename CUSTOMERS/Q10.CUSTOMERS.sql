--Q10) Bring the cities with more than 10 customers in order from most to least, 
--together with the number of customers.(SUBQUERY)

SELECT *,
(SELECT COUNT(*) FROM CUSTOMERS WHERE CITYID=CT.ID)
FROM CITIES CT
WHERE 
(SELECT COUNT(*) FROM CUSTOMERS WHERE CITYID=CT.ID)>10