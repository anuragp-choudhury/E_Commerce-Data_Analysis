-- States with high revenue but below overall margin

USE e_commerce;

WITH state_performance AS
(
    SELECT
        state,
        SUM(sales) AS revenue,
        SUM(profit) AS profit,
        SUM(profit) /
        NULLIF(SUM(sales), 0) AS margin

    FROM vw_sales_detail
    GROUP BY state
),

overall_performance AS
(
    SELECT
        SUM(profit) /
        NULLIF(SUM(sales), 0) AS overall_margin

    FROM vw_sales_detail
)

SELECT
    sp.state,
    ROUND(sp.revenue, 2) AS revenue,
    ROUND(sp.profit, 2) AS profit,
    ROUND(
        100 * sp.margin,
        2
    ) AS margin_pct

FROM state_performance AS sp
CROSS JOIN overall_performance AS op
WHERE sp.margin < op.overall_margin
ORDER BY sp.revenue DESC;


-- First-order vs returning-order activity

WITH first_order AS
(
    SELECT
        customer_id,
        MIN(order_date) AS first_order_date

    FROM vw_sales_detail
    GROUP BY customer_id
)

SELECT
    CASE
        WHEN v.order_date = f.first_order_date
            THEN 'First Order'
        ELSE 'Returning Order'
    END AS customer_order_type,

    COUNT(DISTINCT v.order_id) AS orders,
    ROUND(SUM(v.sales), 2) AS revenue,
    ROUND(SUM(v.profit), 2) AS profit

FROM vw_sales_detail AS v

INNER JOIN first_order AS f
    ON v.customer_id = f.customer_id

GROUP BY
    CASE
        WHEN v.order_date = f.first_order_date
            THEN 'First Order'
        ELSE 'Returning Order'
    END;
    

-- Monthly category mix

WITH monthly_category AS
(
    SELECT
        order_month,
        category,
        SUM(sales) AS revenue

    FROM vw_sales_detail
    GROUP BY
        order_month,
        category
)

SELECT
    order_month,
    category,
    ROUND(revenue, 2) AS revenue,
    ROUND(
        100 * revenue /
        NULLIF(
            SUM(revenue) OVER (
                PARTITION BY order_month
            ),
            0
        ),
        2
    ) AS monthly_mix_pct

FROM monthly_category
ORDER BY
    order_month,
    revenue DESC;
