--- For each age 1-12 show which years were a White Christmas. Show 'White Christmas' or 'No snow' for each age.
SELECT
    yr - 1811 AS age,
    CASE 
        WHEN min(m12) < 0  THEN 'White Christmas'
        ELSE 'No Snow'
    END AS white_christmas
FROM hadcet
WHERE 
    yr BETWEEN 1812 AND 1812 + 11
    AND dy BETWEEN 21 AND 25
GROUP BY 1