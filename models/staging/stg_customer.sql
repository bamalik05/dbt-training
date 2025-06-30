{{ config(materialized='table') }}

WITH stg_customer AS (
    SELECT 
        customer_id,
        CONCAT(first_name, ' ', last_name) AS customer_name,
        email,
        birthdate,
        address,
        cc,
        cc_type
    FROM raw.customer
) 
SELECT * FROM stg_customer