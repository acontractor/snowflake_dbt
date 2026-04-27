WITH CTE AS (
    select
    TO_TIMESTAMP(STARTED_AT) AS STARTED_AT,
    DATE(TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT,
    HOUR(TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,

    {{ getDayType("STARTED_AT") }} AS DAY_TYPE,

    {{ getStationOfYear("STARTED_AT") }} AS STATION_OF_YEAR

    from {{ ref('stage_bike') }}
    where STARTED_AT != 'started_at' 
    and STARTED_AT != '"started_at"'
)

select * from CTE