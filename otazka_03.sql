-- 3. otázka: Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)? 
WITH t_year AS (
    	SELECT food_category,
    	   		AVG(food_price) AS avg_price_year,
    	   		YEAR  
    	FROM t_veronika_oburkova_projekt_SQL_primary_final
    	GROUP BY food_category,
    			YEAR),
    t_prev_year AS (
       SELECT food_category,
    	      AVG(food_price) AS avg_price_prev_year,
    	      YEAR+1 AS prev_year
       FROM t_veronika_oburkova_projekt_SQL_primary_final
       WHERE food_price IS NOT NULL
       GROUP BY food_category,
    		    prev_year)
SELECT t_year.food_category,
	   t_year.YEAR,
	   prev_year,
ROUND((avg_price_year - avg_price_prev_year)/avg_price_year*100,2) AS price_grow_percent
FROM t_year 
JOIN t_prev_year
	ON t_year.food_category=t_prev_year.food_category
	AND t_year.YEAR=t_prev_year.prev_year
ORDER BY price_grow_percent;