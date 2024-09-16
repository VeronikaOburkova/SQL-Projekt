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
  
t_veronika_oburkova_projekt_SQL_secondary_final 
- pro dodatečná data o dalších evropských státech z datových sad economies a countries

Následně jsem vytvořila 5 SQL scriptů, které vytvářejí podklady pro odpovědi na dané otázky:

 1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají? 
ODPOVĚĎ: Ve všech pracovních kategoriích je trend průměrné mzdy rostoucí.

2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
ODPOVĚĎ: Z výsledku dotazu je možné říci, že v roce 2006 si bylo možné koupit za průměrný plat 1287kg chleba a 1437 litrů mléka a v roce 2018 jste si mohli z průměrného platu koupit 1342kg chleba a 1642 litrů mléka. 

3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
ODPOVĚĎ: Nejpomaleji zdražují Rajská jablka červená kulatá v roce 2007.

4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
ODPOVĚĎ: Dle mého pozorování neexistuje. Nebyl rok, kdy byl meziroční nárůst cen potravin výrazně vyšší (víc než 10%).

5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?
ODPOVĚĎ:  V roce 2007 byl nárůst HDP o 5,28% a taktéž ceny potravin narostly o 5,97% a mzdy o 6,4%. V dalším roce pokračoval růst cen potravin o 6,02% a růst mezd se zastavil až na 7,3%.
Zajímavý je rok 2009, kdy naopak HDP klesalo o -4,88%. V ten rok ceny potravin klesly o -7,31%, ale mzdy stálo rostly o 3,06%.
Přes 5% nárůstu HDP byl zaznamenám ještě v roce 2015 (5,11%) a navázal na to i pokles cen (v roce 2015 -0,56% a v roce 2016 -1,14%). Naopak mzdy rostly v roce 2015 o 2,45% a následně v roce 2016 o 3,52%. 
Nelze tedy říci, že když HDP výrazně stoupne, tak vždy stoupne i cena potravin a mzdy.
