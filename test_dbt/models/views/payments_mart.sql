SELECT *, 
    MAX(value) OVER (PARTITION BY client_id, DATE_TRUNC('month', payment_date)) AS max_value,
    ROW_NUMBER() OVER (PARTITION BY client_id ORDER BY payment_date) AS case_number,
    SUM(value) OVER (PARTITION BY DATE_TRUNC('month', payment_date)) AS revenue
FROM {{ source('test_db', 'payments') }}
