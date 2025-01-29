{{
    config(
        materialized='table',
        tags=["Dimensionn"]
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
from  {{ ref('Snapshot_DIM_Customer') }}