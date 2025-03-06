{% snapshot Snapshot_external %}
{{
    config(
        unique_key='CustomerID',
        strategy='check',
        check_cols=['Age','AnnualIncome'],
        tags=['external_snap'],
        schema= 'silver'    )
}}


select seq_customer.nextval as Customer_key, cast (CustomerID as int) as CustomerID,
 cast (Age as int) as Age,
  cast (Gender as varchar) as Gender,
 cast (AnnualIncome as int) as AnnualIncome,
( {{ created_by()}} ) Created_by,
current_date as Created_Date,
( {{ created_by()}} ) as Updated_by,
current_date as Updated_Date from {{ ref('stg_retaildata') }}

{% endsnapshot %}

