-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 07 fév. 2020 à 13:18
-- Version du serveur :  5.7.26
-- Version de PHP :  7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `expressfood`
--

-- --------------------------------------------------------

--
-- Structure de la table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cart_client_idx` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cart`
--

INSERT INTO `cart` (`id`, `client_id`) VALUES
(1, 1),
(4, 1),
(6, 1),
(2, 2),
(3, 2),
(5, 2);

-- --------------------------------------------------------

--
-- Structure de la table `cart_product`
--

DROP TABLE IF EXISTS `cart_product`;
CREATE TABLE IF NOT EXISTS `cart_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) DEFAULT NULL,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cart_product_cart1_idx` (`cart_id`),
  KEY `fk_cart_product_product1_idx` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cart_product`
--

INSERT INTO `cart_product` (`id`, `quantity`, `cart_id`, `product_id`) VALUES
(1, 2, 1, 1),
(2, 2, 1, 3),
(3, 1, 2, 1),
(4, 1, 2, 3),
(5, 2, 3, 2),
(6, 1, 3, 4),
(7, 2, 4, 1),
(8, 1, 4, 4),
(9, 1, 5, 2),
(10, 2, 4, 4),
(11, 2, 6, 2),
(12, 1, 5, 3);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `username`, `email`, `password`, `create_time`, `phone`, `address`) VALUES
(1, 'Arthur', 'arthur.morisson@pm.me', 'secure_pass', '2020-01-24 07:34:41', '0123456789', '23 rue Foch 56100 Lorient'),
(2, 'TonyGlandil', 'tony.glandil@yopmail.com', 'secure_pass', '2020-01-24 07:34:41', '0123456789', 'Les buttes Chaumont 75000 Paris');

-- --------------------------------------------------------

--
-- Structure de la table `client_order`
--

DROP TABLE IF EXISTS `client_order`;
CREATE TABLE IF NOT EXISTS `client_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cart_id` int(11) NOT NULL,
  `deliverer_id` int(11) NOT NULL,
  `order_state_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_client_order_cart1_idx` (`cart_id`),
  KEY `fk_client_order_deliverer1_idx` (`deliverer_id`),
  KEY `fk_client_order_order_state1` (`order_state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client_order`
--

INSERT INTO `client_order` (`id`, `order_date`, `cart_id`, `deliverer_id`, `order_state_id`) VALUES
(1, '2020-01-24 08:29:26', 1, 1, 5),
(2, '2020-01-24 08:29:26', 2, 2, 4),
(3, '2020-01-24 08:29:50', 3, 3, 3),
(4, '2020-01-24 08:29:50', 4, 4, 4),
(5, '2020-01-24 08:30:59', 5, 2, 1),
(6, '2020-01-24 08:30:59', 4, 1, 3),
(7, '2020-01-24 08:31:20', 6, 2, 4),
(8, '2020-01-24 08:31:20', 3, 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `deliverer`
--

DROP TABLE IF EXISTS `deliverer`;
CREATE TABLE IF NOT EXISTS `deliverer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deliverer_name` varchar(45) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `deliverer`
--

INSERT INTO `deliverer` (`id`, `deliverer_name`, `position`, `status`) VALUES
(1, 'Livreur 1', 'Lorient', 1),
(2, 'Livreur 2', 'Paris', 1),
(3, 'Livreur 3', 'Lorient', 0),
(4, 'Livreur 4', 'Paris', 0);

-- --------------------------------------------------------

--
-- Structure de la table `deliverer_stock`
--

DROP TABLE IF EXISTS `deliverer_stock`;
CREATE TABLE IF NOT EXISTS `deliverer_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `deliverer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_deliverer_stock_stock_product1_idx` (`stock_product_id`),
  KEY `fk_deliverer_stock_deliverer1_idx` (`deliverer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `deliverer_stock`
--

INSERT INTO `deliverer_stock` (`id`, `stock_product_id`, `quantity`, `deliverer_id`) VALUES
(1, 1, 5, 1),
(2, 2, 5, 1),
(3, 2, 5, 2),
(4, 2, 5, 2);

-- --------------------------------------------------------

--
-- Structure de la table `order_state`
--

DROP TABLE IF EXISTS `order_state`;
CREATE TABLE IF NOT EXISTS `order_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `order_state`
--

INSERT INTO `order_state` (`id`, `name`) VALUES
(1, 'en attente de paiement'),
(2, 'payé'),
(3, 'prise en compte'),
(4, 'en livraison'),
(5, 'livré');

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_type1_idx` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `product_name`, `description`, `price`, `type_id`) VALUES
(1, 'Couscous', 'Merguez servi avec sa semoule , son bouillon de legumes frais , pois chiche , raisin sec', 10, 1),
(2, 'Poulet Curry', 'Poulet curry, carotte, pommes de terre, pousses de bambou, lait de coco, sauce au curry.', 11, 1),
(3, 'Mousse au chocolat', ' Une mousse au chocolat préparée avec seulement trois ingrédients : des oeufs, du chocolat et du beurre salé. Une recette simple et authentique pour une mousse au chocolat qui nous rappelle celle de notre maman.', 4, 2),
(4, 'Dessert Lacté aux fruit', 'Type yaourt avec des morceaux de framboise', 3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `stock_product`
--

DROP TABLE IF EXISTS `stock_product`;
CREATE TABLE IF NOT EXISTS `stock_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_quantity` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stock_product_product1_idx` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `stock_product`
--

INSERT INTO `stock_product` (`id`, `stock_quantity`, `product_id`) VALUES
(1, 50, 1),
(2, 50, 4),
(3, 50, 3),
(4, 50, 2);

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `type`
--

INSERT INTO `type` (`id`, `type`) VALUES
(1, 'plat'),
(2, 'dessert');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_cart_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `cart_product`
--
ALTER TABLE `cart_product`
  ADD CONSTRAINT `fk_cart_product_cart1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cart_product_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `client_order`
--
ALTER TABLE `client_order`
  ADD CONSTRAINT `fk_client_order_cart1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_client_order_cart_id1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_client_order_deliverer1` FOREIGN KEY (`deliverer_id`) REFERENCES `deliverer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_client_order_order_state1` FOREIGN KEY (`order_state_id`) REFERENCES `order_state` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `deliverer_stock`
--
ALTER TABLE `deliverer_stock`
  ADD CONSTRAINT `fk_deliverer_stock_deliverer1` FOREIGN KEY (`deliverer_id`) REFERENCES `deliverer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_deliverer_stock_stock_product1` FOREIGN KEY (`stock_product_id`) REFERENCES `stock_product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_type1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `stock_product`
--
ALTER TABLE `stock_product`
  ADD CONSTRAINT `fk_stock_product_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
