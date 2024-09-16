-- otázka 5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, 
-- projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?

-- vytvoření pomocného view v_vo_view05, kde jsem si vybrala data pouze pro Českou republiku. 

CREATE VIEW if not exists v_vo_view05 AS (
	SELECT *
	FROM t_veronika_oburkova_projekt_SQL_secondary_final
	WHERE country="Czech Republic"
	);

WITH t_year AS (
    			SELECT AVG(average_wages) AS avg_wages_year,
    	   			   AVG(food_price) AS avg_food_price_year,
    	   				YEAR  
    			FROM t_veronika_oburkova_projekt_SQL_primary_final
    			WHERE food_price IS NOT NULL 
    	  		AND average_wages IS NOT NULL
    			GROUP BY YEAR),
    t_prev_year AS (
    			SELECT AVG(average_wages) AS avg_wages_prev_year,
    	   			   AVG(food_price) AS avg_food_price_prev_year,
    	   				YEAR+1 AS prev_year
    					FROM t_veronika_oburkova_projekt_SQL_primary_final
    					WHERE food_price IS NOT NULL 
    	  				AND average_wages IS NOT NULL
    			GROUP BY prev_year),
    t_year_GDP AS (
    			SELECT AVG(GDP) AS avg_gdp_year,
    	   				YEAR  
    			FROM v_vo_view05
    			WHERE GDP IS NOT NULL
    			GROUP BY YEAR),
    t_prev_GDP AS (
    			SELECT AVG(GDP) AS avg_gdp_prev_year,
    	   				YEAR+1 AS year_before
    			FROM v_vo_view05
    			WHERE GDP IS NOT NULL
    			GROUP BY year_before)
SELECT t_year.YEAR,
	   prev_year,
	   ROUND((avg_food_price_year  - avg_food_price_prev_year)/avg_food_price_year * 100,2) AS price_grow_percent,
	   ROUND((avg_wages_year - avg_wages_prev_year)/avg_wages_year * 100,2) AS wages_grow_percent,
	   ROUND((avg_gdp_year - avg_gdp_prev_year)/avg_gdp_year * 100,2) AS GDP_grow_percent
FROM t_year 
JOIN t_prev_year
	ON t_year.YEAR=t_prev_year.prev_year 
JOIN t_year_GDP
	ON t_year.YEAR=t_year_GDP.YEAR
JOIN t_prev_GDP
	ON t_year.YEAR=t_prev_GDP.year_before;