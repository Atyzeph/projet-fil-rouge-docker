-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 12, 2023 at 09:04 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alert_weather`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `dwelling_number` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `street_name` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `city_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `authority`
--

CREATE TABLE `authority` (
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `title`, `is_deleted`) VALUES
(1, 'test', b'1'),
(2, 'test-2', b'0'),
(3, 'test-3', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `population` int DEFAULT NULL,
  `french_departement_id` int DEFAULT NULL,
  `weather_alerts_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `name`, `population`, `french_departement_id`, `weather_alerts_id`) VALUES
(1, 'L\' Abergement-Clémenciat', 767, 1140, NULL),
(2, 'L\' Abergement-de-Varey', 243, 1140, NULL),
(3, 'Ambérieu-en-Bugey', 14081, 1140, NULL),
(4, 'Ambérieux-en-Dombes', 1671, 1140, NULL),
(5, 'Ambléon', 110, 1140, NULL),
(6, 'Ambronay', 2684, 1140, NULL),
(7, 'Ambutrix', 750, 1140, NULL),
(8, 'Andert-et-Condon', 336, 1140, NULL),
(9, 'Anglefort', 1124, 1140, NULL),
(10, 'Apremont', 383, 1140, NULL),

-- --------------------------------------------------------

--
-- Table structure for table `french_departement_weather_alerts`
--

CREATE TABLE `french_departement_weather_alerts` (
  `french_departement_id` int NOT NULL,
  `weather_alerts_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `measure`
--

CREATE TABLE `measure` (
  `id` int NOT NULL,
  `air_quality` varchar(255) DEFAULT NULL,
  `humidity` varchar(255) DEFAULT NULL,
  `wind` varchar(255) DEFAULT NULL,
  `station_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `thread_id` int DEFAULT NULL,
  `post_reactions_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_post_reactions`
--

CREATE TABLE `post_post_reactions` (
  `post_id` int NOT NULL,
  `post_reactions_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_reaction`
--

CREATE TABLE `post_reaction` (
  `id` int NOT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `station`
--

CREATE TABLE `station` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `city_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `thread`
--

CREATE TABLE `thread` (
  `id` int NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `category_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `dtype` varchar(31) NOT NULL,
  `id` int NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_role_enum` int DEFAULT NULL,
  `address_id` int DEFAULT NULL,
  `posts_id` int DEFAULT NULL,
  `post_reactions_id` int DEFAULT NULL,
  `settings` tinyblob,
  `is_deleted` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`dtype`, `id`, `email`, `first_name`, `name`, `password`, `user_name`, `user_role_enum`, `address_id`, `posts_id`, `post_reactions_id`, `settings`, `is_deleted`) VALUES
('User', 1, 'totot@tata.com', 'tata', 'toto', 'passwordCrypte', 'totoUserName', NULL, NULL, NULL, NULL, NULL, NULL),
('admin', 2, 'Admin', 'Jotaro', 'Kujo', 'Diginamic', 'Jojo', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_`
--

CREATE TABLE `user_` (
  `dtype` varchar(31) NOT NULL,
  `id` int NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `settings` tinyblob,
  `user_name` varchar(255) DEFAULT NULL,
  `address_id` int DEFAULT NULL,
  `posts_id` int DEFAULT NULL,
  `post_reactions_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_authority`
--

CREATE TABLE `user_authority` (
  `user_id` int NOT NULL,
  `authority_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_favoris`
--

CREATE TABLE `user_favoris` (
  `user_id` int NOT NULL,
  `favoris_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_posts`
--

CREATE TABLE `user_posts` (
  `user_id` int NOT NULL,
  `posts_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_post_reactions`
--

CREATE TABLE `user_post_reactions` (
  `user_id` int NOT NULL,
  `post_reactions_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user__favoris`
--

CREATE TABLE `user__favoris` (
  `user_id` int NOT NULL,
  `favoris_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user__posts`
--

CREATE TABLE `user__posts` (
  `user_id` int NOT NULL,
  `posts_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user__post_reactions`
--

CREATE TABLE `user__post_reactions` (
  `user_id` int NOT NULL,
  `post_reactions_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `weather_alert`
--

CREATE TABLE `weather_alert` (
  `id` int NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `administrator_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKpo044ng5x4gynb291cv24vtea` (`city_id`);

--
-- Indexes for table `authority`
--
ALTER TABLE `authority`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKlcr4o3sbxft6kkwnw1xggq468` (`french_departement_id`);

--
-- Indexes for table `city_weather_alerts`
--
ALTER TABLE `city_weather_alerts`
  ADD UNIQUE KEY `UK_r6q35fsc7f42qeuigt8cnj6fw` (`weather_alerts_id`),
  ADD KEY `FKqg60kooe51ivdfiwq7duw5dfy` (`city_id`);

--
-- Indexes for table `favori`
--
ALTER TABLE `favori`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3c85mwm9g5r8ce1jlgnhdufde` (`station_id`),
  ADD KEY `FKmqtv8mpn3adhetklqumgpi3i0` (`user_id`);

--
-- Indexes for table `french_departement`
--
ALTER TABLE `french_departement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `french_departement_weather_alerts`
--
ALTER TABLE `french_departement_weather_alerts`
  ADD UNIQUE KEY `UK_j4y4qa4brrs8mqyamgxhmpyaw` (`weather_alerts_id`),
  ADD KEY `FKbi02lewun1n8hfvacd4jco2m8` (`french_departement_id`);

--
-- Indexes for table `measure`
--
ALTER TABLE `measure`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK8vve2g93jirfpfhoeu90uqy5g` (`station_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKsq0vax8pchtnqe2fdwthd3xeu` (`thread_id`);

--
-- Indexes for table `post_post_reactions`
--
ALTER TABLE `post_post_reactions`
  ADD UNIQUE KEY `UK_4vh8d4r67httdsxqdfliydybj` (`post_reactions_id`),
  ADD KEY `FKclp7gv6349l799lpefdwlvm84` (`post_id`);

--
-- Indexes for table `post_reaction`
--
ALTER TABLE `post_reaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK7w8bagmah3gucs8bqs1glcfnj` (`city_id`);

--
-- Indexes for table `thread`
--
ALTER TABLE `thread`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKoj6qti0b8jbnwep0x71o31eix` (`category_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKddefmvbrws3hvl5t0hnnsv8ox` (`address_id`);

--
-- Indexes for table `user_`
--
ALTER TABLE `user_`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKt99kx4fa0okdr2keid6re132i` (`address_id`);

--
-- Indexes for table `user_authority`
--
ALTER TABLE `user_authority`
  ADD PRIMARY KEY (`user_id`,`authority_name`),
  ADD KEY `FK6ktglpl5mjosa283rvken2py5` (`authority_name`);

--
-- Indexes for table `user_favoris`
--
ALTER TABLE `user_favoris`
  ADD UNIQUE KEY `UK_iex2hupsqs6dsbmot8b0qm7hm` (`favoris_id`),
  ADD KEY `FKrb6ihlsa4plvkhq5nxmgie8m6` (`user_id`);

--
-- Indexes for table `user_posts`
--
ALTER TABLE `user_posts`
  ADD UNIQUE KEY `UK_hderxn09m1aorawdorx55782j` (`posts_id`),
  ADD KEY `FKte524koqa2jvulb0h5o99x7f1` (`user_id`);

--
-- Indexes for table `user_post_reactions`
--
ALTER TABLE `user_post_reactions`
  ADD UNIQUE KEY `UK_1hq7vw6yofjygwdduf225bk2f` (`post_reactions_id`),
  ADD KEY `FKgv4rkov85h7paua06ash88jct` (`user_id`);

--
-- Indexes for table `user__favoris`
--
ALTER TABLE `user__favoris`
  ADD UNIQUE KEY `UK_6b21n45xn1u993yaxju0l5aq6` (`favoris_id`),
  ADD KEY `FKcvsvjkiwq76toaindvvwc6kjt` (`user_id`);

--
-- Indexes for table `user__posts`
--
ALTER TABLE `user__posts`
  ADD UNIQUE KEY `UK_3xsxom3k23oepeahj3nkmme7i` (`posts_id`),
  ADD KEY `FK63xmx2bev5qc2seya07w1hy5a` (`user_id`);

--
-- Indexes for table `user__post_reactions`
--
ALTER TABLE `user__post_reactions`
  ADD UNIQUE KEY `UK_2n6rtnc3mhclcwb67di027uey` (`post_reactions_id`),
  ADD KEY `FK304xsmgo6afigrr5ieif62uf0` (`user_id`);

--
-- Indexes for table `weather_alert`
--
ALTER TABLE `weather_alert`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK63nadh2luvpq4hf7yl46vk1cn` (`administrator_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35349;

--
-- AUTO_INCREMENT for table `favori`
--
ALTER TABLE `favori`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `french_departement`
--
ALTER TABLE `french_departement`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1240;

--
-- AUTO_INCREMENT for table `measure`
--
ALTER TABLE `measure`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_reaction`
--
ALTER TABLE `post_reaction`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `station`
--
ALTER TABLE `station`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `thread`
--
ALTER TABLE `thread`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_`
--
ALTER TABLE `user_`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `weather_alert`
--
ALTER TABLE `weather_alert`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FKpo044ng5x4gynb291cv24vtea` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`);

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `FKlcr4o3sbxft6kkwnw1xggq468` FOREIGN KEY (`french_departement_id`) REFERENCES `french_departement` (`id`);

--
-- Constraints for table `city_weather_alerts`
--
ALTER TABLE `city_weather_alerts`
  ADD CONSTRAINT `FK6g74s53yo4efay5309bko5yqv` FOREIGN KEY (`weather_alerts_id`) REFERENCES `weather_alert` (`id`),
  ADD CONSTRAINT `FKqg60kooe51ivdfiwq7duw5dfy` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`);

--
-- Constraints for table `favori`
--
ALTER TABLE `favori`
  ADD CONSTRAINT `FK3c85mwm9g5r8ce1jlgnhdufde` FOREIGN KEY (`station_id`) REFERENCES `station` (`id`),
  ADD CONSTRAINT `FKh9jxdw2dmmdnddra4ipg5mjxi` FOREIGN KEY (`user_id`) REFERENCES `user_` (`id`),
  ADD CONSTRAINT `FKmqtv8mpn3adhetklqumgpi3i0` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `french_departement_weather_alerts`
--
ALTER TABLE `french_departement_weather_alerts`
  ADD CONSTRAINT `FKbi02lewun1n8hfvacd4jco2m8` FOREIGN KEY (`french_departement_id`) REFERENCES `french_departement` (`id`),
  ADD CONSTRAINT `FKbla1d6c6gkgi1530muhl0l2cb` FOREIGN KEY (`weather_alerts_id`) REFERENCES `weather_alert` (`id`);

--
-- Constraints for table `measure`
--
ALTER TABLE `measure`
  ADD CONSTRAINT `FK8vve2g93jirfpfhoeu90uqy5g` FOREIGN KEY (`station_id`) REFERENCES `station` (`id`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FKsq0vax8pchtnqe2fdwthd3xeu` FOREIGN KEY (`thread_id`) REFERENCES `thread` (`id`);

--
-- Constraints for table `post_post_reactions`
--
ALTER TABLE `post_post_reactions`
  ADD CONSTRAINT `FKclp7gv6349l799lpefdwlvm84` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  ADD CONSTRAINT `FKdj4p9ao1cajwewuq9drygcu3q` FOREIGN KEY (`post_reactions_id`) REFERENCES `post_reaction` (`id`);

--
-- Constraints for table `station`
--
ALTER TABLE `station`
  ADD CONSTRAINT `FK7w8bagmah3gucs8bqs1glcfnj` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`);

--
-- Constraints for table `thread`
--
ALTER TABLE `thread`
  ADD CONSTRAINT `FKoj6qti0b8jbnwep0x71o31eix` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FKddefmvbrws3hvl5t0hnnsv8ox` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`);

--
-- Constraints for table `user_`
--
ALTER TABLE `user_`
  ADD CONSTRAINT `FKt99kx4fa0okdr2keid6re132i` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`);

--
-- Constraints for table `user_authority`
--
ALTER TABLE `user_authority`
  ADD CONSTRAINT `FK6ktglpl5mjosa283rvken2py5` FOREIGN KEY (`authority_name`) REFERENCES `authority` (`name`),
  ADD CONSTRAINT `FKio2xcw9ogcqbasp25n5vttxrf` FOREIGN KEY (`user_id`) REFERENCES `user_` (`id`);

--
-- Constraints for table `user_favoris`
--
ALTER TABLE `user_favoris`
  ADD CONSTRAINT `FKifvv1qrg7i8ys3dwe7s9mnbu` FOREIGN KEY (`favoris_id`) REFERENCES `favori` (`id`),
  ADD CONSTRAINT `FKrb6ihlsa4plvkhq5nxmgie8m6` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `user_posts`
--
ALTER TABLE `user_posts`
  ADD CONSTRAINT `FK52ebjx0bagapf4x475m3xbofc` FOREIGN KEY (`posts_id`) REFERENCES `post` (`id`),
  ADD CONSTRAINT `FKte524koqa2jvulb0h5o99x7f1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `user_post_reactions`
--
ALTER TABLE `user_post_reactions`
  ADD CONSTRAINT `FK99cn6xqnn0xnl72j8h6d3i51f` FOREIGN KEY (`post_reactions_id`) REFERENCES `post_reaction` (`id`),
  ADD CONSTRAINT `FKgv4rkov85h7paua06ash88jct` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `user__favoris`
--
ALTER TABLE `user__favoris`
  ADD CONSTRAINT `FK5aljdwwsj9gvnyxcp6wqgc9yl` FOREIGN KEY (`favoris_id`) REFERENCES `favori` (`id`),
  ADD CONSTRAINT `FKcvsvjkiwq76toaindvvwc6kjt` FOREIGN KEY (`user_id`) REFERENCES `user_` (`id`);

--
-- Constraints for table `user__posts`
--
ALTER TABLE `user__posts`
  ADD CONSTRAINT `FK63xmx2bev5qc2seya07w1hy5a` FOREIGN KEY (`user_id`) REFERENCES `user_` (`id`),
  ADD CONSTRAINT `FKkmhgyvmio1cyhbg8io459s185` FOREIGN KEY (`posts_id`) REFERENCES `post` (`id`);

--
-- Constraints for table `user__post_reactions`
--
ALTER TABLE `user__post_reactions`
  ADD CONSTRAINT `FK304xsmgo6afigrr5ieif62uf0` FOREIGN KEY (`user_id`) REFERENCES `user_` (`id`),
  ADD CONSTRAINT `FK60042roo2729jrike9luu87ga` FOREIGN KEY (`post_reactions_id`) REFERENCES `post_reaction` (`id`);

--
-- Constraints for table `weather_alert`
--
ALTER TABLE `weather_alert`
  ADD CONSTRAINT `FK63nadh2luvpq4hf7yl46vk1cn` FOREIGN KEY (`administrator_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKj0en1brbk20jeoqd5qh5i8syo` FOREIGN KEY (`administrator_id`) REFERENCES `user_` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
