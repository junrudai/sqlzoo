--- Coincidence. Have two guests with the same surname ever stayed in the hotel on the evening? Show the last name and both first names. Do not include duplicates.

WITH guest2 AS (
    SELECT
        b.booking_date,
        b.nights,
        g.last_name,
        g.first_name
    FROM
        booking AS b
        INNER JOIN guest AS g ON b.guest_id = g.id
),
guest_list AS (
    SELECT DISTINCT
        g1.last_name,
        g2.first_name AS first_name_1,
        g1.first_name AS first_name_2,
        ROW_NUMBER() OVER (PARTITION BY g1.last_name ORDER BY g1.first_name) AS rk
FROM
    booking AS b
    INNER JOIN guest AS g1 ON b.guest_id = g1.id
    -- Join on same last name and exclude same first_name
        LEFT JOIN guest2 AS g2 ON g1.last_name = g2.last_name
            AND g1.first_name != g2.first_name
    WHERE
        --- g1 checkin date is within b2's stay
        b.booking_date BETWEEN g2.booking_date
        AND DATE_ADD (day, g2.nights - 1, g2.booking_date)
        -- or g2 checkout date is within b2'stay
        OR DATE_ADD (day, b.nights - 1, b.booking_date) BETWEEN g2.booking_date
        AND DATE_ADD (day, g2.nights - 1, g2.booking_date)
)
SELECT
    last_name,
    first_name_1,
    first_name_2
FROM
    guest_list
WHERE
    --- get every other row from the list
    MOD(rk,2) = 0
