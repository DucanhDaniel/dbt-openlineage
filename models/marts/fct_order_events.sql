{{
    config(
        materialized = 'incremental',
        unique_key = 'order_id',
        incremental_strategy= 'merge'
    )
}}


select
    order_id,
    customer_id,
    order_date,
    status
from {{
    ref('stg__orders')
}}

{% if is_incremental() %}
where order_date > coalesce((select max(order_date) from {{ this }}), '1900-01-01')
{% endif %}