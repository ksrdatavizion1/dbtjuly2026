{{
    config(
        materialized='table',
        database = 'DBT_LAB_NEW'
    )
}}

Select * from {{ ref('Product_info') }} where PRODUCT_ID = 103