SELECT  SO.order_id, CONCAT(SC.first_name, ' ' ,SC.last_name) AS NAMESURNAME,
SC.city ,SC.state,SO.order_date,SUM(SOI.quantity) AS TOTALPRODUCT ,
SUM(SOI.quantity*SOI.list_price) AS TOTALREVENUE,
PP.product_name,PC.category_name,SS.store_name,CONCAT(SF.first_name, ' ' ,SF.last_name) AS STAFFNAME
FROM SALES.ORDERS SO

INNER JOIN  [sales].[customers] SC ON  SC.customer_id=SO.customer_id
INNER JOIN  [sales].[order_items] SOI ON SOI.order_id=SO.order_id 
INNER JOIN [production].[products] PP ON PP.product_id=SOI.product_id
INNER JOIN [production].[categories] PC ON PC.category_id=PP.category_id
INNER JOIN [sales].[stores] SS ON SS.store_id=SO.store_id
INNER JOIN [sales].[staffs] SF ON SF.staff_id=SO.staff_id

GROUP BY SO.order_id, CONCAT(SC.first_name, ' ' ,SC.last_name),
SC.city ,SC.state,SO.order_date,PP.product_name,PC.category_name,SS.store_name,
CONCAT(SF.first_name, ' ' ,SF.last_name)
