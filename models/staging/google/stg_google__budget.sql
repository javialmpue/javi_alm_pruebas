{{ config(
    materialized = 'table',
    tag = ['silver']
)}}


with source as (

    select * 
    from {{ source('google', 'budget') }}

),

renamed as (

    select
        _row,
        quantity,
        cast(month as date) as budget_month,
        product_id,
        _fivetran_synced

    from source

)

select * from renamed