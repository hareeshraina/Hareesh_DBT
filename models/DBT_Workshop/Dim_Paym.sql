{{
    config(
        materialized='incremental',
        unique_key='payment_key',
        tags="Dimensionn",
         post_hook=[
        "INSERT INTO TRAINING.DBT_HSURESH.Control_table  
        select 'dim_payment',max(update_date) from dim_payment
group by 1"]
    )
}}

select seq_payment.nextval as payment_key,
cast(Paymentmethod as varchar(50)) as Paymentmethod,
cast(( {{ created_by()}} ) as varchar(50)) as  Created_by,
current_date as Created_Date,
cast(( {{ created_by()}} ) as varchar(50)) as  Updated_by,
update_date
 from {{ databasemacro(DEV) }}.DBT_HSURESH.RETAIL_DATA
 where update_date> (select max(update_date) update_date from control_table where table_name='dim_payment')
