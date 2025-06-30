{{ config(materialized='table') }}

WITH stg_order AS (
    SELECT
            o.order_id,
            c.customer_id,
            c.customer_name,
            p.product_id,
            p.product_name,
            o.quantity,
            o.order_date
    FROM raw.order o
    JOIN {{ ref("stg_customer") }} c USING (customer_id)
    JOIN raw.product p USING (product_id)
)

SELECT * FROM stg_order