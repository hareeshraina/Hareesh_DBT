with source as
(
    select productprice,purchaseprice,customerid from RETAIL_DATA
),
prior_sales as
(
 select customerid,productprice  from source --where datatrunc()
),
current_sales as 
(

)

select * from {{ source('DBT_Workshop', 'RETAIL_DATA') }}