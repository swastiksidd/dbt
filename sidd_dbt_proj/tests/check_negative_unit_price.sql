select * from
{{ ref("bronze_sales") }}
where
unit_price < 0