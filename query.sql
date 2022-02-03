CREATE VIEW product_summary AS
 SELECT
 product_name,
 COUNT(order_id),
 SUM(item_total) 
 FROM
 order_item_products
 GROUP BY product_name;
select * from product_summary; 
