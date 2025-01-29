{{
    config(
        materialized='incremental',
        unique_key='Product_key',
        tags=["Dimensionn"],
         post_hook=[
        "INSERT INTO TRAINING.DBT_HSURESH.Control_table  
        select 'dim_product',max(update_date) from Dim_Product
group by 1"]
    )
}}

select seq_product.nextval as Product_key,
cast(productcategory as varchar(50)) as productcategory,
cast(( {{ created_by()}} ) as varchar(50)) as  Created_by,
current_date as Created_Date,
cast(( {{ created_by()}} ) as varchar(50)) as  Updated_by,
 Update_Date 
 from {{ source('DBT_Workshop', 'RETAIL_DATA') }}
  where update_date> (select max(update_date) update_date from control_table where table_name='dim_product')


  