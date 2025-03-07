{{
    config(
        materialized='incremental',
        unique_key='payment_key',
        tags="extl_int"
    )
}}

select seq_payment.nextval as payment_key,
cast(Paymentmethod as varchar(50)) as Paymentmethod,
{{ audit_column()}}
 from {{ ref('stg_retaildata') }}
