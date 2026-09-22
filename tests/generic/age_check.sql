{% test value_range(model, column_name, min_val, max_val)%}

Select {{column_name}} from {{model}}
where {{column_name}} < {{min_val}} or 
{{column_name}} > {{max_val}}
OR {{column_name}} is NULL

{% endtest%}

-- 10 to 100