--Q10) In the fifth year of our company, an agenda with the initials of their name and surname will be distributed to everyone. 
--Find out how many of each combination should be produced.

SELECT SUBSTRING(NAME_,1,1)+'.'+SUBSTRING(SURNAME,1,1)+'.' AS SHORTNAME,COUNT(ID)

FROM PERSON
GROUP BY SUBSTRING(NAME_,1,1)+'.'+SUBSTRING(SURNAME,1,1)+'.'
ORDER BY 2 DESC -->S.K MOST COMBINATIONS
