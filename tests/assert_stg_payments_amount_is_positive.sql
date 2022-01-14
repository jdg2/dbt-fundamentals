with
payments as (
    select * from {{ ref('stg_payments')}}
)

select 
    order_id,
    sum(amount) as total_amount
FROM 
    payments
GROUP BY order_id
HAVING total_amount < 0