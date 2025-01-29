select 
 seq_customer.nextval 
 as Customer_key ,*, {{ audit_column() }} from {{ source('DBT_Workshop', 'RETAIL_DATA') }} src