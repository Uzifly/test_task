SELECT md.department, SUM(pm.value)
FROM {{ ref("payments_mart") }} AS pm JOIN (SELECT * FROM {{ ref("departments") }}) AS md ON pm.manager_email = md.email
GROUP BY md.department