--Q8) Bring the number of men and women hired by year.

SELECT DISTINCT YEAR(P.INDATE)  AS YEAR_ ,
(SELECT COUNT(*) FROM PERSON WHERE GENDER='E' AND YEAR(INDATE)=YEAR(P.INDATE)) AS MALE,
(SELECT COUNT(*) FROM PERSON WHERE GENDER='K' AND YEAR(INDATE)=YEAR(P.INDATE)) AS FEMALE

FROM PERSON P
ORDER BY 1