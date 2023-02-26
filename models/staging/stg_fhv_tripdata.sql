{{ config(materialized='view')}}

SELECT 
    {{dbt_utils.surrogate_key(['dispatching_base_num','pickup_datetime'])}}
    as unique_key, 
    dispatching_base_num,
    CAST(pickup_datetime AS timestamp) pickup_datetime,
    CAST(dropOff_datetime AS timestamp) dropoff_datetime,
    CAST(PUlocationID as integer) pickup_location_id,
    CAST(DOlocationID as integer) dropoff_location_id,
    {{ coalesce_nulls_function('SR_FLAG') }} as SR_FLAG,
    affiliated_base_number

FROM 
    {{ source('staging','fhv_rides_non_partitioned') }}
