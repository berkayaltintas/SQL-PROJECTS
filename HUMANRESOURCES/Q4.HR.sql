--Q4)A new chief has been appointed to the Planning department of our company and we want to determine his salary. 
--What is the query that returns the maximum, minimum and average chief salary for the Planning department? 
--(Note: Salaries of dismissed personnel are also included)

--SELECT *FROM POSITION WHERE POSITION='PLANLAMA ÞEFÝ'-- WE CAN SEE IN TABLE.

SELECT POS.POSITION,MAX(P.SALARY) AS MAXSALARY,MIN(P.SALARY) AS MINSALARY,AVG(P.SALARY) AS AVGSALARY FROM POSITION POS
INNER JOIN PERSON P ON P.POSITIONID=POS.ID
WHERE POS.POSITION='PLANLAMA ÞEFÝ' --PLANLAMA ÞEFÝ= PLANNING CHIEF
GROUP BY POS.POSITION