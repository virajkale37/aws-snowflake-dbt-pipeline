{{
  config(
    severity = 'warn',
    )
}}

Select 1 From {{ source('staging', 'listings') }}
Where LISTING_ID is not null