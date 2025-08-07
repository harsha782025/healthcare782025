{{ config(materialized="table") }}
select product_id, brand_name, manufacturer
from `dbt-gcp-468311.healthcare782025.healthproduct782025`
where price_inr > 200
order by 1
