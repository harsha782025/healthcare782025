select
    o.orderid,
    o.orderdate,
    o.customerid,
    o.employeeid,
    o.storeid,
    o.statuscd,
    o.statusdesc,
    count(distinct o.orderid) as ordercount,
    sum(oi.totalprice) as revenue,
    o.updated_at
from `dbt-gcp-468311.healthcare782025.orders_stg` o
join `dbt-gcp-468311.healthcare782025.orderitems_stg` oi on o.orderid = oi.orderid

group by
    o.orderid,
    o.orderdate,
    o.customerid,
    o.employeeid,
    o.storeid,
    o.statuscd,
    o.statusdesc,
    o.updated_at