select orderid
FROM {{ref('orders_fact')}}
where revenue <0