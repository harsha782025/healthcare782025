{# this is sample jinja code for pratice#}
{% set max_number = 10 %}
{% for i in range(max_number) %}
    select {{ i }} as number
    {% if not loop.last %}
        union
    {% endif %}
{% endfor %}
