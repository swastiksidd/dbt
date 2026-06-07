with brnz_sales as (
    select * from {{ ref('bronze_sales') }}
),
brnz_customer as (
    select * from {{ ref('bronze_customer') }}
),
brnz_product as (
    select * from {{ ref('bronze_product') }}
),
brnz_store as (
    select * from {{ ref('bronze_store') }}
),
brnz_returns as (
    select * from {{ ref('bronze_returns') }}
)
select 
    s.sales_id,
    s.quantity,
    s.unit_price,
    s.gross_amount,
    s.discount_amount,
    s.net_amount,
    s.payment_method,
    br.return_reason,
    br.refund_amount,
    concat(c.first_name, ' ', c.last_name) as customer_name,
    c.gender,
    c.loyalty_tier,
    p.product_name,
    p.department,
    p.category,
    p.list_price,
    st.store_name,
    st.city as store_city,
    st.country as store_country,
    s.load_dtm,
    s.load_user
from brnz_sales s
left join brnz_returns br on s.sales_id = br.sales_id
left join brnz_customer c on s.customer_sk = c.customer_sk
left join brnz_product p on s.product_sk = p.product_sk
left join brnz_store st on s.store_sk = st.store_sk