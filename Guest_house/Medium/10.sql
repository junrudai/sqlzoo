-- Attention on the date calculation, whether it's inclusive or not
SELECT
    SUM(occupants)
FROM
    booking AS b
WHERE
    b.booking_date <= '2016-11-21'
    AND DATEADD (day, nights - 1, b.booking_date) >= '2016-11-21'
