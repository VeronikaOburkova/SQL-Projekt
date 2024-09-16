-- 1. Vytvoření tabulky t_veronika_oburkova_projekt_SQL_primary_final

CREATE TABLE IF NOT EXISTS t_veronika_oburkova_projekt_SQL_primary_final AS (
		SELECT cpc.name AS food_category, 
	   		  cp2.value AS food_price,
	   		  cp.value AS average_wages,
	   		  cp.payroll_year AS 'year',
	   		  cpib.name AS industry
		FROM czechia_price cp2 
		JOIN czechia_payroll cp 
			ON cp.payroll_year=YEAR(cp2.date_from) 
			AND cp.value_type_code = 5958 
			AND cp2.region_code IS NULL
		JOIN czechia_price_category cpc 
			ON cp2.category_code=cpc.code
		JOIN czechia_payroll_industry_branch cpib 
			ON cp.industry_branch_code=cpib.code);

-- 1. Otázka: Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

SELECT t_2006.industry,
	   ROUND(AVG(t_2006.average_wages_2006),2) AS avg_wages_2006,
	   ROUND(AVG(t_2010.average_wages_2010),2) AS avg_wages_2010,
	   ROUND(AVG(t_2018.average_wages_2018),2) AS avg_wages_2018,
CASE WHEN AVG(t_2018.average_wages_2018) > AVG(t_2010.average_wages_2010) THEN 'increase_2018'
	 WHEN AVG(t_2010.average_wages_2010) > AVG(t_2006.average_wages_2006) THEN 'increase_2010'
	 ELSE 'decrease'
	 END AS changes
FROM (
		SELECT DISTINCT industry,
						average_wages AS average_wages_2006,
						`year`
		FROM t_veronika_oburkova_projekt_SQL_primary_final
		WHERE YEAR ='2006') t_2006
LEFT JOIN (
			SELECT DISTINCT industry,
							average_wages as average_wages_2010,
							`year`
			FROM t_veronika_oburkova_projekt_SQL_primary_final
			WHERE YEAR='2010') t_2010
	ON t_2006.industry=t_2010.industry
LEFT JOIN (
			SELECT DISTINCT industry,
							average_wages as average_wages_2018,
							`year`
			FROM t_veronika_oburkova_projekt_SQL_primary_final
			WHERE YEAR='2018') t_2018
ON t_2010.industry=t_2018.industry
GROUP BY t_2006.`year`,
		 t_2006.industry;
