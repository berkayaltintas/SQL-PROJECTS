--Q6) Write the query that brings customers living in Istanbul.(Subquery)
SELECT 
(SELECT CITY FROM CITIES WHERE ID=C.CITYID), *FROM CUSTOMERS C 
WHERE 
(SELECT CITY FROM CITIES WHERE ID=C.CITYID)='ÝSTANBUL'