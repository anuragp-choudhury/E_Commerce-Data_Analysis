-- Category and Sub-category
SELECT
    category,
    subcategory,
    ROUND(SUM(sales), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit,
    SUM(quantity) AS units,
    ROUND(
        100 * SUM(profit) / NULLIF(SUM(sales), 0),
        2
    ) AS margin_pct
FROM vw_sales_detail
GROUP BY
    category,
    subcategory
ORDER BY revenue DESC;

-- Top 20 products by revenue
SELECT
    product_id,
    product_name,
    category,
    subcategory,
    ROUND(SUM(sales), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit,
    SUM(quantity) AS units
FROM vw_sales_detail
GROUP BY
    product_id,
    product_name,
    category,
    subcategory
ORDER BY revenue DESC
LIMIT 20;

-- Discount vs profitability
SELECT
    CASE
        WHEN discount = 0 THEN '0%'
        WHEN discount <= 0.10 THEN '1-10%'
        WHEN discount <= 0.20 THEN '11-20%'
        ELSE '21%+'
    END AS discount_band,
    ROUND(SUM(sales), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit,
    ROUND(
        100 * SUM(profit) / NULLIF(SUM(sales), 0),
        2
    ) AS margin_pct
FROM vw_sales_detail
GROUP BY
    CASE
    
        WHEN discount = 0 THEN '0%'
        WHEN discount <= 0.10 THEN '1-10%'
        WHEN discount <= 0.20 THEN '11-20%'
        ELSE '21%+'
    END
ORDER BY
    MIN(discount);