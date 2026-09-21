{% macro generate_schema_name(custom_schema_name, node) %}
    {{ return(custom_schema_name if custom_schema_name is not none else target.schema) }}
{% endmacro %}

{% macro cal_end_date(date1, num_days) %}
    DATEADD(day, {{num_days}},  {{date1}})
{% endmacro %}

{% macro mask_mobile(mobile_column) %}
    CONCAT('XXXXXXX', RIGHT({{ mobile_column }}, 3))
{% endmacro %}

{% macro age_category(age_column) %}
    CASE
        WHEN {{ age_column }} < 30 THEN 'Young'
        WHEN {{ age_column }} BETWEEN 30 AND 45 THEN 'Mid'
        ELSE 'Senior'
    END
{% endmacro %}

{% macro is_valid_email(email_column) %}
    REGEXP_LIKE({{ email_column }}, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$')
{% endmacro %}


{% macro standardize_state(state_column) %}
    INITCAP({{ state_column }})
{% endmacro %}


{% macro filter_telecom_data(customers_table, plans_table) %}
    SELECT 
        c.customer_id,
        c.full_name,
        c.state,
        p.plan_name,
        p.plan_type,
        p.price
    FROM {{ var("database_name") }}.{{ var("schema_name") }}.{{ customers_table }} c
    JOIN {{ var("database_name") }}.{{ var("schema_name") }}.{{ plans_table }} p
        ON c.customer_id = p.customer_id
    WHERE c.state = '{{ var("customer_state") }}'
      AND p.plan_type = '{{ var("plan_type") }}'
{% endmacro %}