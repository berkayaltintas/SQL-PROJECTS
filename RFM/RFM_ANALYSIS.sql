-- You can download the link from this address. https://archive.ics.uci.edu/ml/datasets/Online+Retail+II#



--The first job is to create an SQL table in the format we want to achieve.


SELECT *FROM RFM --(We created.)
--Let's still write the code to empty the table and fill the table with CustomerIDs so that it does not repeat in it.

TRUNCATE TABLE RFM

SELECT *FROM RFM --CONTROL (EMPTY)

INSERT INTO RFM (CUSTOMERID) SELECT DISTINCT [Customer ID] FROM ONLINERETAIL_2010
SELECT *FROM RFM --CONTROL 

UPDATE RFM SET LASTINVOICEDATE=(SELECT MAX(InvoiceDate) 
FROM ONLINERETAIL_2010 where [Customer ID]=RFM.CustomerID)

SELECT *FROM RFM --CONTROL 

--The command that gets the difference between two dates in SQL Server is DateDiff. 
--This command takes three parameters:
--Type of difference (such as day, month, year)
--Start date (LastInvoiceDate)
--End date (Today's date. But since our dataset was in 2011, we can take the end date as 31.12.2011 in this example.)

UPDATE RFM SET Recency = DATEDIFF (DAY, LASTINVOICEDATE, '20111231')

SELECT *FROM RFM --CONTROL 

UPDATE RFM SET Frequency=(SELECT COUNT(Distinct Invoice) FROM ONLINERETAIL_2010 WHERE [Customer ID]=RFM.CUSTOMERID)

SELECT *FROM RFM --CONTROL 

UPDATE RFM SET MONETERY=(SELECT SUM(Price*Quantity)  FROM ONLINERETAIL_2010 WHERE [Customer ID]=RFM.CUSTOMERID)

SELECT *FROM RFM --CONTROL 
--LET'S CALCULATE THE RECENCY_SCALE VALUE
UPDATE RFM SET RECENCY_SCALE= 
(
 select RANK from
(
SELECT  *,
       NTILE(5) OVER(
       ORDER BY Recency desc) Rank
FROM RFM
) t where  CUSTOMERID=RFM. CUSTOMERID)

SELECT *FROM RFM --CONTROL 

--LET'S CALCULATE THE FREQUNECY_SCALE VALUE
UPDATE RFM SET FREQUENCY_SCALE= 
(
 select RANK from
(
SELECT  *,
       NTILE(5) OVER(
       ORDER BY Frequency) Rank
FROM RFM
) T where  CUSTOMERID=RFM. CUSTOMERID)

SELECT *FROM RFM --CONTROL 

--LET'S CALCULATE THE MONETERY_SCALE VALUE
UPDATE  RFM SET MONETERY_SCALE= 
(
 select RANK from
 (
SELECT  *,
       NTILE(5) OVER(
       ORDER BY Monetery) Rank
FROM RFM 
) t where  CustomerID=RFM.CustomerID)

SELECT *FROM RFM --CONTROL 

UPDATE RFM SET Segment ='Hibernating' 
WHERE RECENCY_SCALE LIKE  '[1-2%]' AND FREQUENCY_SCALE LIKE '[1-2]%'  
UPDATE RFM SET Segment ='At_Risk' 
WHERE RECENCY_SCALE LIKE  '[1-2]%' AND FREQUENCY_SCALE LIKE '[3-4]%'  
UPDATE RFM SET Segment ='Cant_Loose' 
WHERE RECENCY_SCALE LIKE  '[1-2]%' AND FREQUENCY_SCALE LIKE '[5]%'  
UPDATE RFM SET Segment ='About_to_Sleep' 
WHERE RECENCY_SCALE LIKE  '[3]%' AND FREQUENCY_SCALE LIKE '[1-2]%'  
UPDATE RFM SET Segment ='Need_Attention' 
WHERE RECENCY_SCALE LIKE  '[3]%' AND FREQUENCY_SCALE LIKE '[3]%' 
UPDATE RFM SET Segment ='Loyal_Customers' 
WHERE RECENCY_SCALE LIKE  '[3-4]%' AND FREQUENCY_SCALE LIKE '[4-5]%' 
UPDATE RFM SET Segment ='Promising' 
WHERE Recency_Scale LIKE  '[4]%' AND Frequency_Scale LIKE '[1]%' 
UPDATE RFM SET Segment ='New_Customers' 
WHERE Recency_Scale LIKE  '[5]%' AND Frequency_Scale LIKE '[1]%' 
UPDATE RFM SET Segment ='Potential_Loyalists' 
WHERE Recency_Scale LIKE  '[4-5]%' AND Frequency_Scale LIKE '[2-3]%' 
UPDATE RFM SET Segment ='Champions' 
WHERE Recency_Scale LIKE  '[5]%' AND Frequency_Scale LIKE '[4-5]%'


SELECT *FROM RFM --CONTROL 

SELECT SEGMENT , COUNT(CUSTOMERID) FROM RFM
GROUP BY SEGMENT
ORDER BY 2