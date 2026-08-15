CREATE OR REPLACE TABLE F1_DATA.PUBLIC.FACT_PIT_STOP_DATA AS

WITH weather_agg AS (
    SELECT
        NAME,
        AVG(TEMPERATURE)    AS AVG_TEMPERATURE,
        MIN(TEMPERATURE)    AS MIN_TEMPERATURE,
        MAX(TEMPERATURE)    AS MAX_TEMPERATURE,
        SUM(PRECIPITATION)  AS TOTAL_PRECIPITATION,
        AVG(WINDSPEED)      AS AVG_WINDSPEED,
        MAX(WINDSPEED)      AS MAX_WINDSPEED
    FROM F1_DATA.PUBLIC.WEATHER_FEATURES
    GROUP BY NAME
),

pit_stop_agg AS (
    SELECT
        RACEID,
        DRIVERID,
        COUNT(STOP)         AS NUM_PIT_STOPS,
        MIN(MILLISECONDS)   AS FASTEST_PIT_STOP_MS,
        MAX(MILLISECONDS)   AS SLOWEST_PIT_STOP_MS,
        AVG(MILLISECONDS)   AS AVG_PIT_STOP_MS
    FROM F1_DATA.PUBLIC.PIT_STOPS
    GROUP BY RACEID, DRIVERID
)

SELECT
    -- Race identifiers
    r.RACEID,
    r.YEAR,
    r.ROUND,
    r.NAME                              AS RACE_NAME,
    r.DATE                              AS RACE_DATE,

    -- Driver / constructor
    sr.DRIVERID                         AS DRIVER_ID,
    sr.CONSTRUCTORID                    AS CONSTRUCTOR_ID,

    -- Pit stop metrics
    COALESCE(ps.NUM_PIT_STOPS, 0)       AS NUM_PIT_STOPS,
    ps.FASTEST_PIT_STOP_MS,
    ps.SLOWEST_PIT_STOP_MS,
    ps.AVG_PIT_STOP_MS,

    -- Sprint result metrics
    sr.GRID                             AS SPRINT_GRID,
    sr.POSITION                         AS SPRINT_POSITION,
    sr.POSITIONTEXT                     AS SPRINT_POSITION_TEXT,
    sr.POSITIONORDER                    AS SPRINT_POSITION_ORDER,
    sr.POINTS                           AS SPRINT_POINTS,
    sr.LAPS                             AS SPRINT_LAPS,
    sr.TIME                             AS SPRINT_TIME,
    sr.MILLISECONDS                     AS SPRINT_MILLISECONDS,
    sr.FASTESTLAP                       AS SPRINT_FASTEST_LAP,
    sr.FASTESTLAPTIME                   AS SPRINT_FASTEST_LAP_TIME,
    sr.STATUSID                         AS SPRINT_STATUS_ID,

    -- Weather conditions (aggregated per race)
    w.AVG_TEMPERATURE,
    w.MIN_TEMPERATURE,
    w.MAX_TEMPERATURE,
    w.TOTAL_PRECIPITATION,
    w.AVG_WINDSPEED,
    w.MAX_WINDSPEED

FROM F1_DATA.PUBLIC.RACES r
LEFT JOIN weather_agg w
    ON r.NAME = w.NAME
LEFT JOIN F1_DATA.PUBLIC.SPRINT_RESULTS sr
    ON r.RACEID = sr.RACEID
LEFT JOIN pit_stop_agg ps
    ON sr.RACEID = ps.RACEID
   AND sr.DRIVERID = ps.DRIVERID;
