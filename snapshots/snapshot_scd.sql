{% snapshot snapshot_dbt_scd2_supply_chain %}
    {{
        config(
            target_schema='SILVER_SCH',
            target_database='DBT_LABS',
            query_tag = 'scd_dbt',
            unique_key='ORDER_ID',
            strategy='check',
            check_cols= ["SUPPLIER_NAME", "PRODUCT_NAME", "QUANTITY", "UNIT_COST", "TOTAL_COST", "STATUS", "DELIVERY_DATE"] 
        )
    }}

    select * from {{ source('raw_data', 'scd_table') }}
 {% endsnapshot %}