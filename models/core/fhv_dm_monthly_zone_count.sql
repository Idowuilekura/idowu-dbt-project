WITH all_fhv_fact_trip 
    AS (
        SELECT *
        FROM {{ ref('fhv_fact_trips') }}
    )

SELECT afft.pickup_zone as revenue_zone,
date_trunc(afft.pickup_datetime,month) as pickup_month
COUNT(*) AS total_fhv_trips_monthly
GROUP BY 1

FROM all_fhv_fact_trip afft