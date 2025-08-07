{{ config(materialized="view") }}
select name, age, gender, blood_type, medical_condition
from `dbt-gcp-468311.healthcare782025.healthcare782025`
where admission_type in ('Urgent', 'Emergency')
