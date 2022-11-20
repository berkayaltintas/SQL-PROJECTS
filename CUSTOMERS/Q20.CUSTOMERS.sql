--Q20) Let x operator start with "50" or "55", operator y starting with "54" and
--z operator starting with "53". How many people are there from each operator?
-------------
SELECT 
CASE
   WHEN TELNR1 LIKE '(50%' OR TELNR1 LIKE '(55%)' THEN 1
   ELSE 0
END AS TELNR1_XOPERATOR,
CASE
   WHEN TELNR1 LIKE ('54%') THEN 1
   ELSE 0
END AS TELNR1_YOPERATOR,
CASE
   WHEN TELNR1 LIKE ('53%')  THEN 1 -------------STEP(1)
   ELSE 0
END AS TELNR1_ZOPERATOR,
CASE
   WHEN TELNR2 LIKE '(50%' OR TELNR1 LIKE '(55%)' THEN 1
   ELSE 0
END AS TELNR2_XOPERATOR,
CASE
   WHEN TELNR2 LIKE ('54%') THEN 1
   ELSE 0
END AS TELNR2_YOPERATOR,
CASE
   WHEN TELNR2 LIKE '(53%' THEN 1
   ELSE 0
END AS TELNR2_ZOPERATOR,
 *FROM CUSTOMERS
 ------------------------------------------------
 SELECT 
 SUM( TELNR1_XOPERATOR + TELNR2_XOPERATOR ) AS XOPERATORCOUNT,
 SUM(TELNR1_YOPERATOR + TELNR2_YOPERATOR) AS YOPERATORCOUNT,
 SUM(TELNR1_ZOPERATOR + TELNR2_ZOPERATOR) AS ZOPERATORCOUNT
 FROM
 (
 SELECT 
CASE
   WHEN TELNR1 LIKE '(50%' OR TELNR1 LIKE '(55%)' THEN 1
   ELSE 0
END AS TELNR1_XOPERATOR,
CASE
   WHEN TELNR1 LIKE ('54%') THEN 1
   ELSE 0
END AS TELNR1_YOPERATOR,
CASE
   WHEN TELNR1 LIKE ('53%')  THEN 1 ------------------------------------------------STEP(1)
   ELSE 0
END AS TELNR1_ZOPERATOR,
CASE
   WHEN TELNR2 LIKE '(50%' OR TELNR1 LIKE '(55%)' THEN 1
   ELSE 0
END AS TELNR2_XOPERATOR,
CASE
   WHEN TELNR2 LIKE ('54%') THEN 1
   ELSE 0
END AS TELNR2_YOPERATOR,
CASE
   WHEN TELNR2 LIKE '(53%' THEN 1
   ELSE 0
END AS TELNR2_ZOPERATOR,
 * FROM CUSTOMERS 
 ) T    -- We did dynamic query.Very important.