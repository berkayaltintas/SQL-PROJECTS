--Q1) Please bring the numbers of Women and Men who are still working on a departmental basis in our company.

SELECT DM.DEPARTMENT,P.GENDER,COUNT(P.ID) FROM PERSON P
INNER JOIN POSITION POS ON POS.ID=P.POSITIONID
INNER JOIN DEPARTMENT DM ON DM.ID=P.DEPARTMENTID
WHERE P.OUTDATE IS NULL --> Still working
GROUP BY  DM.DEPARTMENT, P.GENDER
ORDER BY DM.DEPARTMENT, COUNT(P.ID)

--Q2) PLESE WRITE E = MALE , K = FEMALE IN TURKISH E=ERKEK K=KADIN
--We use the 'Case' structure where the Gender structure is.
SELECT DM.DEPARTMENT,
CASE
    WHEN P.GENDER = 'E' THEN 'MALE'
	ELSE 'FEMALE'
END AS GENDER

,COUNT(P.ID) AS PERSONCOUNT FROM PERSON P
INNER JOIN DEPARTMENT DM ON DM.ID=P.DEPARTMENTID
WHERE P.OUTDATE IS NULL --> Still working
GROUP BY  DM.DEPARTMENT, P.GENDER
ORDER BY DM.DEPARTMENT, COUNT(P.ID)

--Q3) Please bring the numbers of Women and Men who are still working on a departmental basis in our company.(Subquery)

SELECT *,
(SELECT COUNT(*) FROM PERSON WHERE DEPARTMENTID=D.ID AND GENDER='E'  AND OUTDATE IS NULL) AS MALEPERSON,
(SELECT COUNT(*) FROM PERSON WHERE DEPARTMENTID=D.ID AND GENDER='K' AND OUTDATE IS NULL) AS FEMALEPERSON,
(SELECT COUNT(*) FROM PERSON WHERE DEPARTMENTID=D.ID AND OUTDATE IS NULL) AS TOTOLPERSON


FROM DEPARTMENT D 

--Q4)A new chief has been appointed to the Planning department of our company and we want to determine his salary. 
--What is the query that returns the maximum, minimum and average chief salary for the Planning department? 
--(Note: Salaries of dismissed personnel are also included)

--SELECT *FROM POSITION WHERE POSITION='PLANLAMA ÞEFÝ'-- WE CAN SEE IN TABLE.

SELECT POS.POSITION,MAX(P.SALARY) AS MAXSALARY,MIN(P.SALARY) AS MINSALARY,AVG(P.SALARY) AS AVGSALARY FROM POSITION POS
INNER JOIN PERSON P ON P.POSITIONID=POS.ID
WHERE POS.POSITION='PLANLAMA ÞEFÝ' --PLANLAMA ÞEFÝ= PLANNING CHIEF
GROUP BY POS.POSITION

--Q5)A new chief has been appointed to the Planning department of our company and we want to determine his salary. 
--What is the query that returns the maximum, minimum and average chief salary for the Planning department? 
--(Note: Salaries of dismissed personnel are also included)(Subquery)

SELECT POS.POSITION ,
(SELECT MAX(SALARY) FROM PERSON WHERE POSITIONID=POS.ID ) AS MAXSALARY,
(SELECT MIN(SALARY) FROM PERSON WHERE POSITIONID=POS.ID ) AS MINSALARY,
ROUND((SELECT AVG(SALARY) FROM PERSON WHERE POSITIONID=POS.ID ),2) AS AVGSALARY --ROUND(value,digit after comma)
FROM POSITION POS
WHERE POS.POSITION ='PLANLAMA ÞEFÝ'

--Q6) We would like to have them list how many people are currently employed in each position,
--how many people are working and what is their average salary. Write the query that returns this result.(JOIN)

SELECT POS.POSITION,COUNT(P.ID) AS PERSONCOUNT ,AVG(P.SALARY) AS AVGSALARY FROM POSITION POS
INNER JOIN PERSON P ON P.POSITIONID=POS.ID
GROUP BY POS.POSITION
ORDER BY POS.POSITION -- (ALPHABETIC ORDER)

--Q7) We would like to have them list how many people are currently employed in each position,
--how many people are working and what is their average salary. Write the query that returns this result.(SUBQUERY)

SELECT POS.POSITION,
(SELECT COUNT(ID) FROM PERSON WHERE POSITIONID=POS.ID) AS PERSONCOUNT,
(SELECT ROUND(AVG(SALARY),1) FROM PERSON WHERE POSITIONID=POS.ID) AS AVGSALARY --8708,3 ROUND(VALUE,1)
 FROM POSITION POS

--Q8) Bring the number of men and women hired by year.

SELECT DISTINCT YEAR(P.INDATE)  AS YEAR_ ,
(SELECT COUNT(*) FROM PERSON WHERE GENDER='E' AND YEAR(INDATE)=YEAR(P.INDATE)) AS MALE,
(SELECT COUNT(*) FROM PERSON WHERE GENDER='K' AND YEAR(INDATE)=YEAR(P.INDATE)) AS FEMALE

FROM PERSON P
ORDER BY 1

--Q9) Bring the query showing how long each of our employees has worked.

SELECT NAME_+' '+SURNAME AS PERSON,INDATE,OUTDATE,
CASE
    WHEN OUTDATE IS NULL THEN DATEDIFF(MONTH,INDATE,GETDATE())
	ELSE DATEDIFF(MONTH,INDATE,OUTDATE)
END AS WORKINGTIME
FROM PERSON -- ---> SOLUTION(1)
--------------------------------------------------------------------------------
SELECT NAME_ +' '+SURNAME AS PERSON,INDATE,OUTDATE,DATEDIFF(MONTH,INDATE,GETDATE()) FROM PERSON
WHERE OUTDATE IS NULL
UNION ALL
--We used 'UNION ALL' to combine the two queries. 
--If we want to use this function, we need to have the same things (columns in the same number and order).
SELECT NAME_ +' '+SURNAME AS PERSON,INDATE,OUTDATE,DATEDIFF(MONTH,INDATE,OUTDATE) FROM PERSON
WHERE OUTDATE IS NOT NULL --- ---->SOLUTION(2)

--Q10) In the fifth year of our company, an agenda with the initials of their name and surname will be distributed to everyone. 
--Find out how many of each combination should be produced.

SELECT SUBSTRING(NAME_,1,1)+'.'+SUBSTRING(SURNAME,1,1)+'.' AS SHORTNAME,COUNT(ID)

FROM PERSON
GROUP BY SUBSTRING(NAME_,1,1)+'.'+SUBSTRING(SURNAME,1,1)+'.'
ORDER BY 2 DESC -->S.K MOST COMBINATIONS

--Q11) Please list the departments with an average salary of more than 5500 TL and bring them.

SELECT D.DEPARTMENT,AVG(P.SALARY) AS AVGSALARY FROM PERSON P
INNER JOIN DEPARTMENT D ON D.ID=P.DEPARTMENTID
GROUP BY D.DEPARTMENT
HAVING AVG(P.SALARY)>5500
ORDER BY 1 DESC --SOLUTION(1) (USING JOIN)

SELECT *,
(SELECT ROUND(AVG(SALARY),0) FROM PERSON WHERE DEPARTMENTID=D.ID) AS AVGSALARY
FROM DEPARTMENT D 
WHERE (SELECT AVG(SALARY) FROM PERSON WHERE DEPARTMENTID=D.ID)>5500 --SOLUTION(2) (USING SUBQUERY)
ORDER BY 1
SELECT *FROM
(
SELECT DEPARTMENT,AVG(P.SALARY) AS AVGSALARY 
FROM DEPARTMENT D
INNER JOIN PERSON P ON P.DEPARTMENTID=DEPARTMENTID
GROUP BY DEPARTMENT
) GS WHERE AVGSALARY>5500--SOLUTION(3) (DYNAMIC VÝEW)

--Q12) Write the query that returns the average working time of the departments.
SELECT DEPARTMENT,AVG(WORKINGTIME) FROM
(
SELECT  D.DEPARTMENT,
CASE 
    WHEN OUTDATE IS NOT NULL THEN DATEDIFF(MONTH,INDATE,OUTDATE)
	ELSE DATEDIFF(MONTH,INDATE,GETDATE())
END AS WORKINGTIME
FROM PERSON P
INNER JOIN DEPARTMENT D ON D.ID=P.DEPARTMENTID ) GS
GROUP BY DEPARTMENT  --DYNAMIC VIEW

--Q13) Write down the name of each personnel,
--the name of the unit manager to which he is affiliated, and the information that brings his position.

SELECT 
P.NAME_+''+P.SURNAME AS PERSON,P2.NAME_+''+P2.SURNAME AS MANAGERNAME,POS2.POSITION AS MANAGERPOSITION
FROM PERSON P
INNER JOIN POSITION POS ON POS.ID=P.POSITIONID
INNER JOIN PERSON P2 ON P2.ID=P.MANAGERID
INNER JOIN POSITION POS2 ON POS2.ID=P2.POSITIONID


