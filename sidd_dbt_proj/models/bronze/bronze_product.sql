{{ config( materialized = 'view' ) }}

{# select * from {{ source('dbt_sch','dim_product') }} #}
{{ create_bronze_tbl_ts('dim_product', 'dbt_sch') }}