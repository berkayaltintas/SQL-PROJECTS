--Q13) Write down the name of each personnel,
--the name of the unit manager to which he is affiliated, and the information that brings his position.

SELECT 
P.NAME_+''+P.SURNAME AS PERSON,P2.NAME_+''+P2.SURNAME AS MANAGERNAME,POS2.POSITION AS MANAGERPOSITION
FROM PERSON P
INNER JOIN POSITION POS ON POS.ID=P.POSITIONID
INNER JOIN PERSON P2 ON P2.ID=P.MANAGERID
INNER JOIN POSITION POS2 ON POS2.ID=P2.POSITIONID
