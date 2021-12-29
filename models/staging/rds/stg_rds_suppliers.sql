WITH source as (
    SELECT * FROM {{source('rds', 'suppliers')}}
)
SELECT * FROM source