-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2021 at 08:39 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `facebook-db`
--

-- --------------------------------------------------------

--
-- Table structure for table `blocked_users`
--

CREATE TABLE `blocked_users` (
  `id` int(11) NOT NULL,
  `user_blocking_id` int(11) NOT NULL,
  `user_blocked_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blocked_users`
--

INSERT INTO `blocked_users` (`id`, `user_blocking_id`, `user_blocked_id`) VALUES
(14, 7, 11);

-- --------------------------------------------------------

--
-- Table structure for table `connections`
--

CREATE TABLE `connections` (
  `id` int(11) NOT NULL,
  `user1_id` int(11) NOT NULL,
  `user2_id` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `connections`
--

INSERT INTO `connections` (`id`, `user1_id`, `user2_id`, `date`) VALUES
(11, 11, 7, '2021-09-13'),
(13, 0, 7, '2021-09-20'),
(14, 0, 7, '2021-09-20'),
(15, 0, 7, '2021-09-20'),
(16, 0, 7, '2021-09-20'),
(17, 0, 7, '2021-09-20'),
(18, 0, 7, '2021-09-20'),
(19, 0, 7, '2021-09-20'),
(20, 0, 7, '2021-09-20'),
(21, 0, 7, '2021-09-20'),
(22, 0, 7, '2021-09-20'),
(23, 0, 7, '2021-09-20'),
(24, 0, 7, '2021-09-20'),
(25, 6, 7, '2021-09-20'),
(26, 11, 7, '2021-09-20'),
(27, 6, 7, '2021-09-20'),
(28, 11, 7, '2021-09-20'),
(29, 6, 7, '2021-09-20'),
(30, 21, 7, '2021-09-21'),
(31, 10, 14, '2021-09-21'),
(32, 21, 5, '2021-09-21');

-- --------------------------------------------------------

--
-- Table structure for table `pending_requests`
--

CREATE TABLE `pending_requests` (
  `id` int(11) NOT NULL,
  `request_user_id` int(11) NOT NULL,
  `pending_accept_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pending_requests`
--

INSERT INTO `pending_requests` (`id`, `request_user_id`, `pending_accept_id`) VALUES
(11, 7, 11),
(31, 10, 13),
(32, 10, 5),
(33, 10, 6),
(34, 10, 7),
(35, 10, 8),
(36, 10, 9),
(37, 10, 11),
(39, 10, 15),
(40, 10, 17),
(41, 10, 16);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(90) NOT NULL,
  `last_name` varchar(90) NOT NULL,
  `email` varchar(90) NOT NULL,
  `password` varchar(90) NOT NULL,
  `gender` varchar(15) NOT NULL,
  `date_of_birth` date NOT NULL,
  `country` varchar(90) NOT NULL,
  `city` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `last_name`, `email`, `password`, `gender`, `date_of_birth`, `country`, `city`) VALUES
(5, 'user1', 'ddddddd', 'user1@user.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Male', '2021-09-15', 'LBN', 'baaklin'),
(6, 'david', 'aboumatar', 'aboumatardavid@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'on', '2021-08-30', 'LBN', 'beirut'),
(7, 'user2', 'user2', 'user2@user.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'on', '2021-08-30', 'LBN', 'beirut'),
(8, 'user3', 'user3', 'user3@user.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'on', '2021-08-30', 'LBN', 'beirut'),
(9, 'user4', 'user4', 'user4@user.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Male', '2021-09-06', 'LBN', 'beirut'),
(10, 'user5', 'user5', 'user5@user.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Male', '2021-09-20', 'LBN', 'beirut'),
(11, 'user7', 'user7', 'user7@user.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Male', '2021-09-21', 'LBN', 'beirut'),
(13, 'john', 'smith', 'john@john.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Male', '2020-01-07', 'DZA', 'wdwd'),
(14, 'maria', 'maria', 'maria@user.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Male', '2021-08-31', 'LBN', 'beirut'),
(15, 'awr', 'waf', 'user50@user.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Male', '2021-09-17', 'LBN', 'beirut'),
(16, 'Oliver', 'Oliver', 'Oliver@Oliver.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Male', '2021-09-30', 'LBN', 'beirut'),
(17, 'Oliver', 'Oliver', 'Oliverrr@Oliver.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Male', '2021-09-30', 'LBN', 'beirut'),
(18, 'david', 'aboumatar', 'david@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Male', '2021-09-16', 'LBN', 'beirut'),
(19, 'doe', 'doe', 'doe@doe.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Male', '2021-09-09', 'LBN', 'beirut'),
(20, 'david', 'aboumatar', 'aboumat@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Male', '2021-09-24', 'LBN', 'beirut'),
(21, 'david', 'aboumatar', 'charbel@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Male', '2021-09-24', 'LBN', 'beirut');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blocked_users`
--
ALTER TABLE `blocked_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `connections`
--
ALTER TABLE `connections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pending_requests`
--
ALTER TABLE `pending_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blocked_users`
--
ALTER TABLE `blocked_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `connections`
--
ALTER TABLE `connections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `pending_requests`
--
ALTER TABLE `pending_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
