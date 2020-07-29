-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 29 juil. 2020 à 09:54
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
-- Base de données :  `p6-v4`
--

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment_author_id` int(11) NOT NULL,
  `trick_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5F9E962A1F0B124D` (`comment_author_id`),
  KEY `IDX_5F9E962AB46B9EE8` (`trick_id_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`id`, `content`, `created_at`, `updated_at`, `comment_author_id`, `trick_id_id`) VALUES
(28, 'nouveau', '2020-07-29 06:14:51', '2020-07-29 06:14:51', 1, 18),
(29, 'j\'aime trop cette figure', '2020-07-29 06:15:17', '2020-07-29 06:15:17', 1, 18);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20200721152553', '2020-07-21 15:26:10', 211),
('DoctrineMigrations\\Version20200721160952', '2020-07-21 16:10:07', 618),
('DoctrineMigrations\\Version20200721162148', '2020-07-21 16:22:14', 841),
('DoctrineMigrations\\Version20200721171514', '2020-07-21 17:15:26', 373),
('DoctrineMigrations\\Version20200722191056', '2020-07-22 19:11:31', 618),
('DoctrineMigrations\\Version20200724075948', '2020-07-24 07:59:58', 777),
('DoctrineMigrations\\Version20200725135507', '2020-07-25 13:55:20', 710),
('DoctrineMigrations\\Version20200726093552', '2020-07-26 09:45:07', 506),
('DoctrineMigrations\\Version20200726114755', '2020-07-26 11:48:07', 549),
('DoctrineMigrations\\Version20200726145630', '2020-07-26 14:56:42', 386),
('DoctrineMigrations\\Version20200727085726', '2020-07-27 08:57:34', 550),
('DoctrineMigrations\\Version20200727091836', '2020-07-27 09:18:56', 543),
('DoctrineMigrations\\Version20200727170036', '2020-07-27 17:00:45', 598),
('DoctrineMigrations\\Version20200729022828', '2020-07-29 02:28:40', 641),
('DoctrineMigrations\\Version20200729023441', '2020-07-29 02:34:50', 2000);

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tricks_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `videos` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_6A2CA10C3B153154` (`tricks_id`),
  KEY `IDX_6A2CA10C67B3B43D` (`users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `media`
--

INSERT INTO `media` (`id`, `tricks_id`, `users_id`, `name`, `videos`) VALUES
(3, 18, 2, 'fade1acdfe4a65e334a4368a46f883fc.jpeg', NULL),
(7, 9, 1, 'fad447a915271bf2d64b8d5ecf9e0d33.jpeg', NULL),
(8, 10, 1, '5c150d8e607b3736d69341ca1ff9f891.jpeg', NULL),
(9, 11, 1, '24a884a8148e7e610435ad65093174aa.jpeg', NULL),
(10, 12, 1, '6420902ed86f29ce1e5e6baa51e4b3b5.jpeg', NULL),
(11, 12, 1, '9db4a59f557bcb25ea355e84344f89e1.png', NULL),
(12, 13, 1, 'e7eb2b0add7036173f88982e846a94fe.jpeg', NULL),
(13, 13, 1, 'de944ef5ef988be35586f667a239ea37.jpeg', NULL),
(14, 13, 1, '35a12a1d6788d1d17b72025c6657a2b8.jpeg', NULL),
(15, 14, 1, '0aaef37bbdfe4e029550d52c5b482d5a.jpeg', NULL),
(16, 14, 1, 'ad2500705433ad6ffa6f4d12465d2314.jpeg', NULL),
(17, 15, 1, '4c40d473ab3f3ca08a3954e2137b3cfc.jpeg', NULL),
(18, 17, 1, '122dcd540420372801dda2fb80eb8640.jpeg', NULL),
(19, 21, 1, '9dc177ce137cef0bb78eb0fafb350994.jpeg', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `reset_password_request`
--

DROP TABLE IF EXISTS `reset_password_request`;
CREATE TABLE IF NOT EXISTS `reset_password_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `selector` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_7CE748AA76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tricks`
--

DROP TABLE IF EXISTS `tricks`;
CREATE TABLE IF NOT EXISTS `tricks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `trick_group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trick_author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E1D902C15E237E06` (`name`),
  KEY `IDX_E1D902C1ADCE8E82` (`trick_author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tricks`
--

INSERT INTO `tricks` (`id`, `name`, `description`, `trick_group`, `created_at`, `updated_at`, `trick_author_id`) VALUES
(9, 'Stalefish', 'Un grab consiste à attraper la planche avec la main pendant le saut. Le verbe anglais to grab signifie « attraper. »\r\n\r\nIl existe plusieurs types de grabs selon la position de la saisie et la main choisie pour l\'effectuer, avec des difficultés variables :\r\n\r\nmute : saisie de la carre frontside de la planche entre les deux pieds avec la main avant ;\r\nsad ou melancholie ou style week : saisie de la carre backside de la planche, entre les deux pieds, avec la main avant ;\r\nindy : saisie de la carre frontside de la planche, entre les deux pieds, avec la main arrière ;\r\nstalefish : saisie de la carre backside de la planche entre les deux pieds avec la main arrière ;\r\ntail grab : saisie de la partie arrière de la planche, avec la main arrière ;\r\nnose grab : saisie de la partie avant de la planche, avec la main avant ;\r\njapan ou japan air : saisie de l\'avant de la planche, avec la main avant, du côté de la carre frontside.\r\nseat belt: saisie du carre frontside à l\'arrière avec la main avant ;\r\ntruck driver: saisie du carre avant et carre arrière avec chaque main (comme tenir un volant de voiture)\r\nUn grab est d\'autant plus réussi que la saisie est longue. De plus, le saut est d\'autant plus esthétique que la saisie du snowboard est franche, ce qui permet au rideur d\'accentuer la torsion de son corps grâce à la tension de sa main sur la planche. On dit alors que le grab est tweaké (le verbe anglais to tweak signifie « pincer » mais a également le sens de « peaufiner »).', 'Les grabs', '2020-07-23 14:44:53', '2020-07-23 14:44:53', 1),
(10, '360°', 'On désigne par le mot « rotation » uniquement des rotations horizontales ; les rotations verticales sont des flips. Le principe est d\'effectuer une rotation horizontale pendant le saut, puis d\'attérir en position switch ou normal. La nomenclature se base sur le nombre de degrés de rotation effectués :\r\n\r\nun 180 désigne un demi-tour, soit 180 degrés d\'angle ;\r\n360, trois six pour un tour complet ;\r\n540, cinq quatre pour un tour et demi ;\r\n720, sept deux pour deux tours complets ;\r\n900 pour deux tours et demi ;\r\n1080 ou big foot pour trois tours ;\r\netc.\r\nUne rotation peut être frontside ou backside : une rotation frontside correspond à une rotation orientée vers la carre backside. Cela peut paraître incohérent mais l\'origine étant que dans un halfpipe ou une rampe de skateboard, une rotation frontside se déclenche naturellement depuis une position frontside (i.e. l\'appui se fait sur la carre frontside), et vice-versa. Ainsi pour un rider qui a une position regular (pied gauche devant), une rotation frontside se fait dans le sens inverse des aiguilles d\'une montre.\r\n\r\nUne rotation peut être agrémentée d\'un grab, ce qui rend le saut plus esthétique mais aussi plus difficile car la position tweakée a tendance à déséquilibrer le rideur et désaxer la rotation. De plus, le sens de la rotation a tendance à favoriser un sens de grab plutôt qu\'un autre. Les rotations de plus de trois tours existent mais sont plus rares, d\'abord parce que les modules assez gros pour lancer un tel saut sont rares, et ensuite parce que la vitesse de rotation est tellement élevée qu\'un grab devient difficile, ce qui rend le saut considérablement moins esthétique.\r\n\r\nPour entrer sur une barre de slide, le rideur peut se mettre perpendiculaire à l\'axe de la barre et fera donc un quart de tour en l\'air, modulo 360 degrés — il est possible de faire n tours complets plus un quart de tour. On a donc la dénomination suivante pour ce type de rotations :\r\n\r\n90 pour un quart de tour simple ;\r\n270 pour trois quarts de tours ;\r\n450 pour un tour un quart ;\r\n630 pour un tour trois quarts ;\r\n810 pour deux tours un quart ;\r\netc.', 'Les rotations', '2020-07-23 14:52:25', '2020-07-23 14:52:25', 1),
(11, 'Front Flip', 'Un flip est une rotation verticale. On distingue les front flips, rotations en avant, et les back flips, rotations en arrière.\r\n\r\nIl est possible de faire plusieurs flips à la suite, et d\'ajouter un grab à la rotation.\r\n\r\nLes flips agrémentés d\'une vrille existent aussi (Mac Twist, Hakon Flip, ...), mais de manière beaucoup plus rare, et se confondent souvent avec certaines rotations horizontales désaxées.\r\n\r\nNéanmoins, en dépit de la difficulté technique relative d\'une telle figure, le danger de retomber sur la tête ou la nuque est réel et conduit certaines stations de ski à interdire de telles figures dans ses snowparks.', 'Les flips', '2020-07-23 14:52:50', '2020-07-23 14:52:50', 1),
(12, 'Corkscrew', 'Une rotation désaxée est une rotation initialement horizontale mais lancée avec un mouvement des épaules particulier qui désaxe la rotation. Il existe différents types de rotations désaxées (corkscrew ou cork, rodeo, misty, etc.) en fonction de la manière dont est lancé le buste. Certaines de ces rotations, bien qu\'initialement horizontales, font passer la tête en bas.\r\n\r\nBien que certaines de ces rotations soient plus faciles à faire sur un certain nombre de tours (ou de demi-tours) que d\'autres, il est en théorie possible de d\'attérir n\'importe quelle rotation désaxée avec n\'importe quel nombre de tours, en jouant sur la quantité de désaxage afin de se retrouver à la position verticale au moment voulu.\r\n\r\nIl est également possible d\'agrémenter une rotation désaxée par un grab.', 'Les rotations désaxéees', '2020-07-23 14:53:15', '2020-07-23 14:53:15', 1),
(13, 'Nose slide', 'Un slide consiste à glisser sur une barre de slide. Le slide se fait soit avec la planche dans l\'axe de la barre, soit perpendiculaire, soit plus ou moins désaxé.\r\n\r\nOn peut slider avec la planche centrée par rapport à la barre (celle-ci se situe approximativement au-dessous des pieds du rideur), mais aussi en nose slide, c\'est-à-dire l\'avant de la planche sur la barre, ou en tail slide, l\'arrière de la planche sur la barre.', 'Les slides', '2020-07-23 14:53:36', '2020-07-23 14:53:36', 1),
(14, 'One foot', 'Figures réalisée avec un pied décroché de la fixation, afin de tendre la jambe correspondante pour mettre en évidence le fait que le pied n\'est pas fixé. Ce type de figure est extrêmement dangereuse pour les ligaments du genou en cas de mauvaise réception.', 'Les ones foots tricks', '2020-07-23 14:53:57', '2020-07-23 14:53:57', 1),
(15, 'Rocket Air', 'Le terme old school désigne un style de freestyle caractérisée par en ensemble de figure et une manière de réaliser des figures passée de mode, qui fait penser au freestyle des années 1980 - début 1990 (par opposition à new school) :\r\n\r\nfigures désuètes : Japan air, rocket air, ...\r\nrotations effectuées avec le corps tendu\r\nfigures saccadées, par opposition au style new school qui privilégie l\'amplitude\r\nÀ noter que certains tricks old school restent indémodables :\r\n\r\nBackside Air\r\nMethod Air', 'Les rides', '2020-07-23 14:54:17', '2020-07-29 09:34:01', 1),
(16, 'Switch', 'Les tricks sont pour la plupart du temps, des rotations qui peuvent être de plusieurs types, combinées ou non avec un grab, et effectuées en position normal ou switch. La dénomination des figures ainsi créées répond à l\'usage suivant :\r\n\r\nd\'abord le mot « switch » si la figure est effectuée du côté non naturel\r\nensuite le nom du type de désaxage de la rotation si la figure est une rotation désaxée\r\npuis le nom de la rotation elle-même, c’est-à-dire le nombre de degrés effectués\r\nsi la figure est grabée, le nom du grab\r\nPar exemple, un « switch rodeo cinq tail grab » est un saut dans lequel le rider part de son côté non naturel, fait une rotation horizontale d\'un tour et demi avec un désaxage de type rodeo, et attrape l\'arrière de sa planche pendant la rotation.\r\n\r\nLa connaissance du mode de départ (normal ou switch) et du nombre de tours suffit à connaître le sens dans lequel le rideur atterrira .', 'Les sauts', '2020-07-23 14:54:34', '2020-07-23 14:54:34', 1),
(17, 'Rail to switch', 'Pour les barres de slide, la dénomination se fait de la manière suivante :\r\n\r\nd\'abord le nom de la figure d\'entrée si elle est autre qu\'un 90, suivi du mot anglais to\r\nle nom du slide (nose slide ou tail slide) ou le mot anglais rail si le slide est classique\r\nenfin le nom de la figure de sortie si elle est autre qu\'un 90, précédée du mot anglais to\r\nPar exemple, un switch 270 to rail signifie que le rideur part du côté non naturel, qu\'il effectue trois quarts de tour avant de slider normalement sur la barre, puis qu\'il sort avec un quart de tour.\r\n\r\nUn « rail to switch » signifie que le rider est sorti de la barre avec un quart de tour qui l\'a amené de son côté non naturel. De même, le « switch to rail » consiste à entrer sur la barre en partant en arrière et en effectuant un quart de tour.\r\n\r\nLorsque le rideur effectue une rotation au milieu de la barre, on rajoute au nom de la figure un « to figure to rail ». Par exemple, un 270 to rail to 180 to rail to switch signifie que le rideur rentre sur la barre avec 3 quarts de tours, puis effectue un demi-tour en milieu de barre (que les riders appellent aussi « sexchange »), et sort enfin avec un quart de tour qui le fait atterrir en arrière.\r\n\r\nParfois, quand seule la figure d\'entrée ou de sortie est notable, par exemple un 630, on parle d\'un « 630 in » ou « 630 out ».', 'Les barres de slide', '2020-07-23 14:54:59', '2020-07-23 14:54:59', 1),
(18, 'figure 5', 'description 5', 'Les slides', '2020-07-23 16:39:37', '2020-07-23 16:39:37', 2),
(21, 'Groofy', 'Tout d\'abord, il faut savoir qu\'il y a deux positions sur sa planche: regular ou goofy. Un rider regular aura son pied gauche devant et un rider goofy aura son pied droit devant. Après un certain moment, les planchistes sont capables de descendre dans les deux positions. Un rider regular qui descend en position goofy, dira qu\'il descend « switch ». Généralement, une manœuvre sera considéré comme plus difficile quand elle est effectué « switch ».', 'Les rides', '2020-07-29 09:41:47', '2020-07-29 09:41:47', 1);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1483A5E9E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `roles`, `password`, `last_name`, `first_name`, `created_at`, `updated_at`, `is_verified`) VALUES
(1, 'ryryry203@gmail.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$RG1uQkRyeTZ1cWJtckRJRw$vWQ+M1BA+qM5Ab+c2iJbi3Au+wJTI3eo6uJ8fMB898E', 'LDX', 'Chris', '2020-07-21 16:25:29', '2020-07-21 16:25:29', 1),
(2, 'test@test', '[]', '$argon2id$v=19$m=65536,t=4,p=1$SlROOXpDR3ZYN0NmN1BUUQ$jXtfdv3b0QmzYnGCxKFkJ1xN4uKiDTK6d6aNMpWvEIE', 'Testeur', 'Tested', '2020-07-23 16:37:49', '2020-07-23 16:37:49', 0),
(3, 'ryry@ryry', '[]', '$argon2id$v=19$m=65536,t=4,p=1$d0ZaMk5qSHVRLktuNnNXNg$CIcWI92id2m2RUTKUE6Z0ZIsjSgfUYXND0YqEui1ACY', 'IRONFIST', 'Ryson', '2020-07-24 08:05:41', '2020-07-24 08:05:41', 0),
(29, 'c.loudoux@gmail.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$c2VNNlZjTEFzaXNuZXh4bw$Cg42gcvuGWpwMbgNXIzEvpgpdMi8OpwVV/BP3/4m7wo', 'LOUDOUX', 'Christopher', '2020-07-29 05:58:29', '2020-07-29 05:58:29', 1);

-- --------------------------------------------------------

--
-- Structure de la table `users_pictures`
--

DROP TABLE IF EXISTS `users_pictures`;
CREATE TABLE IF NOT EXISTS `users_pictures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F43D041AA76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users_pictures`
--

INSERT INTO `users_pictures` (`id`, `user_id`, `name`) VALUES
(3, 1, 'naruto.png'),
(4, 2, 'a47e241e817e07772ddc8f0cdfc90c5c.jpeg'),
(5, 3, 'a47e241e817e07772ddc8f0cdfc90c5c.jpeg'),
(18, 29, 'naruto.png');

-- --------------------------------------------------------

--
-- Structure de la table `videos`
--

DROP TABLE IF EXISTS `videos`;
CREATE TABLE IF NOT EXISTS `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tricks_id` int(11) DEFAULT NULL,
  `iframe` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_29AA64323B153154` (`tricks_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `videos`
--

INSERT INTO `videos` (`id`, `tricks_id`, `iframe`) VALUES
(6, 9, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/AzJPhQdTRQQ\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(7, 10, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/AzJPhQdTRQQ\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(8, 10, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/AzJPhQdTRQQ\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(9, 11, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/AzJPhQdTRQQ\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(10, 12, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/AzJPhQdTRQQ\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(11, 13, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/AzJPhQdTRQQ\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(12, 14, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/AzJPhQdTRQQ\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(13, 15, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/AzJPhQdTRQQ\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(14, 16, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/AzJPhQdTRQQ\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(15, 17, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/AzJPhQdTRQQ\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(16, 18, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/AzJPhQdTRQQ\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(18, 18, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/GS9MMT_bNn8\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(19, 18, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/gMfmjr-kuOg\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FK_5F9E962A1F0B124D` FOREIGN KEY (`comment_author_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_5F9E962AB46B9EE8` FOREIGN KEY (`trick_id_id`) REFERENCES `tricks` (`id`);

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FK_6A2CA10C3B153154` FOREIGN KEY (`tricks_id`) REFERENCES `tricks` (`id`),
  ADD CONSTRAINT `FK_6A2CA10C67B3B43D` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `tricks`
--
ALTER TABLE `tricks`
  ADD CONSTRAINT `FK_E1D902C1ADCE8E82` FOREIGN KEY (`trick_author_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `users_pictures`
--
ALTER TABLE `users_pictures`
  ADD CONSTRAINT `FK_F43D041AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `FK_29AA64323B153154` FOREIGN KEY (`tricks_id`) REFERENCES `tricks` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
