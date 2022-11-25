--Q4) We are looking for a Volkswagen Passat brand car in Istanbul. Our criteria are:
--From : Owner
--Model : 2014-2018
--Shýfttype : Automatic
--Fuel : Diesel
--Sort by mileage and price

SELECT U.NAMESURNAME,C.CITY,T.TOWN,D.DISTRICT,W.TITLE,W.BRAND,W.FUEL,W.PRICE,W.KM,W.COLOR,W.SHIFTTYPE FROM WEBOFFERS W
INNER JOIN USER_ U ON U.ID=W.USERID
INNER JOIN CITY C ON C.ID=W.CITYID
INNER JOIN TOWN T ON T.ID=W.TOWNID
INNER JOIN DISTRICT D ON D.ID=W.DISTRICTID
WHERE C.CITY='ÝSTANBUL' AND
W.FROMWHO='Sahibinden' AND W.MODEL='Passat' AND W.BRAND='Volkswagen' AND
W.FUEL='Dizel' AND YEAR_ BETWEEN '2014' AND '2018' AND W.SHIFTTYPE IN ('Otomatik Vites','Yarý Otomatik Vites')
ORDER BY KM,PRICE