
-- Use the `ref` function to select from other models
{{
    config(
        materialized='table',
        query_tag = 'DBT'
    )
}}
select *
from DBT_LABS.DBT_.number_info  -- jinja
where col1 = 123
union 
select 1000 as col1
