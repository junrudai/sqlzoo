SELECT
    booking_date,
    COUNT(DISTINCT booking_id)
FROM
    booking
WHERE
    booking_date BETWEEN '2016-11-25'
    AND DATEADD (day, 6, '2016-11-25')
GROUP BY
    booking_date
ORDER BY
    booking_date
