{{
    config(
        materialized='table',
        tags=["Extl_dim"]
    )
}}

select  customer_key,CustomerID,
Age,
Gender,
 AnnualIncome,
 Created_by,
Created_Date,
 Updated_by,
Updated_Date, {{ Flag('dbt_valid_to')}} as Flag
from  {{ ref('Snapshot_customer') }}