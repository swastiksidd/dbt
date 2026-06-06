{% test generic_non_negative_chk(model,column_name) %}

select * from {{ model }}
where {{ column_name }} < 0

{% endtest %}