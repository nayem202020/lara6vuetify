-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2020 at 05:38 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravuetify`
--
CREATE DATABASE IF NOT EXISTS `laravuetify` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `laravuetify`;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_10_01_092810_add_api_token_to_users', 2),
(5, '2020_10_01_102335_create_roles_table', 3),
(6, '2020_10_01_102659_add_role_id_to_users', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(39, 'admin', '2020-10-06 05:06:23', '2020-10-06 05:06:23'),
(40, 'Modifier', '2020-10-06 05:06:32', '2020-11-29 13:35:33'),
(44, 'Editor', '2020-11-29 13:36:08', '2020-11-29 13:36:08'),
(45, 'Guest', '2020-11-29 13:36:22', '2020-11-29 13:36:22'),
(46, 'Super Admin', '2020-11-29 13:36:30', '2020-11-29 13:36:30'),
(47, 'new', '2020-11-29 15:50:31', '2020-11-29 15:50:31'),
(48, 'new 2', '2020-11-29 15:50:46', '2020-11-29 15:50:46'),
(49, 'new 3', '2020-11-29 16:04:01', '2020-11-29 16:04:01'),
(50, 'Role 4', '2020-11-30 04:22:14', '2020-11-30 04:22:14'),
(51, 'Role 5', '2020-11-30 04:22:22', '2020-11-30 04:22:22'),
(52, 'Role 6', '2020-11-30 04:22:29', '2020-11-30 04:22:29'),
(53, 'role 8', '2020-11-30 04:23:29', '2020-11-30 04:23:29');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint(20) NOT NULL DEFAULT 0,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role_id`, `api_token`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Penelope Bailey', 'lisa.hayes@example.com', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'O2dojE2EWa', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(2, 'Bonita Cassin', 'blanda.daren@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'tov8iWIWvj', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(3, 'Roberta Lind Jr.', 'golda.jaskolski@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'm1pVGPzp98', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(4, 'Rowan Ritchie', 'hosea67@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'Ak17qhPpJx', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(5, 'Dr. Alena Prosacco', 'faustino25@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'E7pW7iUxzb', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(6, 'Prof. Brionna Gusikowski', 'olesch@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'JwCYWYjwlM', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(7, 'Vito Breitenberg', 'darius.moore@example.net', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'f0YFlWXaOD', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(8, 'Katelin Reynolds PhD', 'krystal.rosenbaum@example.net', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'JU4eJValeG', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(9, 'Stevie King Sr.', 'athena.nienow@example.com', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'BS3As9tDHS', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(10, 'Ardella Gerhold', 'rafaela.vandervort@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'FCpWgfvKGA', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(11, 'Bradly Rice', 'pierce25@example.com', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'A4XjissW1n', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(12, 'Afton Wiegand', 'fgislason@example.net', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'wnJbnamhYB', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(13, 'Prof. Amos Orn', 'diana56@example.net', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'Q8BkTMM6JC', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(14, 'Mr. Julio Frami III', 'jwiza@example.net', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'xpHgw4V5aG', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(15, 'Kaylee Lynch', 'gus.runolfsdottir@example.net', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'tmi8BhZdgr', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(16, 'Bell Herman', 'gjacobson@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'vNQNbvQDPq', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(17, 'Dr. Edwin Hintz MD', 'tjerde@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'jcNRD9OyPP', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(18, 'Dr. Tevin Muller V', 'ylesch@example.net', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'Uuy29e0RWv', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(19, 'Barton Shields', 'wunsch.kirk@example.com', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'dTLYy3LcIQ', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(20, 'Lilyan Hoeger DVM', 'egerlach@example.net', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'MMXukGARKv', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(21, 'Donato Crooks', 'mparisian@example.com', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, '0EvxVeIOsJ', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(22, 'Jeffry Casper', 'harvey.hickle@example.net', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'dJeLGIqXeB', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(23, 'Cullen Oberbrunner', 'evalyn.leuschke@example.net', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'NvuPtdM20B', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(24, 'Aubrey Buckridge', 'ricky57@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'RbcwUL8Xfu', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(25, 'Euna Carroll', 'fabian54@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 't5XFuWgu4Y', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(26, 'Dr. Nolan Reichel', 'wisozk.yazmin@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'XC77j5euZS', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(27, 'Elody Schultz', 'legros.mikel@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'Zx8U6xkHnc', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(28, 'Dr. Kaley Homenick', 'kreichel@example.com', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'bSWuMnf4yR', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(29, 'Mr. Douglas Cole II', 'toy.macey@example.net', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'WYNmqK4OWl', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(30, 'Verna Erdman', 'mittie.reichert@example.com', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'R4uDyqfJnZ', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(31, 'Delta Hudson', 'mateo.veum@example.com', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, '0lAjQQjJvi', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(32, 'Dr. Shea Towne DVM', 'jarred.mante@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'dqahiCChCm', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(33, 'Ambrose Stanton', 'gulgowski.zelda@example.net', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'NLUJSvNju6', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(34, 'Eugenia Adams', 'yohara@example.com', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'jSZSHbbVpd', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(35, 'Favian Collins', 'krajcik.alexander@example.com', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, '0zq79igAEF', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(36, 'Prof. Juwan Corwin II', 'toby.hudson@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'kZ66nFHosL', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(37, 'Kailyn Stoltenberg', 'wcassin@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'oZRik8ZdA4', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(38, 'Alva Trantow', 'rowena.daugherty@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'pdJHyQEyOI', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(39, 'Mr. Irwin Bahringer I', 'kyla.quitzon@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'OTzuK2xN4I', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(40, 'Marshall Lubowitz', 'gbradtke@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'TUVa6TsJiq', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(41, 'Miss Cayla Franecki DDS', 'karelle78@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'u5FvmasZiQ', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(42, 'Olin Hoeger', 'mariela.bins@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'uQgNZQPAoh', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(43, 'Addison Beier', 'thiel.nels@example.com', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'SRqLhxxCBG', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(44, 'Craig Friesen', 'kathleen.kovacek@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'o4W9Rp8PMw', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(45, 'Dr. Larue Schmitt', 'moses.hauck@example.net', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'VMXqEdl6t3', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(46, 'Larissa Blick', 'kuvalis.bernardo@example.com', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'C7Tf6u2Mx2', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(47, 'Zelma Reichel', 'brakus.aisha@example.com', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'l12mbVDjjq', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(48, 'Kasey Abernathy', 'jcole@example.com', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'A8IgNlYvDq', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(49, 'Mr. Danial Oberbrunner', 'kemmer.laisha@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'S2VxCKECMX', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(50, 'Ashleigh Grimes', 'heaney.florida@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'vLCeOKSlTN', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(51, 'Megane Towne', 'von.abelardo@example.net', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'w53cyuKWGv', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(52, 'Parker Wisoky', 'darren43@example.net', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'K8qmPFEgMc', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(53, 'Olin Medhurst', 'craig89@example.net', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'twoOWpkTu6', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(54, 'Reinhold Leuschke', 'franco.daugherty@example.com', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'n3WfOywoN0', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(55, 'Jayme Boehm', 'qkessler@example.net', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'UT1kl3wsiZ', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(56, 'Waldo Koch DDS', 'vkovacek@example.com', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'azUh6M6twk', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(57, 'Prof. Karlie Paucek Jr.', 'marshall.wunsch@example.com', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, '3OHyH2ZgqT', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(58, 'Mr. Reilly Schneider', 'joyce.harris@example.com', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'PDazoBAO9z', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(59, 'Corine Rice', 'kameron47@example.net', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, '4aVe1AAaTv', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(60, 'Dr. Donna Tillman', 'marguerite88@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'w4P5DneFYb', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(61, 'Jedediah Feil', 'vincent33@example.net', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, '5XRhRhCffr', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(62, 'Perry Hermann', 'lemuel.champlin@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'PuRD3tLpYc', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(63, 'Miss Elinore Rowe Jr.', 'gbauch@example.net', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'LEIzx4GhM3', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(64, 'Elissa Blick', 'maximilian52@example.net', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'CNCVZmabqZ', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(65, 'Kiarra Ondricka', 'terry.zena@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'zDqpSxUT8P', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(66, 'Ms. Tania Padberg DDS', 'dach.cecilia@example.net', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'dnQhA5rJz6', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(67, 'Hannah Cole', 'soreilly@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'L1BufozH0A', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(68, 'Lavon Beier', 'edmund05@example.net', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'UCmpdiMKu1', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(69, 'Prof. Tate Rau Jr.', 'swift.estefania@example.net', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'ehOpTgKMnE', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(70, 'Jarret Eichmann', 'lebsack.drew@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'OomsWlsfB9', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(71, 'Prof. Rodger Haley V', 'jayne.gulgowski@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'oHHC68dnPC', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(72, 'Frida Hickle', 'conn.elian@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'wbEg4vhuE7', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(73, 'Earlene Schinner', 'carleton23@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'w2NRdgbwTc', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(74, 'Mr. Hassan Kris DVM', 'aimee.towne@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'kVYQvIWlVj', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(75, 'Kole Glover', 'treva.hermiston@example.net', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'X8vzaGKvtM', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(76, 'Beulah Feil', 'ipredovic@example.net', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'IrVswun5EA', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(77, 'Prof. Mitchell Senger Jr.', 'jaquan24@example.net', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'A1lwePqOd0', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(78, 'Tremaine Thompson', 'caitlyn.pacocha@example.com', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'yqTvAlhCYn', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(79, 'Chyna Bechtelar Jr.', 'fmorar@example.net', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'JmEWakZkUT', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(80, 'Cordie Russel IV', 'medhurst.liam@example.net', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'sVzmezvAOy', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(81, 'Aiden Hudson', 'gilbert60@example.com', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'bLfEPETOB2', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(82, 'Carolyn Feest', 'huels.aileen@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'bbzOaGSlfU', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(83, 'Raoul Cummings', 'stewart.graham@example.net', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'FaZ0tYoKMG', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(84, 'Dr. Louvenia Tillman V', 'laurianne.hyatt@example.net', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'ixOcTjGl2o', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(85, 'Prof. Liam Feest Sr.', 'hegmann.freda@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'mxUD7UgkaT', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(86, 'Kaylee Hane', 'daniel.rhoda@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'T4EFzqQD7s', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(87, 'Dusty Prohaska', 'xullrich@example.com', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'GlJ991nrp3', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(88, 'Miss Zula Boyle', 'thaddeus.schinner@example.com', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'VcLs5pubPd', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(89, 'Elian Funk', 'amari.kuvalis@example.com', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'rorPHxlOp4', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(90, 'Savion Greenfelder', 'wking@example.com', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'jDHRwBTlgt', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(91, 'Moises King', 'haag.yoshiko@example.com', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'hcO5dhsXDt', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(92, 'Jonathon Beahan', 'emmerich.jude@example.com', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'c6nn7Of9y1', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(93, 'Olga Greenholt', 'quitzon.amir@example.com', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'vCTOtQv3e5', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(94, 'Grover Steuber', 'xolson@example.com', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'E3OwiGJf7i', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(95, 'Rolando Marvin', 'qkunze@example.net', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, '2b5WNiNrwo', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(96, 'Mr. Johnny Kuhn', 'obeahan@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'Kmv5ddBMs0', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(97, 'Karl Kris', 'gerard.vonrueden@example.net', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'zFjcvMGXcy', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(98, 'Lemuel Lynch', 'lelia03@example.com', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'JRuDpKU23d', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(99, 'Salvador Runolfsson', 'lionel38@example.com', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'hBUixwuKvx', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(100, 'Prof. Ayla Considine DVM', 'dovie.torp@example.org', '2020-09-27 11:17:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, NULL, 'QzYsmX16AI', '2020-09-27 11:17:10', '2020-09-27 11:17:10'),
(101, 'Hasan', 'a@a.com', NULL, '$2y$10$6TwzaNodjBMaINoKSbrg2.f4Wm/yj2T77QGzI/Owfy/DF/IB5iD/u', 39, 'dv0w4iZHJytn1UwGvMoz67zlPRgjUMdMfJrsLYgGuLdp0WqMqzByvvQ3pg3436zvD20TiszfzlKoOI2e', NULL, '2020-09-27 11:21:23', '2020-11-30 09:51:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
