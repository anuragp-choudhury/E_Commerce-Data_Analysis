-- Data-quality checks and a reusable analytical view.

USE E_COMMERCE;

SELECT COUNT(*) AS order_rows,
       COUNT(DISTINCT order_id) AS unique_orders,
       COUNT(DISTINCT customer_id) AS unique_customers,
       COUNT(DISTINCT product_id) AS unique_products
FROM order_items;

SELECT
    SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS null_order_ids,
    SUM(CASE WHEN order_date IS NULL THEN 1 ELSE 0 END) AS null_dates,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_customers,
    SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS null_products,
    SUM(CASE WHEN sales < 0 THEN 1 ELSE 0 END) AS negative_sales,
    SUM(CASE WHEN quantity <= 0 THEN 1 ELSE 0 END) AS invalid_quantity
FROM order_items;

DROP VIEW IF EXISTS vw_sales_detail;

CREATE VIEW vw_sales_detail AS
SELECT
    o.order_id,
    o.order_date,
    DATE_FORMAT(o.order_date, '%Y-%m') AS order_month,
    o.customer_id,
    c.customer_name,
    c.segment,
    c.state,
    c.city,
    c.acquisition_channel,
    o.product_id,
    p.product_name,
    p.category,
    p.subcategory,
    o.quantity,
    o.unit_price,
    o.discount,
    o.sales,
    o.profit,
    ROUND(
        o.profit / NULLIF(o.sales, 0),
        4
    ) AS profit_margin,
    o.shipping_mode,
    o.payment_method
FROM order_items AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN products AS p
    ON o.product_id = p.product_id;
    
-- SELECT *
-- FROM vw_sales_detail
-- LIMIT 10;