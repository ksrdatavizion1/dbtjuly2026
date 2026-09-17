{# I am  runing jinja cpde #}  -- jinja comments
-- this is if and else conditions  -- sql --
{% set env='dev' %}

Select 
    {% if env == 'prod' %}
    'Production' as Envi,
    10000 as records
    {% elif env == 'dev' %} 
    'dev' as Envi,
    100 as records
    {% else%}
    'other' as Envi,
    1000 as records
    {% endif %}