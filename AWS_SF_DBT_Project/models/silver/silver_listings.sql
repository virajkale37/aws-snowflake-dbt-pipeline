{{ config(
    materialized = 'incremental',
    unique_key = 'LISTING_ID'
) }}

Select LISTING_ID,
       HOST_ID,
       PROPERTY_TYPE,
       ROOM_TYPE,
       CITY,
       COUNTRY,
       ACCOMMODATES,
       BEDROOMS,
       BATHROOMS,
       PRICE_PER_NIGHT,
       {{tag('PRICE_PER_NIGHT')}} AS STATUS,
       CREATED_AT
From {{ ref('bronze_listings') }}