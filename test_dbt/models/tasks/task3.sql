                SELECT id, value, client_id, client_name, payment_date, manager_name, manager_email, 
                case WHEN case_number = 1 THEN 'Новый'
                     WHEN case_number > 1 THEN 'Действующий' END AS client_status
                FROM
                    (SELECT * FROM {{ ref("payments_mart") }})