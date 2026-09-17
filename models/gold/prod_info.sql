{{
    config(
        materialized='ephemeral',
        database = 'DBT_LAB_NEW'
    )
}}

Select * from {{ ref('Product_info') }} 