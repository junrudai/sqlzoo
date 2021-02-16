SELECT
    b.booking_id,
    b.room_type_requested,
    b.occupants,
    r.amount
FROM
    booking b
    LEFT JOIN rate r ON b.room_type_requested = r.room_type
        AND b.occupants = r.occupancy
WHERE
    b.booking_id IN (5152, 5154, 5165, 5295)
