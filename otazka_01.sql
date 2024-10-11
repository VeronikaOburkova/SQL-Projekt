-- 1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají? 

WITH avg_wages AS (
    SELECT
        ROUND(AVG(average_wages), 2) AS wage,
        industry,
        `year` 
    FROM t_veronika_oburkova_projekt_SQL_primary_final
    GROUP BY industry, `year`
)
SELECT
    current.industry,
    current.year,
    current.wage AS current_wage,
    previous.wage AS previous_wage,
    CASE
        WHEN current.wage > previous.wage THEN 'Růst'
        WHEN current.wage < previous.wage THEN 'Pokles'
        ELSE 'Stejně'
    END AS wage_trend
FROM avg_wages current
LEFT JOIN avg_wages previous
    ON current.industry = previous.industry
    AND current.year = previous.year + 1
WHERE previous.wage IS NOT NULL
ORDER BY current.industry, current.year;

