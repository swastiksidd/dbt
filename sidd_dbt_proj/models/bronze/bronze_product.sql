{{ config( materialized = 'view' ) }}

select * from {{ source('dbt_sch','dim_product') }}