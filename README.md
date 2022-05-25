# Location-de-films
A l'aide d'un Relational Database Management System (RDBMS) stockez les données d'une entreprise de location de film

1. une requête pour ajouter un film
--> INSERT INTO `film` (`id_film`, `titre_film`, `date_sortie`, `duree_film`, `realisateur`) VALUES ('', '', '', '', '', '');

2. une requête pour modifier un film
--> UPDATE `film` SET `id_film` = '', `titre_film` = '', `date_sortie` = '', `duree_film` = '', `realisateur` = '' WHERE `film`.`id_film` = 1;

3. une requête pour supprimer un film
--> DELETE FROM `film` WHERE `film`.`id_film` = 1;

4. une requête pour ajouter un client
--> INSERT INTO `clients` (`id_clients`, `nom_clients`, `prenom_clients`, `email_clients`) VALUES ('', '', '', '');

5. une requête pour modifier un client
--> UPDATE `clients` SET `id_clients` = NULL, `nom_clients` = '', `prenom_clients` = '', `email_clients` = '' WHERE `clients`.`id_clients` = 1;

6. une requête pour supprimer un client
--> DELETE FROM `clients` WHERE `clients`.`id_clients` = 1;

7. une requête pour afficher les 3 derniers films ajoutés
--> SELECT * FROM `films` ORDER BY `id_films` DESC LIMIT 3; 
