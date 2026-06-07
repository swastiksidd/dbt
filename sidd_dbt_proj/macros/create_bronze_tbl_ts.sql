{% macro create_bronze_tbl_ts(src_model,schema,filter_condition) %}

    select *, 
    current_timestamp as load_dtm,
    current_user as load_user
    from {{ source(schema, src_model) }}
    {% if filter_condition %}
    where {{ filter_condition }}
    {% endif %}
    
{% endmacro %}