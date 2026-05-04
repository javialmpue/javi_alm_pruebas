{% snapshot user_snapshot_s_timestamp %}

{{
    config(
      target_schema='snapshots',
      unique_key='DNI',
      strategy='timestamp',
      updated_at='FECHA_ALTA_SISTEMA',
      hard_deletes=True
    )
}}

select * from {{ source('google', 'user') }} 

{% endsnapshot %}