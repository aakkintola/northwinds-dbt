WITH source as (
    SELECT * FROM "PAGILA_INC"."NORTHWINDS_RDS_PUBLIC"."SUPPLIERS"
),

renamed_2 as (
    SELECT SUPPLIER_ID, COUNTRY, 
        SPLIT_PART(CONTACT_NAME, ' ', 1) as first_name, 
        SPLIT_PART(CONTACT_NAME, ' ', -1) as last_name,
        ADDRESS, CITY, PHONE, COMPANY_NAME, REGION, POSTAL_CODE, FAX, CONTACT_TITLE, HOMEPAGE
    FROM source
)

SELECT * FROM renamed_2