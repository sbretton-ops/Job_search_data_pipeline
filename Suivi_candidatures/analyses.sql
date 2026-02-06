CREATE VIEW vue_suivi_complet AS
SELECT
    c.id_candidature,
    e.nom AS entreprise,
    c.date_postule,
    i.date_contact,
    i.type_interaction
FROM candidatures c 
JOIN offres o ON c.id_offre = o.id_offre
JOIN entreprises e ON o.id_entreprise = e.id_entreprise
LEFT JOIN interactions i ON c.id_candidature = i.id_candidature;

DROP VIEW IF EXISTS vue_suivi_complet; -- On efface l'ancienne version

CREATE VIEW vue_suivi_complet AS
SELECT 
    c.id_candidature,
    e.secteur, 
    c.date_postule,
    i.date_contact,
    i.type_interaction
FROM candidatures c
JOIN offres o ON c.id_offre = o.id_offre
JOIN entreprises e ON o.id_entreprise = e.id_entreprise
LEFT JOIN interactions i ON c.id_candidature = i.id_candidature;

SELECT * FROM vue_suivi_complet;

CREATE VIEW vue_kpi_secteurs AS
SELECT e.secteur, COUNT(c.id_candidature) as nb_candidatures
FROM entreprises e
JOIN offres o ON e.id_entreprise = o.id_entreprise
JOIN candidatures c ON o.id_offre = c.id_offre
GROUP BY e.secteur;

DROP VIEW IF EXISTS vue_kpi_secteurs;

CREATE VIEW vua_analyse_offres_completes AS
SELECT o.id_offre, o.titre_poste, o.salaire_moyen, o.type_contrat, c.id_candidature, c.source_decouverte, c.canal_postulation,
e.id_entreprise, e.secteur
FROM offres o
LEFT JOIN entreprises e ON o.id_entreprise = e.id_entreprise
LEFT JOIN candidatures c ON o.id_offre = c.id_offre
LEFT JOIN interactions i ON c.id_candidature = i.id_candidature;

DROP VIEW IF EXISTS vua_analyse_offres_completes;

CREATE VIEW vue_analyse_offres_completes AS
SELECT o.id_offre, o.titre_poste, o.salaire_moyen, o.type_contrat, c.id_candidature, c.source_decouverte, c.canal_postulation,
e.id_entreprise, e.secteur
FROM offres o
LEFT JOIN entreprises e ON o.id_entreprise = e.id_entreprise
LEFT JOIN candidatures c ON o.id_offre = c.id_offre
LEFT JOIN interactions i ON c.id_candidature = i.id_candidature;

DROP VIEW IF EXISTS vue_analyse_offres_completes;

CREATE VIEW vue_analyse_offres_completes AS
SELECT o.id_offre, 
    CASE
        WHEN o.titre_poste LIKE '%Power BI%' THEN 'Power BI Analyst'
        WHEN o.titre_poste LIKE '%Data Analyst%' OR o.titre_poste LIKE '%Data Analyst Junior%' THEN 'Data Analyst'
        WHEN o.titre_poste LIKE '%Business%' THEN 'Business Analyst'
        WHEN o.titre_poste LIKE '%Sales%' THEN 'Sales Analyst'
        WHEN o.titre_poste LIKE '%Pricing%' THEN 'Analyst Pricing'
        WHEN o.titre_poste LIKE '%Yield%' OR o.titre_poste LIKE '%Revenue%' THEN 'Yield Manager'
        ELSE 'Autres'
    END AS categorie_poste,
    o.salaire_moyen, o.type_contrat, c.id_candidature, c.source_decouverte, c.canal_postulation,e.id_entreprise,e.secteur
FROM offres o
LEFT JOIN entreprises e ON o.id_entreprise = e.id_entreprise
LEFT JOIN candidatures c ON o.id_offre = c.id_offre
LEFT JOIN interactions i ON c.id_candidature = i.id_candidature;

DROP VIEW IF EXISTS vue_analyse_offres_completes;


CREATE VIEW vue_analyse_offres_completes AS
SELECT o.id_offre, o.titre_poste, 
    CASE
        WHEN o.titre_poste LIKE '%Power BI%' THEN 'Power BI Analyst'
        WHEN o.titre_poste LIKE '%Data Analyst%' OR o.titre_poste LIKE '%Data Analyst Junior%' THEN 'Data Analyst'
        WHEN o.titre_poste LIKE '%Business%' THEN 'Business Analyst'
        WHEN o.titre_poste LIKE '%Sales%' THEN 'Sales Analyst'
        WHEN o.titre_poste LIKE '%Pricing%' THEN 'Analyst Pricing'
        WHEN o.titre_poste LIKE '%Yield%' OR o.titre_poste LIKE '%Revenue%' THEN 'Yield Manager'
        ELSE 'Autres'
    END AS categorie_poste,
    o.salaire_moyen, o.type_contrat, c.id_candidature, c.statut_actuel, c.source_decouverte, c.canal_postulation,e.id_entreprise,e.secteur, i.type_interaction
FROM offres o
LEFT JOIN entreprises e ON o.id_entreprise = e.id_entreprise
LEFT JOIN candidatures c ON o.id_offre = c.id_offre
LEFT JOIN interactions i ON c.id_candidature = i.id_candidature;

DROP VIEW IF EXISTS vue_analyse_offres_completes;

CREATE VIEW vue_analyse_offres_completes AS
SELECT o.id_offre, o.titre_poste, 
    CASE
        WHEN o.titre_poste LIKE '%Power BI%' THEN 'Power BI Analyst'
        WHEN o.titre_poste LIKE '%Data Analyst%' OR o.titre_poste LIKE '%Data Analyst Junior%' THEN 'Data Analyst'
        WHEN o.titre_poste LIKE '%Business%' THEN 'Business Analyst'
        WHEN o.titre_poste LIKE '%Sales%' OR o.titre_poste LIKE '%E-commerce%' THEN 'Sales Analyst'
        WHEN o.titre_poste LIKE '%Pricing%' THEN 'Analyst Pricing'
        WHEN o.titre_poste LIKE '%Yield%' OR o.titre_poste LIKE '%Revenue%' THEN 'Yield Manager'
        ELSE 'Autres'
    END AS categorie_poste,
    o.salaire_moyen, o.type_contrat, c.id_candidature, c.statut_actuel, c.source_decouverte, c.canal_postulation,e.id_entreprise,e.secteur, i.type_interaction
FROM offres o
LEFT JOIN entreprises e ON o.id_entreprise = e.id_entreprise
LEFT JOIN candidatures c ON o.id_offre = c.id_offre
LEFT JOIN interactions i ON c.id_candidature = i.id_candidature;

SELECT COUNT(categorie_poste) FROM vue_analyse_offres_completes
WHERE categorie_poste = 'Sales Analyst';

DROP VIEW IF EXISTS vue_analyse_offres_completes;

CREATE VIEW vue_analyse_offres_completes AS
SELECT o.id_offre, o.titre_poste, 
    CASE
        WHEN o.titre_poste LIKE '%Power BI%' OR o.titre_poste LIKE '%Reporting%' THEN 'Power BI Analyst'
        WHEN o.titre_poste LIKE '%Data Analyst%' OR o.titre_poste LIKE '%Data Analyst Junior%' THEN 'Data Analyst'
        WHEN o.titre_poste LIKE '%Business%' THEN 'Business Analyst'
        WHEN o.titre_poste LIKE '%Sales%' OR o.titre_poste LIKE '%E-commerce%' THEN 'Sales Analyst'
        WHEN o.titre_poste LIKE '%Pricing%' THEN 'Analyst Pricing'
        WHEN o.titre_poste LIKE '%Yield%' OR o.titre_poste LIKE '%Revenue%' THEN 'Yield Manager'
        ELSE 'Autres'
    END AS categorie_poste,
    o.salaire_moyen, o.type_contrat, c.id_candidature, c.statut_actuel, c.source_decouverte, c.canal_postulation,e.id_entreprise,e.secteur, i.type_interaction
FROM offres o
LEFT JOIN entreprises e ON o.id_entreprise = e.id_entreprise
LEFT JOIN candidatures c ON o.id_offre = c.id_offre
LEFT JOIN interactions i ON c.id_candidature = i.id_candidature;

WITH categorie AS (
    SELECT 
        o.id_offre, o.titre_poste, o.categorie_poste
    FROM vue_analyse_offres_completes o
)
SELECT * FROM categorie
WHERE categorie_poste = 'Power BI Analyst';
