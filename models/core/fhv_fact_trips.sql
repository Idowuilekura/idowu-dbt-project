{{ config(materialized='table')}}

WITH all_fhv_data AS (
    SELECT *
    FROM {{ ref('stg_fhv_tripdata')}}
), 
    dim_zones AS (
        SELECT *
        FROM {{ ref('dim_zones') }}
        where borough != 'Unknown'
    )


SELECT 
    afd.primary_key,
    afd.ispatching_base_num,
    afd.pickup_datetime,
    afd.dropoff_datetime,
    afd.SR_flag store_and_fwd_flag,
    pickup_zone.borough AS pickup_borough,
    pickup_zone.zone AS pickup_zone,
    dropoff_zone.zone AS dropoff_zone,
    dropoff_zone.borough AS dropoff_borough
    
    FROM all_fhv_data afd
    INNER JOIN dim_zones as pickup_zone 
    ON afd.pickup_locationid = pickup_zone.locationid
    INNER JOIN dim_zones as dropoff_zone 
    ON afd.dropoff_locationid = dropoff_zone.locationid
