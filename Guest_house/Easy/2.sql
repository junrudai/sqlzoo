SELECT
    b.arrival_time,
    g.first_name,
    g.last_name
FROM
    booking AS b
    LEFT JOIN guest AS g ON b.guest_id = g.id
WHERE
    b.booking_date = '2016-11-05'
ORDER BY
    b.arrival_time
