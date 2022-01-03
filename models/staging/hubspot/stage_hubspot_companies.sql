WITH source as ( 
    SELECT * FROM {{source('hubspot', 'contacts')}}
),

renamed as (
    SELECT 
        concat('hubspot-', replace(business_name, ' ', '-')) as company_id,
        business_name
    FROM
        source
    group by business_name
)

SELECT * FROM renamed
