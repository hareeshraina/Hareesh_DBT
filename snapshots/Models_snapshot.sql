{% snapshot Hareesh_snapshot %}

{{
    config(
        unique_key='Playerid',
        strategy='check',
        check_cols=['FIRSTNAME'],
    )
}}

select * from {{ ref('Master_snap') }}

{% endsnapshot %}