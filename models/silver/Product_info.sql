{{
    config(
        query_tag='dbt'
    )
}}

SELECT
   c.CUSTID, c.FIRST_NAME,c.LAST_NAME,
    p.PRODUCT_ID,
    p.PRODUCT_NAME,
    p.CATEGORY,
    p.PRICE,
    p.PURCHASE_DATE
FROM {{ ref('customer') }} c
JOIN {{ source('prod_data', 'prod') }} p
    ON c.CUSTID = p.CUSTOMER_ID
