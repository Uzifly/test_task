SELECT *, SUM(revenue) OVER (ORDER BY payment_month) AS revenue_cumulative
FROM(SELECT DATE_TRUNC('month', payment_date) as payment_month, first_value(revenue) AS revenue
     FROM {{ ref("payments_mart") }}
     GROUP BY payment_month)
