with 
orders as (
    select * FROM {{ ref('stg_orders')}}
)
, payments as (
    select 
        order_id,
        sum(case when status = 'success' then amount end) as amount
     from {{ ref('stg_payments')}}
     GROUP BY 1
) 


SELECT
    orders.order_id,
    orders.customer_id,
    order_date,
    coalesce(payments.amount,0) as amount

FROM
    orders 
    LEFT JOIN payments on payments.order_id = orders.order_id
