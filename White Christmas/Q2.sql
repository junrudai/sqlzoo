--- Q2 Show the twelve temperatures.
SELECT
    yr - 1811 AS age,
    m12/10 AS temp_christmas
FROM hadcet
WHERE yr BETWEEN 1812 AND 1812+11 AND dy = 25