SELECT client_name, payment_date, value
FROM {{ ref("payments_mart") }}
WHERE DATE_TRUNC('month', payment_date) = '2023-01-01' AND value = max_value