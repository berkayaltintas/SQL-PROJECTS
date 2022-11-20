--Q22) Bring in customers' birthdays as days of the week.

SELECT DATENAME(DW,BIRTHDATE) ,BIRTHDATE,CUSTOMERNAME FROM CUSTOMERS

-- For example, if we wanted to do it in spanish.
SET LANGUAGE Spanish --> We ajdust like this.
SELECT DATENAME(DW,BIRTHDATE) as dayofweekk ,BIRTHDATE,CUSTOMERNAME FROM CUSTOMERS
SET LANGUAGE English --> We go back to the old setting.