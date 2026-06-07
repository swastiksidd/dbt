{# select * from {{ source('dbt_sch','fact_returns') }} #}
{{ create_bronze_tbl_ts('fact_returns', 'dbt_sch') }}