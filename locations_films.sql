-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 25 mai 2022 à 04:04
-- Version du serveur : 10.4.21-MariaDB
-- Version de PHP : 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `locations_films`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id_categories` int(11) NOT NULL,
  `nom_categories` varchar(45) DEFAULT NULL,
  `film_id_film` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `id_clients` int(11) NOT NULL,
  `nom_clients` varchar(45) NOT NULL,
  `prenom_clients` varchar(45) NOT NULL,
  `email_clients` varchar(45) NOT NULL,
  `film_id_film` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id_clients`, `nom_clients`, `prenom_clients`, `email_clients`, `film_id_film`) VALUES
(1, 'AFO', 'ABDEL FADIL', 'afofadil18@gmail.com', 2),
(2, 'NADA-ABI', 'TAWFIK', 'nada@gmail.com', 1),
(3, 'dasilveira', 'nora', 'noradasilveira0@gmail.com', 3),
(4, 'apelete', 'josias', 'josiasapelete@gmail.com', 2),
(5, 'douti', 'jeandavid', 'jeandaviddouti@gmail.com', 5);

-- --------------------------------------------------------

--
-- Structure de la table `factures`
--

CREATE TABLE `factures` (
  `id_factures` int(11) NOT NULL,
  `prix_total` float DEFAULT NULL,
  `date_retour` date DEFAULT NULL,
  `locations_id_locations` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

CREATE TABLE `film` (
  `id_film` int(11) NOT NULL,
  `titre_film` varchar(45) DEFAULT NULL,
  `date_sortie` varchar(45) DEFAULT NULL,
  `duree_film` time DEFAULT NULL,
  `realisateur` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `film`
--

INSERT INTO `film` (`id_film`, `titre_film`, `date_sortie`, `duree_film`, `realisateur`) VALUES
(1, ' New-York 1997', '1981-06-24', '01:39:00', ' John Carpenter'),
(2, ' 1492 : Christophe Colomb', '1992-10-12', '02:34:00', ' Ridley Scott'),
(3, ' 2001 : L\'Odyssée de l\'espace', '1968-09-27', '02:40:00', ' Stanley Kubrick'),
(4, ' Los Angeles 2013', '1996-11-13', '01:41:00', ' John Carpenter'),
(5, ' Class 1984', '1982-09-29', '01:38:00', ' Mark L. Lester');

-- --------------------------------------------------------

--
-- Structure de la table `locations`
--

CREATE TABLE `locations` (
  `id_locations` int(11) NOT NULL,
  `date_locations` date DEFAULT NULL,
  `datefin_locations` date DEFAULT NULL,
  `clients_id_clients` int(11) NOT NULL,
  `film_id_film` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `rapport`
--

CREATE TABLE `rapport` (
  `id_rapport` int(11) NOT NULL,
  `date_creation` date DEFAULT NULL,
  `date_modification` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_categories`,`film_id_film`),
  ADD KEY `fk_categories_film1_idx` (`film_id_film`);

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_clients`,`film_id_film`),
  ADD KEY `fk_clients_film1_idx` (`film_id_film`);

--
-- Index pour la table `factures`
--
ALTER TABLE `factures`
  ADD PRIMARY KEY (`id_factures`,`locations_id_locations`),
  ADD KEY `fk_factures_locations1_idx` (`locations_id_locations`);

--
-- Index pour la table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id_film`);

--
-- Index pour la table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id_locations`),
  ADD KEY `fk_locations_clients_idx` (`clients_id_clients`),
  ADD KEY `fk_locations_film1_idx` (`film_id_film`);

--
-- Index pour la table `rapport`
--
ALTER TABLE `rapport`
  ADD PRIMARY KEY (`id_rapport`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id_categories` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `id_clients` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `factures`
--
ALTER TABLE `factures`
  MODIFY `id_factures` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `film`
--
ALTER TABLE `film`
  MODIFY `id_film` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `locations`
--
ALTER TABLE `locations`
  MODIFY `id_locations` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `rapport`
--
ALTER TABLE `rapport`
  MODIFY `id_rapport` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `fk_clients_film1` FOREIGN KEY (`film_id_film`) REFERENCES `film` (`id_film`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `factures`
--
ALTER TABLE `factures`
  ADD CONSTRAINT `fk_factures_locations1` FOREIGN KEY (`locations_id_locations`) REFERENCES `locations` (`id_locations`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `fk_locations_clients` FOREIGN KEY (`clients_id_clients`) REFERENCES `clients` (`id_clients`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_locations_film1` FOREIGN KEY (`film_id_film`) REFERENCES `film` (`id_film`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
