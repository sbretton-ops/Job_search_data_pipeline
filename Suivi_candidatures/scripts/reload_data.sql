-- 1. Nettoyage des tables existantes à chaque update 
DELETE FROM candidatures;
DELETE FROM offres;
DELETE FROM entreprises;
DELETE FROM interactions;

-- 2. Configuration pour l'import CSV
.mode csv

-- 3. Importation des données depuis les fichiers CSV SANS la ligne d en-tête
.import --skip 1 "Data/Suivi_Candidatures_Data - entreprises.csv" entreprises
.import --skip 1 "Data/Suivi_Candidatures_Data - offres.csv" offres
.import --skip 1 "Data/Suivi_Candidatures_Data - candidatures.csv" candidatures
.import --skip 1 "Data/.Suivi_Candidatures_Data - interactions.csv" interactions

-- 4. Vérification du nombre de lignes importées et de la cohérence
SELECT 'Entreprises:' as Table_Name, COUNT(*) FROM entreprises
UNION ALL
SELECT 'Offres:', COUNT(*) FROM offres
UNION ALL
SELECT 'Candidatures:', COUNT(*) FROM candidatures
UNION ALL
SELECT 'Interactions:', COUNT(*) FROM interactions;