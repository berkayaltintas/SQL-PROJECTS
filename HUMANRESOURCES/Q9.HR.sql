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
