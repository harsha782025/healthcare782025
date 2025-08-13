{{ dbt_utils.deduplicate(
    relation=source('sleekmart_l1', 'ORDERITEMS'), 
    partition_by='orderid',
    order_by="UPDATED_AT desc",
   )
}}