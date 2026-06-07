{# select * from {{ source('dbt_sch','dim_customer') }} #}
{{ create_bronze_tbl_ts('dim_customer', 'dbt_sch') }}