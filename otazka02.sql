-- 2.otázka: Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?

SELECT food_category,
	   ROUND(AVG(food_price),2) AS avg_food_price,
	   ROUND(AVG(average_wages),2) AS avg_wages,
	   ROUND(AVG(average_wages)/AVG(food_price),0) AS amount_to_buy,
	   `year`
FROM t_veronika_oburkova_projekt_SQL_primary_final
WHERE food_category IN ('Chléb konzumní kmínový','Mléko polotučné pasterované') 
	  AND `year` IN ('2006','2018')
GROUP BY `year`,
		 food_category
ORDER BY `year`;
