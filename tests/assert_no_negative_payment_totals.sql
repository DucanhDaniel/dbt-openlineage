select order_id, total_amount
from {{ref('int_order_payments')}}
where total_amount < 0