{{
    config(
        materialized='incremental',
        unique_key='CustomerID',
        merge_update_columns=['AGE','GENDER','ANNUALINCOME','SPENDINGSCORE','PRODUCTCATEGORY','storelocation'
,'paymentMethod']
        )
}}


{%- set check_cols= ['AGE','GENDER','ANNUALINCOME','SPENDINGSCORE','PRODUCTCATEGORY','storelocation'
,'paymentMethod'] -%}


with tgt as
(select *,{{ dbt_utils.surrogate_key(check_cols)}} as cols_key from {{ databasemacro(DEV)}}.DBT_HSuresh.Incremental_logicc
 --{{ this }}
 ),
src as
(select *,{{ dbt_utils.surrogate_key(check_cols)}} as colss_key 
from  {{ databasemacro(DEV)}}.DBT_HSuresh.retail_data),
target as
(select case when tgt.customerid is null 
then seq_customer.nextval else tgt.Customer_key
end as Customer_key,tgt.cols_key ,src.*, {{ audit_column() }} from src left join tgt on src.customerid=tgt.customerid
--where tgt.customerid is null or tgt.cols_key !=src.colss_key
 )
select * from target



