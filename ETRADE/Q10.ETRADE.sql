--Q10) Write the query that brings the information of how much each product is sold at an average, maximum and minimum.

SELECT IT.BRAND,IT.CATEGORY1,IT.ITEMCODE,IT.ITEMNAME ,
COUNT(OD.ID) AS SALECOUNT,SUM(OD.AMOUNT) AS TOTALAMOUNT
,MIN(OD.UNITPRICE) AS MINPRICE,MAX(OD.UNITPRICE) AS MAXPRICE, AVG(OD.UNITPRICE) AS AVGPRICE
FROM ITEMS IT

INNER JOIN ORDERDETAILS OD ON OD.ITEMID=IT.ID

GROUP BY IT.BRAND,IT.CATEGORY1,IT.ITEMCODE,IT.ITEMNAME