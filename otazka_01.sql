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
