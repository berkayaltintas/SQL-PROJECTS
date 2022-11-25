--Q2) Write the query that shows how many vehicles are from each brand according to vehicle brands and
--how much it corresponds to the total in percentage.
SELECT BRAND ,COUNT(*),
ROUND(CONVERT(FLOAT,COUNT(*))/(SELECT COUNT(*) FROM WEBOFFERS)*100,2)

FROM WEBOFFERS
GROUP BY BRAND
ORDER BY 2 DESC