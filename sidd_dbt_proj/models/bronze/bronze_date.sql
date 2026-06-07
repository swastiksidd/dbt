{# select * from {{ source('dbt_sch','dim_date') }} #}
{{ create_bronze_tbl_ts('dim_date', 'dbt_sch') }}