USE E_COMMERCE;

-- Segment Performance
SELECT
    segment,
    COUNT(DISTINCT customer_id) AS customers,
    COUNT(DISTINCT order_id) AS orders,
    ROUND(SUM(sales), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit,
    ROUND(
        SUM(sales) / COUNT(DISTINCT order_id),
        2
    ) AS average_order_value
FROM vw_sales_detail
GROUP BY segment
ORDER BY revenue DESC;

-- Top 20 Customers
SELECT
    customer_id,
    customer_name,
    segment,
    COUNT(DISTINCT order_id) AS orders,
    ROUND(SUM(sales), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit
FROM vw_sales_detail
GROUP BY
    customer_id,
    customer_name,
    segment
ORDER BY revenue DESC
LIMIT 20;

-- Acquisition Channel Performance
SELECT
    acquisition_channel,
    COUNT(DISTINCT customer_id) AS customers,
    COUNT(DISTINCT order_id) AS orders,
    ROUND(SUM(sales), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit,
    ROUND(
        100 * SUM(profit) / NULLIF(SUM(sales), 0),
        2
    ) AS profit_margin_pct
FROM vw_sales_detail
GROUP BY acquisition_channel
ORDER BY revenue DESC;
