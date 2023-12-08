-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 18 avr. 2022 à 12:20
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
-- Base de données : `projetldnr`
--

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `idarticle` int(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `prixunitaire` int(50) NOT NULL,
  `photo` varchar(255) NOT NULL,
  PRIMARY KEY (`idarticle`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `articles`
--

INSERT INTO `articles` (`idarticle`, `description`, `prixunitaire`, `photo`) VALUES
(46, 'Bonnet2', 14, '666032389923160.jpg'),
(47, 'Bonnet2', 9, 'img2.jpg'),
(48, 'Bonnet3', 16, 'img3.jpg'),
(49, 'Bonnet4', 19, 'img1.jpg'),
(50, 'Bonnet5', 16, 'img2.jpg'),
(51, 'Bonnet6', 24, 'img3.jpg'),
(52, 'Bonnet7', 24, 'img1.jpg'),
(53, 'Bonnet8', 22, 'img1.jpg'),
(54, 'Bonnet9', 12, 'img1.jpg'),
(55, 'Bonnet10', 19, 'img1.jpg'),
(56, 'Bonnet11', 18, 'img1.jpg'),
(57, 'Bonnet12', 15, 'img1.jpg'),
(58, 'Bonnet13', 12, 'img1.jpg'),
(59, 'Bonnet14', 25, 'img1.jpg'),
(60, 'Bonnet15', 10, 'img1.jpg'),
(61, 'pull bleu', 12, 'img4.jpg'),
(62, 'veste cuir', 40, 'img5.jpg'),
(64, 'tee shirt', 8, 'img7.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `entetescommandes`
--

DROP TABLE IF EXISTS `entetescommandes`;
CREATE TABLE IF NOT EXISTS `entetescommandes` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `idutilisateur` int(20) NOT NULL,
  `datecommande` timestamp(6) NULL DEFAULT NULL,
  `totalcommande` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `entetescommandes`
--

INSERT INTO `entetescommandes` (`id`, `idutilisateur`, `datecommande`, `totalcommande`) VALUES
(1, 35, NULL, 104),
(2, 35, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `lignescommandes`
--

DROP TABLE IF EXISTS `lignescommandes`;
CREATE TABLE IF NOT EXISTS `lignescommandes` (
  `idcommande` int(11) NOT NULL,
  `idarticle` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `prixunitaire` int(11) NOT NULL,
  `totalligne` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `lignescommandes`
--

INSERT INTO `lignescommandes` (`idcommande`, `idarticle`, `quantite`, `prixunitaire`, `totalligne`) VALUES
(1, 48, 1, 16, 16),
(1, 47, 1, 9, 9),
(1, 48, 1, 16, 16),
(1, 62, 2, 40, 80),
(1, 64, 1, 8, 8);

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

DROP TABLE IF EXISTS `panier`;
CREATE TABLE IF NOT EXISTS `panier` (
  `idutilisateur` int(20) NOT NULL,
  `idarticle` int(20) NOT NULL,
  `quantite` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `panier`
--

INSERT INTO `panier` (`idutilisateur`, `idarticle`, `quantite`, `status`) VALUES
(19, 47, 1, 1),
(19, 50, 1, 1),
(19, 48, 1, 1),
(19, 46, 1, 1),
(19, 49, 3, 1),
(19, 47, 4, 1),
(19, 47, 1, 0),
(33, 61, 1, 0),
(33, 50, 1, 0),
(33, 64, 1, 0),
(35, 48, 1, 1),
(35, 47, 1, 1),
(38, 61, 2, 0),
(38, 46, 2, 0),
(35, 48, 1, 1),
(35, 62, 2, 1),
(35, 64, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `nom`, `prenom`, `telephone`, `mail`, `mdp`, `role`) VALUES
(35, 'titi', 'tutu', '0808080808', 'titi@gmail.com', 'qsdf', 'user'),
(34, 'toto', 'tata', '040404040404', 'tata@gmail.fr', 'azert', 'user'),
(32, 'gui', 'past', '1254252145', 'guipast@gmail.com', 'salut', 'user'),
(33, 'pierre', 'paul', '0202020202', 'pierrep@gmail.com', 'popi', 'user'),
(24, 'jean', 'paul', '04.25.36.48.78', 'paul@gmail.org', 'matin', 'admin'),
(31, 'martin', 'gilles', '2525252525', 'gilles@gmail.fr', 'eeeeee', 'user'),
(29, 'martin', 'Pierre', '0612458732', 'pierre@martin.com', 'aaaaa', 'user'),
(30, 'tristan', 'tristan', '1212121212', 'tristan@tristan.com', 'zzzzz', 'user'),
(36, 'bob', ' bib', '0909090908', 'bob@gmail.com', 'aqwx', 'user'),
(37, 'marcej', 'roger', '0125251425', 'roger@gmail.com', 'qsez', 'user'),
(38, 'tristan', 'tristan', '0101010101', 'tristan@tr.fr', 'azer', 'user');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
