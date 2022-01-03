WITH source as ( 
    SELECT * FROM {{source('hubspot', 'contacts')}}
),

renamed as (
    SELECT 
        'hubspot-' || business_name as company_id,
        business_name
    FROM
        source
    GROUP BY business_name
)

SELECT * FROM renamed
