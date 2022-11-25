--Q5) Write the queries that bring BMW brand vehicles in Ankara, Istanbul and Izmir.
--Here, city names will be combined with commas, not one by one.
 
 SELECT U.NAMESURNAME,C.CITY,T.TOWN,D.DISTRICT,W.TITLE,W.BRAND,W.FUEL,W.PRICE,W.KM,W.COLOR,W.SHIFTTYPE FROM WEBOFFERS W
INNER JOIN USER_ U ON U.ID=W.USERID
INNER JOIN CITY C ON C.ID=W.CITYID
INNER JOIN TOWN T ON T.ID=W.TOWNID
INNER JOIN DISTRICT D ON D.ID=W.DISTRICTID
WHERE W.BRAND='BMW' AND C.CITY IN ( SELECT value FROM string_split ('ANKARA,ÝSTANBUL,ÝZMÝR',','))

SELECT value FROM string_split ('ANKARA,ÝSTANBUL,ÝZMÝR',',') --LIKE A TABLE.