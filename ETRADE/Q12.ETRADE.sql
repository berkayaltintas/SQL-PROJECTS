--Q12) Write the query listing the cities that place orders of 500 TL or less per day for at least 10 days in January.
SELECT CITY ,COUNT(*)FROM
(
SELECT  CT.CITY,CONVERT(DATE,O.DATE_) AS DATE_,SUM(O.TOTALPRICE) AS TOTALPR�CE
FROM ORDERS O
INNER JOIN ADDRESS AD ON AD.ID=O.ADDRESSID
INNER JOIN CITIES CT ON CT.ID=AD.CITYID
WHERE O.DATE_ BETWEEN '20190101' AND '20190131 23:59:59'
GROUP BY CT.CITY,CONVERT(DATE,O.DATE_)
HAVING SUM(O.TOTALPRICE)<500
) GS
GROUP BY CITY