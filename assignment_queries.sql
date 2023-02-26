-- query for question one 
SELECT COUNT(pickup_datetime) FROM `idowudata.dbt_iilekura.fact_trips`
WHERE CAST(pickup_datetime AS DATE) BETWEEN '2019-01-01' AND '2020-12-31';

-- query for question three
SELECT COUNT(pickup_datetime) FROM `idowudata.dbt_iilekura.stg_fhv_tripdata`;

-- query for question 4
SELECT COUNT(pickup_datetime) FROM `idowudata.dbt_iilekura.fhv_fact_trips`;
