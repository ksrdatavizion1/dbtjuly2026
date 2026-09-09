{{
    config(
        on_schema_change = 'sync_all_columns',
        query_tag = 'dbt'
    )
}}

SELECT
 *,
    CASE
        WHEN amount > 200 THEN 20
        WHEN amount > 100 THEN 10
        ELSE 0
    END AS discount
from {{ source('raw_data', 'ord') }}

-- {% if is_incremental() %}

-- where order_date >= dateadd(day,-3, current_date)
    
-- {% endif %}