{% snapshot Snapshot_timestamp %}

{{
    config(
        unique_key='Playerid',
        strategy='timestamp',
        updated_at='valid_to',
        alias='Snapshot_timstamp'
    )
}}


select playerid,firstname,lastname,namegiven,namenick,height,weight,current_timestamp as valid_to from 
TRAINING.DBT_HSURESH.Snapshot_check

{% endsnapshot %}