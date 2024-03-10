SELECT *, 
    MAX(value) OVER (PARTITION BY client_id, DATE_TRUNC('month', payment_date)) AS max_value,
    ROW_NUMBER() OVER (PARTITION BY client_id ORDER BY payment_date) AS case_number,
    SUM(value) OVER (PARTITION BY DATE_TRUNC('month', payment_date)) AS revenue
FROM {{ source('test_db', 'payments') }}
/*
SELECT client_name, payment_date, value, 
       MAX(value) OVER (partition by client_name) AS max_value
FROM payments
--WHERE DATE_TRUNC('month', payment_date) = '2023-01-01'

SELECT *, ROW_NUMBER() OVER (PARTITION BY client_id ORDER BY payment_date) AS case_number 
FROM payments

SELECT DATE_TRUNC('month', payment_date) AS period, SUM(value) AS revenue
FROM payments
--GROUP BY period
*/