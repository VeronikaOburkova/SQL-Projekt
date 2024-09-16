-- t_veronika_oburkova_projekt_SQL_primary_final
-- Otázka 4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
WITH t_year AS (
      SELECT AVG(average_wages) AS avg_wages_year,
      		 AVG(food_price) AS avg_price_year,
    	     YEAR  
      FROM t_veronika_oburkova_projekt_SQL_primary_final
      WHERE food_price IS NOT NULL 
    	    AND average_wages IS NOT NULL
      GROUP BY YEAR),
    t_prev_year AS(
       SELECT AVG(average_wages) AS avg_wages_prev_year,
      		  AVG(food_price) AS avg_price_prev_year,
    		  YEAR+1 AS prev_year
      FROM t_veronika_oburkova_projekt_SQL_primary_final
      WHERE food_price IS NOT null
      		AND average_wages IS NOT NULL
      GROUP BY prev_year)
SELECT t_year.YEAR,
		prev_year,
		ROUND((avg_price_year - avg_price_prev_year)/avg_price_year * 100,2) AS price_grow_percent,
		ROUND((avg_wages_year - avg_wages_prev_year)/avg_wages_year * 100,2) AS wages_grow_percent,
CASE WHEN (avg_price_year - avg_price_prev_year)/avg_price_year * 100 - (avg_wages_year - avg_wages_prev_year)/avg_wages_year * 100 >10 THEN 'above 10'
	 ELSE 'below 10'
	 END AS grow
FROM t_year 
JOIN t_prev_year 
	ON t_year.YEAR=t_prev_year.prev_year;