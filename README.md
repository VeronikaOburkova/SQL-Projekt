# SQL-Projekt

SQL projekt pro Engeto Akademii


Výzkumné otázky, na které se pokusím odpovědět:

    1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají? 
    2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd? 
    3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)? 
    4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)? 
    5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem? 


Výstupem jsou 2 SQL tabulky s názvy:

t_veronika_oburkova_projekt_SQL_primary_final
- datové sady týkající se mezd a cen potravin:
    - czechia_payroll: informace o mzdách,
    - czechia_price: ceny potravin,
    - czechia_price_category: kódy vybraných potravin
    - czechia_payroll_industry_branch: číselník odvětví
  
t_veronika_oburkova_projekt_SQL_secondary_final 
- pro dodatečná data o dalších evropských státech z datových sad economies a countries

Následně jsem vytvořila 5 SQL scriptů, které vytvářejí podklady pro odpovědi na dané otázky:

 1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
ODPOVĚĎ:
Odvětví, kde mzdy v každém roce rostly:
    - Doprava a skladování
    - Ostatní činnosti
    - Zdravotní  a soc. Péče
    - Zpracovatelský průmysl

V roce 2013 oproti roku 2012 se udál pokles mezd v nejvíce odvětvích. Jsou to:
- Administrativní a podpůrné činnosti
- Činnosti v oblasti nemovitostí
- Informační a komunikační činnosti
- Kulturní, zábavní a rekreační činnosti
- Peněžnictví a pojišťovnictví
- Profesní, vědecké a technické činnosti
- Stavebnictví
- Těžba a dobývání
- Velkoobchod a maloobchod; opravy a údržba motorových vozidel
- Výroba a rozvod elektřiny, plynu, tepla a klimatiz. Vzduchu
- Zásobování vodou; činnosti související s odpady a sanacemi

Dále v roce 2009 byl oproti předchozímu roku pokles v odvětvích: Těžba a dobývání, Ubytování, stravování a pohostinství a Zemědělství, lesnictví, rybářství.

V roce 2010 byl pokles v odvětvích: Profesní, vědecké a technické činnosti, Veřejná správa a obrana; povinné sociální zabezpečení a Vzdělávání.

V roce 2011 byl pokles v odvětvích: Kulturní, zábavní a rekreační činnosti, Ubytování, stravování a pohostinství a Veřejná správa a obrana; povinné sociální zabezpečení.

V roce 2015 byl pokles v odvětví Výroba a rozvod elektřiny, plynu, tepla a klimatiz. vzduchu a v roce 2016 byl zaznamenán pokles růstu mezd v odvětví Těžba a dobývání.

3. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
ODPOVĚĎ: Z výsledku dotazu je možné říci, že v roce 2006 si bylo možné koupit za průměrný plat 1287kg chleba a 1437 litrů mléka a v roce 2018 jste si mohli z průměrného platu koupit 1342kg chleba a 1642 litrů mléka. 

4. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
ODPOVĚĎ: Nejpomaleji zdražují Rajská jablka červená kulatá v roce 2007.

5. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
ODPOVĚĎ: Dle mého pozorování neexistuje. Nebyl rok, kdy byl meziroční nárůst cen potravin výrazně vyšší (víc než 10%).

6. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?
ODPOVĚĎ:  V roce 2007 byl nárůst HDP o 5,28% a taktéž ceny potravin narostly o 5,97% a mzdy o 6,4%. V dalším roce pokračoval růst cen potravin o 6,02% a růst mezd se zastavil až na 7,3%.
Zajímavý je rok 2009, kdy naopak HDP klesalo o -4,88%. V ten rok ceny potravin klesly o -7,31%, ale mzdy stálo rostly o 3,06%.
Přes 5% nárůstu HDP byl zaznamenám ještě v roce 2015 (5,11%) a navázal na to i pokles cen (v roce 2015 -0,56% a v roce 2016 -1,14%). Naopak mzdy rostly v roce 2015 o 2,45% a následně v roce 2016 o 3,52%. 
Nelze tedy říci, že když HDP výrazně stoupne, tak vždy stoupne i cena potravin a mzdy.
