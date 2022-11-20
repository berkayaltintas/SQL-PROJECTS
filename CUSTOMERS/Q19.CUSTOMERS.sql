--Q19) We want to bring operator numbers. Like (532),(505). Write the required SQL query for this.

SELECT *,SUBSTRING(TELNR1,1,5) AS OPERATOR1, --Start first.Go five letter.
SUBSTRING(TELNR2,1,5) AS OPERATOR1 FROM CUSTOMERS