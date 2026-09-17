{{
    config(
        materialized='table'
    )
}}

select * from {{ ref('prod_info') }} where PRODUCT_ID = 103