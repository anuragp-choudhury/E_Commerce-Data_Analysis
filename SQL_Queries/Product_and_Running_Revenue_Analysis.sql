USE E_COMMERCE;

-- TOP 5 PRODUCTS WITHIN EACH CATEGORY

WITH product_sales AS
(
    SELECT
        category,
        product_id,
        product_name,

        SUM(sales) AS revenue

    FROM vw_sales_detail

    GROUP BY
        category,
        product_id,
        product_name
),

ranked_products AS
(
    SELECT
        category,
        product_id,
        product_name,
        revenue,

        RANK() OVER (
            PARTITION BY category
            ORDER BY revenue DESC
        ) AS category_rank

    FROM product_sales
)

SELECT
    category,
    product_id,
    product_name,
    ROUND(revenue, 2) AS revenue,
    category_rank

FROM ranked_products

WHERE category_rank <= 5

ORDER BY
    category,
    category_rank;
    
    
-- Running revenue

SELECT
    order_month,
    ROUND(SUM(sales), 2) AS monthly_revenue,
    ROUND(
        SUM(SUM(sales)) OVER (
            ORDER BY order_month
        ),
        2
    ) AS cumulative_revenue

FROM vw_sales_detail
GROUP BY order_month
ORDER BY order_month;