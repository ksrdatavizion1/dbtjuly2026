{{
    config(
        query_tag='DBT',
        schema = 'RAW_SCHEMA'
    )
}}

SELECT
    CUSTOMER_ID as CUSTID, FIRST_NAME,LAST_NAME,EMAIL,PHONE AS PHN_NUMBER,CITY,STATE
FROM {{ source('raw_data', 'Cust') }}  -- jinja
where City = 'Delhi'