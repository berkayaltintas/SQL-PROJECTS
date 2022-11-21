--Q5)A new chief has been appointed to the Planning department of our company and we want to determine his salary. 
--What is the query that returns the maximum, minimum and average chief salary for the Planning department? 
--(Note: Salaries of dismissed personnel are also included)(Subquery)

SELECT POS.POSITION ,
(SELECT MAX(SALARY) FROM PERSON WHERE POSITIONID=POS.ID ) AS MAXSALARY,
(SELECT MIN(SALARY) FROM PERSON WHERE POSITIONID=POS.ID ) AS MINSALARY,
ROUND((SELECT AVG(SALARY) FROM PERSON WHERE POSITIONID=POS.ID ),2) AS AVGSALARY --ROUND(value,digit after comma)
FROM POSITION POS
WHERE POS.POSITION ='PLANLAMA ÞEFÝ'