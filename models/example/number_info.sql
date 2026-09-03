{{
    config(
        materialized='table'
    )
}}
-- jinja temple for configuration things inside dbt 
Select 123 as col1
union 
Select 567 as col1
