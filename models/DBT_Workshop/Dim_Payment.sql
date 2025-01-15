

select seq_product.nextval as payment_key,
cast(Paymentmethod as varchar(50)) as Paymentmethod,
cast(( {{ created_by()}} ) as varchar(50)) as  Created_by,
current_date as Created_Date,
cast(( {{ created_by()}} ) as varchar(50)) as  Updated_by,
current_date as Updated_Date 
 from {{ source('DBT_Workshop', 'RETAIL_DATA') }}