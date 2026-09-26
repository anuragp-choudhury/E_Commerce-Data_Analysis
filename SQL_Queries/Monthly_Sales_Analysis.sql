USE e_commerce;

WITH monthly AS
(
    SELECT
        order_month,
        SUM(sales) AS revenue,
        SUM(profit) AS profit

    FROM vw_sales_detail
    GROUP BY order_month
),

with_previous AS
(
    SELECT
        order_month,
        revenue,
        profit,

        LAG(revenue) OVER (
            ORDER BY order_month
        ) AS previous_month_revenue

    FROM monthly
)

SELECT
    order_month,
    ROUND(revenue, 2) AS revenue,
    ROUND(profit, 2) AS profit,
    ROUND(
        100 *
        (revenue - previous_month_revenue)
        / NULLIF(previous_month_revenue, 0),
        2
    ) AS revenue_growth_pct

FROM with_previous
ORDER BY order_month;