{% set counts={
    'CUSTOMERS' : 50,
    'EMPLOYEES' : 20,
    'STORES' : 10,
    'SUPPLIERS' : 5,
    'PRODUCTS' : 100,
    'ORDERITEMS' : 1000,
    'ORDERS' : 200
}%}

{% for table, count in counts.items() %}
select
    '{{ table }}' as table_name,
    cnt as record_count,
    {{ count }} as ecount
from (
    select count(*) as cnt
    from {{ source('sleekmart_l1', table) }}
)
where cnt < {{ count }}
{% if not loop.last %} union all {% endif %}
{% endfor %}   