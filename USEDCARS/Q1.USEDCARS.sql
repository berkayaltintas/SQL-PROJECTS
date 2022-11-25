--Q1) Write the query that returns how many vehicles are from each brand according to vehicle brands.

SELECT DISTINCT BRAND FROM WEBOFFERS --(We see how many different car brands there are.)

SELECT BRAND ,COUNT(*) AS COUNTCAR FROM WEBOFFERS 
GROUP BY BRAND
ORDER BY 2 DESC