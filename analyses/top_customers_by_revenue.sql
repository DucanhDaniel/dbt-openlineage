-- Top 10 customers by lifetime order revenue.
-- Compiled-only — not materialized, but lives in target/compiled/ and is
-- versioned alongside the rest of the project.
select
    c.customer_id,
    c.first_name,
    c.last_name,
    count(o.order_id) as order_count,
    sum(o.amount) as lifetime_revenue
from 
    {{ref('dim_customers')}} c
    left join {{ref('fct_orders')}} o on o.customer_id = c.customer_id
group by 1, 2, 3
order by lifetime_revenue desc
limit 10