SELECT
    orderid as order_id,
    paymentmethod as payment_method,
    status,
    amount / 100 as amount,
    cast(created as DATE) as created_date
FROM
    {{ source('stripe', 'payment')}}
