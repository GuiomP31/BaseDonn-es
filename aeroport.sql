-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 18 avr. 2022 à 12:18
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `aeroport`
--

-- --------------------------------------------------------

--
-- Structure de la table `avion`
--

DROP TABLE IF EXISTS `avion`;
CREATE TABLE IF NOT EXISTS `avion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(15) DEFAULT NULL,
  `capacite` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `avion`
--

INSERT INTO `avion` (`id`, `type`, `capacite`) VALUES
(1, 'Boeing 747', 467),
(2, 'Airbus 380', 525),
(3, 'Airbus 350', 350),
(4, 'Boeing 777', 400),
(5, 'Bombardier Q400', 78),
(6, 'Boeing 747', 450);

-- --------------------------------------------------------

--
-- Structure de la table `pilote`
--

DROP TABLE IF EXISTS `pilote`;
CREATE TABLE IF NOT EXISTS `pilote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(15) DEFAULT NULL,
  `prenom` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `pilote`
--

INSERT INTO `pilote` (`id`, `nom`, `prenom`) VALUES
(1, 'Dupuis', 'Alain'),
(2, 'Simonet', 'Georges'),
(3, 'Steule', 'Christophe'),
(4, 'Millard', 'Georges'),
(5, 'Arond', 'Larry'),
(6, 'Dourc', 'François');

-- --------------------------------------------------------

--
-- Structure de la table `vol`
--

DROP TABLE IF EXISTS `vol`;
CREATE TABLE IF NOT EXISTS `vol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `depart` varchar(9) DEFAULT NULL,
  `arrivee` varchar(13) DEFAULT NULL,
  `id_avion` int(11) NOT NULL,
  `id_pilote` int(11) NOT NULL,
  `jdep` date DEFAULT NULL,
  `hdep` time DEFAULT NULL,
  `jarr` date DEFAULT NULL,
  `harr` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_avion` (`id_avion`),
  KEY `id_pilote` (`id_pilote`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `vol`
--

INSERT INTO `vol` (`id`, `depart`, `arrivee`, `id_avion`, `id_pilote`, `jdep`, `hdep`, `jarr`, `harr`) VALUES
(1, 'Paris', 'San Francisco', 1, 2, '2016-05-15', '10:00:00', '2016-05-16', '09:30:00'),
(2, 'Londres', 'Moscou', 3, 1, '2016-05-15', '10:30:00', '2016-05-15', '17:00:00'),
(3, 'Berlin', 'Madrid', 2, 3, '2016-05-15', '11:15:00', '2016-05-15', '18:00:00'),
(4, 'Londres', 'Madrid', 4, 6, '2016-05-16', '06:20:00', '2016-05-16', '09:30:00'),
(5, 'Bruxelles', 'Rome', 6, 5, '2016-05-16', '10:00:00', '2016-05-16', '15:10:00'),
(6, 'Berlin', 'Amsterdam', 5, 1, '2016-05-16', '14:30:00', '2016-05-16', '17:00:00'),
(7, 'Paris', 'Bruxelles', 1, 2, '2016-05-16', '18:00:00', '2016-05-16', '20:00:00'),
(8, 'New York', 'Paris', 1, 3, '2016-05-17', '03:00:00', '2016-05-17', '21:30:00'),
(9, 'Paris', 'Bruxelles', 4, 6, '2016-05-17', '06:00:00', '2016-05-17', '07:00:00'),
(10, 'Berlin', 'Madrid', 2, 4, '2016-05-17', '08:00:00', '2016-05-17', '11:00:00');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `vol`
--
ALTER TABLE `vol`
  ADD CONSTRAINT `vol_ibfk_1` FOREIGN KEY (`id_pilote`) REFERENCES `pilote` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vol_ibfk_2` FOREIGN KEY (`id_avion`) REFERENCES `avion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
