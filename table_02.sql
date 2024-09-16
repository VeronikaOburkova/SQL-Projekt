-- Vytvoření druhé tabulky z datových sad economies a countries

CREATE TABLE IF NOT EXISTS t_veronika_oburkova_projekt_SQL_secondary_final AS (
		SELECT te.GDP,
	   		  te.gini,
	   		  te.population,
	   		  te.`year`,
	   		  tc.country,
	   		  tc.continent
		FROM (
				SELECT GDP,
			    	   gini,
			    	   population,
			    	   `year`,
			    	   country
				FROM economies e 
				WHERE `year` BETWEEN 2006 AND 2018)te
		LEFT JOIN (
				SELECT country,
					continent
				FROM countries c
				WHERE continent='Europe')tc
		ON te.country=tc.country);

