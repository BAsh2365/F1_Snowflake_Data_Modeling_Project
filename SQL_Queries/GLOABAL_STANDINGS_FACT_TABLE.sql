CREATE OR REPLACE TABLE F1_DATA.PUBLIC.GLOBAL_STANDINGS AS

-- Use a CTE to clean headers for DRIVERS table
WITH CLEAN_DRIVERS AS (
    SELECT
        TRY_CAST(DRIVERID AS NUMBER)                  AS DRIVER_ID,
        DRIVERREF                                     AS DRIVER_REF,
        CONCAT(DRIVER_FORENAME, ' ', DRIVER_SURNAME)  AS DRIVER_NAME
    FROM F1_DATA.PUBLIC.DRIVERS
    WHERE TRY_CAST(DRIVERID AS NUMBER) IS NOT NULL
)

SELECT
    -- Driver identity columns
    d.DRIVER_ID,
    d.DRIVER_REF,
    d.DRIVER_NAME,

    -- Race info from RACES table
    ra.RACEID               AS RACE_ID,
    ra.NAME                 AS RACE_NAME,
    ra.YEAR                 AS RACE_YEAR,

    -- Standings info from DRIVER_STANDINGS table
    ds.POINTS               AS STANDING_POINTS,
    ds.POSITION             AS STANDING_POSITION,
    ds.WINS                 AS STANDING_WINS,

    -- Race result info from RESULTS table
    r.POSITION              AS RACE_FINISH_POSITION,
    r.POINTS                AS RACE_POINTS,
    r.GRID                  AS GRID_POSITION,
    r.FASTESTLAP            AS FASTEST_LAP,
    r.FASTESTLAPTIME        AS FASTEST_LAP_TIME,
    r.FASTESTLAPSPEED       AS FASTEST_LAP_SPEED

FROM CLEAN_DRIVERS d

-- Join DRIVER_STANDINGS on DRIVER_ID
JOIN F1_DATA.PUBLIC.DRIVER_STANDINGS ds
    ON d.DRIVER_ID = ds.DRIVERID

-- Join RACES on RACE_ID from DRIVER_STANDINGS
JOIN F1_DATA.PUBLIC.RACES ra
    ON ds.RACEID = ra.RACEID

-- Join RESULTS on both DRIVER_ID and RACE_ID
LEFT JOIN F1_DATA.PUBLIC.RESULTS r
    ON ds.DRIVERID = r.DRIVERID
    AND ds.RACEID = r.RACEID;

