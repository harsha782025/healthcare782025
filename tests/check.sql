{% set counts={
    'CUSTOMERS' : 50,
    'EMPLOYEES' : 20,
    'STORES' : 10,
    'SUPPLIERS' : 5,
    'PRODUCT' : 100,
    'ORDERITEMS' : 1000,
    'ORDERS' : 200
}%}

{% for table,count in counts.items()%}
    select '{{table}}'as table_name,
        (select count(*) from {{ source('sleekmart_l1', table)}}) as record_count,
        {{ count }} as ecount
    where (select count(*) from {{ source('sleekmart_l1', table)}}) < {{count}}    
    {% if not loop.last %} union all {% endif%}
{%endfor%}    