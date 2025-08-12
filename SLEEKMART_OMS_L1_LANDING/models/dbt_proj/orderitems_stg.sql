{{ config(
    materialized="table"       
) }}

select
    orderitemid,
    orderid,
    productid,
    quantity,
    unitprice,
    quantity * unitprice as totalprice,
    updated_at
from {{ source("sleekmart_l1", "ORDERITEMS") }}
