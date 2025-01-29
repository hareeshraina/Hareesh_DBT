{{
    config(
        materialized='incremental',
        unique_key='store_key',
        tags=["Dimensionn"],
         post_hook=[
        "INSERT INTO TRAINING.DBT_HSURESH.Control_table  
        select 'dim_store',max(update_date) from dim_store
group by 1"]
    )
}}


select cast (seq_store.nextval as int) as store_key,
cast(storeid as int) storeid,
cast (storelocation as varchar(50)) as storelocation,
( {{ created_by()}} ) Created_by,
current_date as Created_Date,
( {{ created_by()}} ) as Updated_by,
 Update_Date   
from {{ source('DBT_Workshop', 'RETAIL_DATA') }}
where update_date> (select max(update_date) update_date from control_table where table_name='dim_store')