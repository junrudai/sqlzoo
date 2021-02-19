-- Be careful on the edge case: Null value in the extra
SELECT
    r.amount * nights + COALESCE(e.amount, 0) AS sum_amount
FROM
    booking AS b
    JOIN rate AS r ON r.room_type = b.room_type_requested
        AND r.occupancy = b.occupants
    LEFT JOIN (
        SELECT
            booking_id,
            SUM(amount) AS amount
        FROM
            extra
        WHERE booking_id = 5346
        GROUP BY
            booking_id) AS e ON e.booking_id=b.booking_id
WHERE
    b.booking_id = 5346
