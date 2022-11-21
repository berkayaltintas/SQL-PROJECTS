--Q6) We would like to have them list how many people are currently employed in each position,
--how many people are working and what is their average salary. Write the query that returns this result.(JOIN)

SELECT POS.POSITION,COUNT(P.ID) AS PERSONCOUNT ,AVG(P.SALARY) AS AVGSALARY FROM POSITION POS
INNER JOIN PERSON P ON P.POSITIONID=POS.ID
GROUP BY POS.POSITION
ORDER BY POS.POSITION -- (ALPHABETIC ORDER)
