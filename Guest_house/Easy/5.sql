SELECT
    b.guest_id,
    COUNT(b.nights),
    SUM(b.nights)
FROM
    booking b
WHERE
    b.guest_id IN (1185, 1270)
GROUP BY
    b.guest_id
