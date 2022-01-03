with contacts as (
    select * from {{ ref('stg_hubspot_contacts')}}
), 

 customers as (
     select * from {{ ref('stg_rds_customers')}}
 )
 select * from contacts
