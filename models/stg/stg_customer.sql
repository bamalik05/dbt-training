WITH stg_customer AS (
    SELECT *
    FROM raw.customer
)

SELECT * FROM stg_customer