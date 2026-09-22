{%  test valid_email_format(model, column_name)%}

{{
    config(
        severity='warn'
    )
}}
SELECT * FROM {{model}}
Where {{column_name}} not like '%@%.%'

{% endtest %}

