select 
    o.order_id,
    o.customer_id,
    c.first_name,
    c.last_name,
    o.order_date,
    o.status,
    coalesce(p.total_amount, 0) as amount,
    coalesce(p.payment_count, 0) as payment_count
from {{ ref('stg__orders') }} o
left join {{ ref('stg__customers') }}       c on o.customer_id = c.customer_id
left join {{ ref('int_order_payments') }}   p on o.order_id = p.order_id