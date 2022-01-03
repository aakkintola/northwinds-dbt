
WITH source as ( 
    SELECT * FROM {{source('hubspot', 'contacts')}}
),
companies as (
    SELECT * FROM {{ ref('stg_hubspot_companies') }}
),
renamed as (
    SELECT 
        concat('hubspot-', replace(hubspot_id, ' ', '-')) as contact_id,
        TRANSLATE(PHONE, '(,),., ,-', '') AS phone_no_char,
        '(' || LEFT(phone_no_char, 3) || ')' || ' ' || LEFT(phone_no_char, 3) || '-' || RIGHT(phone_no_char, 4) as phone,
        first_name,
        last_name,
        concat('hubspot-', replace(business_name, ' ', '-')) as company_id
    FROM 
        source
),

adjusted as (
    SELECT
        contact_id,
        first_name,
        last_name,
        phone,
        company_id
    FROM    
        renamed
)

SELECT * FROM adjusted
