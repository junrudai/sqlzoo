SELECT
    g.last_name,
    g.first_name,
    g.address,
    COALESCE(SUM(nights),0)
FROM
    guest AS g
    LEFT JOIN booking AS b ON b.guest_id = g.id
WHERE
    g.address LIKE '%Edinburgh%'
GROUP BY
    g.last_name,
    g.first_name,
    g.address
ORDER BY
    g.last_name,
    g.first_name