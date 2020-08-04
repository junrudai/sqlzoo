--- List all the years and the wcc for children born in each year of the data set. Only show years where the wcc was at least 7.

SELECT
    y.yr,
    SUM(wc.white) AS wcc
FROM
    (SELECT
        DISTINCT yr
    FROM hadcet) y
    CROSS JOIN (
        SELECT
            yr,
            CASE
                WHEN MIN(m12) < 0 THEN 1
                ELSE 0
            END AS white
        FROM
            hadcet
        WHERE
            dy BETWEEN 21 AND 25
            AND m12 != -999
        GROUP BY 1
        ) wc
WHERE 
    y.yr BETWEEN wc.yr + 2 AND wc.yr + 11
GROUP BY
    y.yr
HAVING wcc >= 7