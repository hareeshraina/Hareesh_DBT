{% snapshot Snapshot_Check %}

{{
    config(
        unique_key='Playerid',
        strategy='check',
        check_cols=['FIRSTNAME'],
        alias='Snapshot_Check'
    )
}}

select * from {{ ref('Master_snap') }}

{% endsnapshot %}