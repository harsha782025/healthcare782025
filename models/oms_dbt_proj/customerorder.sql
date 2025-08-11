{{ config(materialized="table") }}

with
    customerorder as (
        select
            c.customerid,
            concat(c.firstname, ' ', c.lastname) as customername,
            count(o.orderid) as ordercount
        from {{ source("sleekmart_l1", "CUSTOMERS") }} c
        join {{ source("sleekmart_l1", "ORDERS") }} o on c.customerid = o.customerid
        group by c.customerid, customername
        order by ordercount desc
    )

select customerid, customername, ordercount
from customerorder
