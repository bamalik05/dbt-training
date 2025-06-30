{{ config (materialized='table')}}

WITH order_summary AS (
    SELECT c.name customer_name, 
    c.email customer_email,
    c.country customer_country,
    o.order_date,
    o.status order_status,
    p.product_name,
    p.category product_category,
    o.quantity order_quantity,
    p.price product_price,
    (p.price * o.quantity) AS total_revenue,
    p.stock_quantity,
        CASE 
        WHEN p.stock_quantity < 100 THEN "Order Stock"
        ELSE "Enough Stock"
    END AS order_stock
FROM {{ ref("stg_order")}} o 
JOIN {{ ref("stg_product")}} p USING (product_id)
JOIN {{ ref("stg_customer")}} c USING (customer_id)
)

SELECT *   
FROM order_summary