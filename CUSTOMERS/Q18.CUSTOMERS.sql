--Q18) Add the name Ankara in the same order.
SELECT *FROM CITIES --Control! We cant see Ankara ýn table.
SET IDENTITY_INSERT CITIES ON -->It is mandatory to write this information.
INSERT INTO CITIES(ID,CITY)
VALUES(6,'ANKARA') 
SELECT *FROM CITIES --Control again. We can see Ankara in table.
