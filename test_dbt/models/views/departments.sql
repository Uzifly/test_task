SELECT replaceOne(email, '.', '') AS email, 
       COALESCE(department, 'Отдел не определен') AS department 
FROM {{ source('test_db', 'manager_departments') }}