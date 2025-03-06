{{
    config(
        materialized='incremental',
        unique_key='CustomerID',
        merge_update_columns=['AGE','GENDER','ANNUALINCOME','SPENDINGSCORE','PRODUCTCATEGORY','storelocation'
,'paymentMethod'],
post_hook=[
        "INSERT INTO boss_db.silver.Control_table  
        select 'Incrementall',max(update_date) from boss_db.silver.Incrementall
group by 1"]
        )
}}


{%- set check_cols= ['AGE','GENDER','ANNUALINCOME','SPENDINGSCORE','PRODUCTCATEGORY','storelocation'
,'paymentMethod'] -%}


with tgt as
(select *,{{ dbt_utils.surrogate_key(check_cols)}} as cols_key from boss_db.silver.Incrementall
 --{{ this }}
 ),
src as
(select *,{{ dbt_utils.surrogate_key(check_cols)}} as colss_key 
from  boss_db.bronze.retail_data),
target as
(select case when tgt.customerid is null 
then seq_customer.nextval else tgt.Customer_key
end as Customer_key,tgt.cols_key ,src.*, {{ audit_column() }} from src left join tgt on src.customerid=tgt.customerid
where tgt.customerid is null or tgt.cols_key !=src.colss_key
and  
 src.update_date> (select max(update_date) update_date from control_table where table_name='Incrementall')
 )
select * from target



