--Q7) We would like to have them list how many people are currently employed in each position,
--how many people are working and what is their average salary. Write the query that returns this result.(SUBQUERY)

SELECT POS.POSITION,
(SELECT COUNT(ID) FROM PERSON WHERE POSITIONID=POS.ID) AS PERSONCOUNT,
(SELECT ROUND(AVG(SALARY),1) FROM PERSON WHERE POSITIONID=POS.ID) AS AVGSALARY --8708,3 ROUND(VALUE,1)
 FROM POSITION POS