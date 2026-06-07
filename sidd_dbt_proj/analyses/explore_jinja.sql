{% macro create_bronze_table(src_model,schema) %}

{# {% set table_list = ['dim_date'] %} #}

{# {% for i in table_list %} #}
    select *, current_timestamp as load_dtm
    from {{ source(schema, model) }}
{# {% endfor %} #}
{% endmacro %}