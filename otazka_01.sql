-- 1. Otázka: Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

SELECT
	ROUND(AVG(average_wages), 2) AS wage,
	industry,
	`year` 
FROM t_veronika_oburkova_projekt_SQL_primary_final AS tvopspf
group by industry, `year`;
