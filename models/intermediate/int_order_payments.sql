{{
  config(
    materialized = 'table'
    )
}}

select
    order_id,
    COUNT(*) as payment_count,
    SUM(amount) as total_amount
from {{
    ref("stg__payments")
}}
group by order_id