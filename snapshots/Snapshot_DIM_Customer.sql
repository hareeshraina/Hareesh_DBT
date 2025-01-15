{% snapshot Snapshot_DIM_Customer %}
{{
    config(
        unique_key='CustomerID',
        strategy='check',
        check_cols=['Age','AnnualIncome'],
        tags=['Dimension_SCD']
    )
}}


select seq_customer.nextval as Customer_key, cast (CustomerID as int) as CustomerID,
 cast (Age as int) as Age,
  cast (Gender as varchar) as Gender,
 cast (AnnualIncome as int) as AnnualIncome,
( {{ created_by()}} ) Created_by,
current_date as Created_Date,
( {{ created_by()}} ) as Updated_by,
current_date as Updated_Date from {{ source('DBT_Workshop', 'RETAIL_DATA') }}

{% endsnapshot %}

