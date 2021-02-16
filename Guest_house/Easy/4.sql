SELECT
    first_name,
    last_name,
    address
FROM
    booking b
    LEFT JOIN guest g ON b.guest_id = g.id
WHERE
    room_no = 101
    AND booking_date = '2016-12-03'
