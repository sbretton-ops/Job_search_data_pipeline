# Pipeline d'Analyse & Suivi de Candidatures (SQL & BI)

## Présentation du Projet
Plutôt que d'utiliser un simple tableau de bord, j'ai choisi de traiter ma propre recherche d'emploi comme un véritable projet Data. L'objectif est de centraliser l'ensemble de mes démarches, d'automatiser le flux d'informations et d'analyser mes performances pour piloter ma recherche avec la précision d'un outil de Business Intelligence professionnel.

## Sommaire
- [Pipeline d'Analyse \& Suivi de Candidatures (SQL \& BI)](#pipeline-danalyse--suivi-de-candidatures-sql--bi)
  - [Présentation du Projet](#présentation-du-projet)
  - [Sommaire](#sommaire)
  - [Stack Technique](#stack-technique)
  - [Architecture des Données](#architecture-des-données)
    - [1. Ingestion \& Automatisation (`reload_data.sql`)](#1-ingestion--automatisation-reload_datasql)
    - [2. Couche Sémantique \& Logique Métier (`analyses.sql`)](#2-couche-sémantique--logique-métier-analysessql)
    - [3. Modélisation Power BI](#3-modélisation-power-bi)
  - [Indicateurs Clés de Performance (KPI)](#indicateurs-clés-de-performance-kpi)
  - [Visualisation Power BI](#visualisation-power-bi)
    - [Page 1 : Pilotage de l'Activité](#page-1--pilotage-de-lactivité)
    - [Page 2 : Analyse du Sourcing \& Conversion](#page-2--analyse-du-sourcing--conversion)
  - [Compétences démontrées](#compétences-démontrées)


## Stack Technique
* **Base de données :** SQLite (via VS Code).
* **Langage de requête :** SQL (Vues, Case When, Joins).
* **Visualisation :** Power BI Desktop.
* **Automatisation :** Script de Reload SQL (Import CSV).

## Architecture des Données

### 1. Ingestion & Automatisation (`reload_data.sql`)
Pour garantir l'intégrité des données, j'ai mis en place un script de chargement automatisé qui :
* **Réinitialise** les tables existantes (`DELETE FROM`) pour éviter tout doublon lors des mises à jour.
* **Importe** les nouveaux fichiers CSV de manière structurée via le mode `.import`.
* **Valide** l'importation par un contrôle qualité final via une requête `UNION ALL` comptabilisant les lignes par table.
  
![Script de mise à jour](Suivi_candidatures/Visualisations%20PNG/Script_update.png)
*Aperçu du script de reload assurant la fraîcheur des données.*

### 2. Couche Sémantique & Logique Métier (`analyses.sql`)
J'ai fait le choix de déporter l'intelligence du rapport vers la couche SQL via des **Vues** :
* **Catégorisation dynamique :** Utilisation de clauses `CASE WHEN` avec l'opérateur `LIKE` pour segmenter automatiquement les types de postes (ex: 'Power BI Analyst', 'Yield Manager').
* **Modélisation :** Centralisation des données via des `LEFT JOIN` complexes pour garantir l'analyse exhaustive des candidatures, même en l'absence de retour entreprise.
* **Optimisation :** Réduction de la charge sur Power BI en effectuant le nettoyage et la catégorisation à la source.

<table>
  <tr>
    <td width="50%"><strong>Vue Analyse des Offres</strong></td>
    <td width="50%"><strong>Vue Suivi Complet</strong></td>
  </tr>
  <tr>
    <td><img src="Suivi_candidatures/Visualisations%20PNG/vue_analyse_offres_completes.png" alt="Vue Analyse"></td>
    <td><img src="Suivi_candidatures/Visualisations%20PNG/vue_suivi_complet.png" alt="Vue Suivi"></td>
  </tr>
</table>


### 3. Modélisation Power BI
* **Schéma en étoile :** Connexion des vues SQL à une table de dimension temporelle (Calendrier).
* **Intelligence Temporelle :** Analyse des variations hebdomadaires basée sur la norme ISO 8601 (code 21).

## Indicateurs Clés de Performance (KPI)
* **Volume d'activité :** Nombre total de candidatures envoyées (ex: 62).
* **Réactivité Marché :** Délai moyen de réponse calculé via la fonction DAX `AVERAGEX` (ex: 9,94 jours).
* **Conversion :** Suivi du tunnel de recrutement (Envoi ➔ Entretien).
* **Analyse de Salaire :** Salaire annuel moyen proposé dans les descriptifs d'offres (ex: 42,67K€).

---

## Visualisation Power BI

### Page 1 : Pilotage de l'Activité
![Opportunités et KPI](Suivi_candidatures/Visualisations%20PNG/Opportunités.png)
*Suivi du volume (62 candidatures) et de la réactivité du marché (9,94 jours de délai moyen).*

### Page 2 : Analyse du Sourcing & Conversion
![Performance et Suivi](Suivi_candidatures/Visualisations%20PNG/Performance_et_suivi.png)
*Détail de la performance des canaux et suivi du tunnel de recrutement.*

##  Compétences démontrées
* **Maîtrise du cycle de vie de la donnée :** De l'ingestion brute à la visualisation finale.
* **Analytics Engineering :** Capacité à structurer des vues SQL robustes pour simplifier le reporting.
* **Vision Business :** Création d'un outil d'aide à la décision transposable aux enjeux RH (Sourcing, Time-to-Hire).

---
*Projet réalisé par Stéphanie BRETTON - Data / Business Analyst*


