--Q17)Assume we delete the record "Ankara" from the CITIES table. The city field of the customers who are in Ankara will be empty.
--Write the queries that list the customers whose city field is empty.

DELETE FROM CITIES WHERE CITY='ANKARA'--SOLUTION(1) STEP(1)

SELECT *FROM CUSTOMERS C  --STEP(2)
LEFT JOIN CITIES CT ON CT.ID=C.CITYID
WHERE CT.CITY IS NULL

SELECT *FROM CITIES  --SOLUTION(2) STEP(1)
SELECT *FROM CUSTOMERS WHERE CITYID NOT IN  (SELECT ID FROM CITIES) --STEP(2)