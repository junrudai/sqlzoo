SELECT
    SUM(b.nights * r.amount) AS total_amount
FROM
    booking b
    JOIN rate r ON r.room_type = b.room_type_requested　AND b.occupants = r.occupancy
    LEFT JOIN guest g ON b.guest_id = g.id
WHERE
    g.first_name = 'Ruth'
    AND g.last_name = 'Cadbury'
