{% set username='ksradmin222' %}  -- value
{% set env='dev' %}
{% set int_var=5 %}
{% set float_int=20.55 %}
{% set bol=False %}
-- string , int, float, boolean
{% set username2='ksradmin' %}  -- value
{% set env='dev' %}

Select '{{username}}' as username,
        '{{env}}' as env,
        {{int_var}} as int_var,
        {{float_int}} as float_int,
        {{bol}} as Bol


