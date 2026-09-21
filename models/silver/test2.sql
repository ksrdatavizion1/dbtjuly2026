{{
    config(
        materialized='table',
        pre_hook = ["
        INSERT INTO SNOWFLAKE_DBT_DATA.SF_SCHEMA.MODEL_RUN_AUDIT (model_name, execution_time_start) VALUES ('test2', CURRENT_TIMESTAMP)
        "],
        post_hook = ["
        UPDATE SNOWFLAKE_DBT_DATA.SF_SCHEMA.MODEL_RUN_AUDIT SET execution_time_end = CURRENT_TIMESTAMP, row_count = (SELECT COUNT(*) FROM {{ this }}) WHERE model_name = 'test2' AND execution_time_end IS NULL
        "]
    )
}}

SELECT
    customer_id,
    full_name,
    email,
    gender,
    age,
    city,
    state,
    registered_on
FROM {{ source('raw_data', 'tel_cust') }}