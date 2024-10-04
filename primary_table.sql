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
