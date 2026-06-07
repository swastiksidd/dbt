{% set distinct_category = dbt_utils.get_column_values(table=ref('combined_store_data'), column="REPLACE(category, ' ', '_')") %}

SELECT
    department,
    {{ dbt_utils.pivot(
        column='category',
        values= distinct_category,
        agg='sum',
        then_value='net_amount',
        else_value=0
    ) }}
    
FROM {{ ref('combined_store_data') }}
GROUP BY department