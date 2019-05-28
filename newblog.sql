-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2019 at 05:47 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Php', 'php', 'php-2019-05-19-5ce1a8b61a01f.png', '2019-05-19 13:04:22', '2019-05-19 13:04:22'),
(2, 'Vue js', 'vue-js', 'vue-js-2019-05-20-5ce27acd69fc5.jpg', '2019-05-20 04:00:46', '2019-05-20 04:00:46'),
(3, 'Java', 'java', 'java-2019-05-20-5ce27ade84028.png', '2019-05-20 04:01:02', '2019-05-20 04:01:02'),
(4, 'Laravel', 'laravel', 'laravel-2019-05-20-5ce2e02aa878b.jpg', '2019-05-20 11:13:16', '2019-05-20 11:13:16'),
(5, 'বাংলাদেশ', 'বাংলাদেশ', '-2019-05-22-5ce574519e8ac.jpg', '2019-05-22 10:09:54', '2019-05-22 10:09:54'),
(6, 'Angula js', 'angula-js', 'angula-js-2019-05-24-5ce7bb7c10039.png', '2019-05-24 03:38:05', '2019-05-24 03:38:05'),
(7, 'Finance', 'finance', 'finance-2019-05-26-5cea42ab0d4a8.jpg', '2019-05-26 01:39:25', '2019-05-26 01:39:25');

-- --------------------------------------------------------

--
-- Table structure for table `category_post`
--

CREATE TABLE `category_post` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_post`
--

INSERT INTO `category_post` (`id`, `post_id`, `category_id`, `created_at`, `updated_at`) VALUES
(6, 4, 3, '2019-05-20 04:07:41', '2019-05-20 04:07:41'),
(7, 5, 3, '2019-05-20 04:11:00', '2019-05-20 04:11:00'),
(11, 9, 3, '2019-05-20 11:09:07', '2019-05-20 11:09:07'),
(12, 10, 4, '2019-05-20 11:14:47', '2019-05-20 11:14:47'),
(13, 11, 4, '2019-05-20 11:18:40', '2019-05-20 11:18:40'),
(17, 12, 5, '2019-05-22 10:11:32', '2019-05-22 10:11:32'),
(18, 13, 5, '2019-05-22 10:13:42', '2019-05-22 10:13:42'),
(20, 15, 6, '2019-05-24 04:01:25', '2019-05-24 04:01:25'),
(21, 16, 2, '2019-05-25 13:29:34', '2019-05-25 13:29:34'),
(22, 16, 3, '2019-05-25 13:29:34', '2019-05-25 13:29:34'),
(23, 16, 4, '2019-05-25 13:29:34', '2019-05-25 13:29:34'),
(24, 16, 5, '2019-05-25 13:29:34', '2019-05-25 13:29:34'),
(25, 17, 7, '2019-05-26 01:42:33', '2019-05-26 01:42:33');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `comment`, `created_at`, `updated_at`) VALUES
(5, 10, 1, 'Nice Post', '2019-05-23 11:19:21', '2019-05-23 11:19:21'),
(6, 9, 3, 'This is helpfull post for learning java', '2019-05-26 04:09:23', '2019-05-26 04:09:23');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'default', '{\"displayName\":\"App\\\\Notifications\\\\NewAuthorPost\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":11:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:31:\\\"App\\\\Notifications\\\\NewAuthorPost\\\":9:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\Post\\\";s:2:\\\"id\\\";i:12;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"c7b18623-1cbd-49de-88e9-86759e411f13\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1558541496, 1558541496),
(2, 'default', '{\"displayName\":\"App\\\\Notifications\\\\NewAuthorPost\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":11:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:31:\\\"App\\\\Notifications\\\\NewAuthorPost\\\":9:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\Post\\\";s:2:\\\"id\\\";i:13;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"864c5fbf-1720-46a9-88ba-9780b02a28a4\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1558541622, 1558541622),
(3, 'default', '{\"displayName\":\"App\\\\Notifications\\\\AuthorPostApprove\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":11:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:35:\\\"App\\\\Notifications\\\\AuthorPostApprove\\\":9:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\Post\\\";s:2:\\\"id\\\";i:12;s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"f383e4f1-22fb-4c30-8dcb-bd7b98f9ad97\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1558541664, 1558541664),
(4, 'default', '{\"displayName\":\"App\\\\Notifications\\\\AuthorPostApprove\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":11:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:35:\\\"App\\\\Notifications\\\\AuthorPostApprove\\\":9:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\Post\\\";s:2:\\\"id\\\";i:13;s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"7d9c0c74-94a2-4493-9cd0-9e07ca961788\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1558541666, 1558541666),
(5, 'default', '{\"displayName\":\"App\\\\Notifications\\\\NewPostNotify\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":11:{s:11:\\\"notifiables\\\";O:44:\\\"Illuminate\\\\Notifications\\\\AnonymousNotifiable\\\":1:{s:6:\\\"routes\\\";a:1:{s:4:\\\"mail\\\";s:23:\\\"sanowargiit22@gmail.com\\\";}}s:12:\\\"notification\\\";O:31:\\\"App\\\\Notifications\\\\NewPostNotify\\\":9:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\Post\\\";s:2:\\\"id\\\";i:14;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"811b7476-0bc7-42af-acf6-9fda25d14087\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1558690766, 1558690766),
(6, 'default', '{\"displayName\":\"App\\\\Notifications\\\\NewPostNotify\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":11:{s:11:\\\"notifiables\\\";O:44:\\\"Illuminate\\\\Notifications\\\\AnonymousNotifiable\\\":1:{s:6:\\\"routes\\\";a:1:{s:4:\\\"mail\\\";s:26:\\\"mdsanowarhossen4@gmail.com\\\";}}s:12:\\\"notification\\\";O:31:\\\"App\\\\Notifications\\\\NewPostNotify\\\":9:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\Post\\\";s:2:\\\"id\\\";i:14;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"7fd770fa-7e40-4963-85d6-e008abddf3f5\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1558690766, 1558690766),
(7, 'default', '{\"displayName\":\"App\\\\Notifications\\\\NewPostNotify\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":11:{s:11:\\\"notifiables\\\";O:44:\\\"Illuminate\\\\Notifications\\\\AnonymousNotifiable\\\":1:{s:6:\\\"routes\\\";a:1:{s:4:\\\"mail\\\";s:23:\\\"sanowargiit22@gmail.com\\\";}}s:12:\\\"notification\\\";O:31:\\\"App\\\\Notifications\\\\NewPostNotify\\\":9:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\Post\\\";s:2:\\\"id\\\";i:15;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"cd447477-d44f-4055-a51d-1f499890d761\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1558692087, 1558692087),
(8, 'default', '{\"displayName\":\"App\\\\Notifications\\\\NewPostNotify\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":11:{s:11:\\\"notifiables\\\";O:44:\\\"Illuminate\\\\Notifications\\\\AnonymousNotifiable\\\":1:{s:6:\\\"routes\\\";a:1:{s:4:\\\"mail\\\";s:26:\\\"mdsanowarhossen4@gmail.com\\\";}}s:12:\\\"notification\\\";O:31:\\\"App\\\\Notifications\\\\NewPostNotify\\\":9:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\Post\\\";s:2:\\\"id\\\";i:15;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"29eeed43-6140-4fa4-b036-70ac5f1f126f\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1558692087, 1558692087),
(9, 'default', '{\"displayName\":\"App\\\\Notifications\\\\NewAuthorPost\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":11:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:31:\\\"App\\\\Notifications\\\\NewAuthorPost\\\":9:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\Post\\\";s:2:\\\"id\\\";i:16;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"71773524-99df-41ef-bc7d-5c5107ce6bbd\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1558812575, 1558812575),
(10, 'default', '{\"displayName\":\"App\\\\Notifications\\\\AuthorPostApprove\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":11:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:35:\\\"App\\\\Notifications\\\\AuthorPostApprove\\\":9:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\Post\\\";s:2:\\\"id\\\";i:16;s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"321b7430-4673-4b60-aa28-bea593ae2976\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1558812590, 1558812590),
(11, 'default', '{\"displayName\":\"App\\\\Notifications\\\\NewAuthorPost\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":11:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:31:\\\"App\\\\Notifications\\\\NewAuthorPost\\\":9:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\Post\\\";s:2:\\\"id\\\";i:17;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"2539c500-eb74-48e0-b243-9273341c34ff\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1558856554, 1558856554),
(12, 'default', '{\"displayName\":\"App\\\\Notifications\\\\AuthorPostApprove\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":11:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:12:\\\"notification\\\";O:35:\\\"App\\\\Notifications\\\\AuthorPostApprove\\\":9:{s:4:\\\"post\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\Post\\\";s:2:\\\"id\\\";i:17;s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:2:\\\"id\\\";s:36:\\\"665a1e00-8b37-43fd-a2ab-ce129bbeeef5\\\";s:6:\\\"locale\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1558865988, 1558865988);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(6, '2019_05_14_222905_create_posts_table', 1),
(9, '2019_05_18_083749_create_posts_table', 2),
(10, '2019_05_18_084323_create_posts_table', 3),
(11, '2019_05_18_094502_create_posts_table', 4),
(12, '2019_05_18_095153_create_posts_table', 5),
(29, '2019_05_19_183636_create_posts_table', 6),
(39, '2014_10_12_000000_create_users_table', 7),
(40, '2014_10_12_100000_create_password_resets_table', 7),
(41, '2019_05_08_101444_create_roles_table', 7),
(42, '2019_05_09_120924_create_tags_table', 7),
(43, '2019_05_10_094153_create_categories_table', 7),
(44, '2019_05_14_223735_create_category_post_table', 7),
(45, '2019_05_14_224621_create_post_tag_table', 7),
(46, '2019_05_19_185630_create_posts_table', 7),
(47, '2019_05_19_190030_create_posts_table', 8),
(48, '2019_05_19_202153_create_subscribars_table', 9),
(49, '2019_05_20_095832_create_posts_table', 10),
(50, '2019_05_20_162653_create_jobs_table', 11),
(51, '2019_05_21_184320_create_post_user_table', 12),
(52, '2019_05_23_103530_create_comments_table', 13);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `view_count` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_approved` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `slug`, `image`, `body`, `view_count`, `status`, `is_approved`, `created_at`, `updated_at`) VALUES
(4, 1, 'What is Java Programming language?', 'what-is-java-programming-language', 'what-is-java-programming-language-2019-05-20-5ce27c6d1ace1.png', '<p>Java is a high-level programming language originally developed by Sun Microsystems and released in 1995. Java runs on a variety of platforms, such as Windows, Mac OS, and the various versions of UNIX. This tutorial gives a complete understanding of Java. This reference will take you through simple and practical approaches while learning Java Programming language.</p>\r\n<h1>Java - Overview</h1>\r\n<p>Java programming language was originally developed by Sun Microsystems which was initiated by James Gosling and released in 1995 as core component of Sun Microsystems\' Java platform (Java 1.0 [J2SE]).</p>\r\n<p>The latest release of the Java Standard Edition is Java SE 8. With the advancement of Java and its widespread popularity, multiple configurations were built to suit various types of platforms. For example: J2EE for Enterprise Applications, J2ME for Mobile Applications.</p>\r\n<p>The new J2 versions were renamed as Java SE, Java EE, and Java ME respectively. Java is guaranteed to be&nbsp;<strong>Write Once, Run Anywhere.</strong></p>\r\n<p>Java is &minus;</p>\r\n<ul class=\"list\">\r\n<li>\r\n<p><strong>Object Oriented</strong>&nbsp;&minus; In Java, everything is an Object. Java can be easily extended since it is based on the Object model.</p>\r\n</li>\r\n<li>\r\n<p><strong>Platform Independent</strong>&nbsp;&minus; Unlike many other programming languages including C and C++, when Java is compiled, it is not compiled into platform specific machine, rather into platform independent byte code. This byte code is distributed over the web and interpreted by the Virtual Machine (JVM) on whichever platform it is being run on.</p>\r\n</li>\r\n<li>\r\n<p><strong>Simple</strong>&nbsp;&minus; Java is designed to be easy to learn. If you understand the basic concept of OOP Java, it would be easy to master.</p>\r\n</li>\r\n<li>\r\n<p><strong>Secure</strong>&nbsp;&minus; With Java\'s secure feature it enables to develop virus-free, tamper-free systems. Authentication techniques are based on public-key encryption.</p>\r\n</li>\r\n<li>\r\n<p><strong>Architecture-neutral</strong>&nbsp;&minus; Java compiler generates an architecture-neutral object file format, which makes the compiled code executable on many processors, with the presence of Java runtime system.</p>\r\n</li>\r\n<li>\r\n<p><strong>Portable</strong>&nbsp;&minus; Being architecture-neutral and having no implementation dependent aspects of the specification makes Java portable. Compiler in Java is written in ANSI C with a clean portability boundary, which is a POSIX subset.</p>\r\n</li>\r\n<li>\r\n<p><strong>Robust</strong>&nbsp;&minus; Java makes an effort to eliminate error prone situations by emphasizing mainly on compile time error checking and runtime checking.</p>\r\n</li>\r\n<li>\r\n<p><strong>Multithreaded</strong>&nbsp;&minus; With Java\'s multithreaded feature it is possible to write programs that can perform many tasks simultaneously. This design feature allows the developers to construct interactive applications that can run smoothly.</p>\r\n</li>\r\n<li>\r\n<p><strong>Interpreted</strong>&nbsp;&minus; Java byte code is translated on the fly to native machine instructions and is not stored anywhere. The development process is more rapid and analytical since the linking is an incremental and light-weight process.</p>\r\n</li>\r\n<li>\r\n<p><strong>High Performance</strong>&nbsp;&minus; With the use of Just-In-Time compilers, Java enables high performance.</p>\r\n</li>\r\n<li>\r\n<p><strong>Distributed</strong>&nbsp;&minus; Java is designed for the distributed environment of the internet.</p>\r\n</li>\r\n<li>\r\n<p><strong>Dynamic</strong>&nbsp;&minus; Java is considered to be more dynamic than C or C++ since it is designed to adapt to an evolving environment. Java programs can carry extensive amount of run-time information that can be used to verify and resolve accesses to objects on run-time.</p>\r\n</li>\r\n</ul>', '1', 1, 1, '2019-05-20 04:07:41', '2019-05-23 13:31:41'),
(5, 1, 'History of Java', 'history-of-java', 'history-of-java-2019-05-20-5ce27d348336d.jpeg', '<p>James Gosling initiated Java language project in June 1991 for use in one of his many set-top box projects. The language, initially called &lsquo;Oak&rsquo; after an oak tree that stood outside Gosling\'s office, also went by the name &lsquo;Green&rsquo; and ended up later being renamed as Java, from a list of random words.</p>\r\n<p>Sun released the first public implementation as Java 1.0 in 1995. It promised&nbsp;<strong>Write Once, Run Anywhere</strong>&nbsp;(WORA), providing no-cost run-times on popular platforms.</p>\r\n<p>On 13 November, 2006, Sun released much of Java as free and open source software under the terms of the GNU General Public License (GPL).</p>\r\n<p>On 8 May, 2007, Sun finished the process, making all of Java\'s core code free and open-source, aside from a small portion of code to which Sun did not hold the copyright.</p>\r\n<h2>Tools You Will Need</h2>\r\n<p>For performing the examples discussed in this tutorial, you will need a Pentium 200-MHz computer with a minimum of 64 MB of RAM (128 MB of RAM recommended).</p>\r\n<p>You will also need the following softwares &minus;</p>\r\n<ul class=\"list\">\r\n<li>Linux 7.1 or Windows xp/7/8 operating system</li>\r\n<li>Java JDK 8</li>\r\n<li>Microsoft Notepad or any other text editor</li>\r\n</ul>\r\n<p>This tutorial will provide the necessary skills to create GUI, networking, and web applications using Java.</p>\r\n<h2>What is Next?</h2>\r\n<p>The next chapter will guide you to how you can obtain Java and its documentation. Finally, it instructs you on how to install Java and prepare an environment to develop Java applications.</p>', '2', 1, 1, '2019-05-20 04:11:00', '2019-05-25 14:08:22'),
(9, 1, 'Java - Environment Setup', 'java-environment-setup', 'java-environment-setup-2019-05-20-5ce2df3256fba.jpeg', '<p>In this chapter, we will discuss on the different aspects of setting up a congenial environment for Java.</p>\r\n<h2>Local Environment Setup</h2>\r\n<p>If you are still willing to set up your environment for Java programming language, then this section guides you on how to download and set up Java on your machine. Following are the steps to set up the environment.</p>\r\n<p>Java SE is freely available from the link&nbsp;<a href=\"https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html\" target=\"_blank\" rel=\"nofollow\">Download Java</a>. You can download a version based on your operating system.</p>\r\n<p>Follow the instructions to download Java and run the&nbsp;<strong>.exe</strong>&nbsp;to install Java on your machine. Once you installed Java on your machine, you will need to set environment variables to point to correct installation directories &minus;</p>\r\n<h3>Setting Up the Path for Windows</h3>\r\n<p>Assuming you have installed Java in&nbsp;<em>c:\\Program Files\\java\\jdk</em>&nbsp;directory &minus;</p>\r\n<ul class=\"list\">\r\n<li>\r\n<p>Right-click on \'My Computer\' and select \'Properties\'.</p>\r\n</li>\r\n<li>\r\n<p>Click the \'Environment variables\' button under the \'Advanced\' tab.</p>\r\n</li>\r\n<li>\r\n<p>Now, alter the \'Path\' variable so that it also contains the path to the Java executable. Example, if the path is currently set to \'C:\\WINDOWS\\SYSTEM32\', then change your path to read \'C:\\WINDOWS\\SYSTEM32;c:\\Program Files\\java\\jdk\\bin\'.</p>\r\n</li>\r\n</ul>\r\n<h3>Setting Up the Path for Linux, UNIX, Solaris, FreeBSD</h3>\r\n<p>Environment variable PATH should be set to point to where the Java binaries have been installed. Refer to your shell documentation, if you have trouble doing this.</p>\r\n<p>Example, if you use&nbsp;<em>bash</em>&nbsp;as your shell, then you would add the following line to the end of your \'.bashrc: export PATH = /path/to/java:$PATH\'</p>\r\n<h2>Popular Java Editors</h2>\r\n<p>To write your Java programs, you will need a text editor. There are even more sophisticated IDEs available in the market. But for now, you can consider one of the following &minus;</p>\r\n<ul class=\"list\">\r\n<li>\r\n<p><strong>Notepad</strong>&nbsp;&minus; On Windows machine, you can use any simple text editor like Notepad (Recommended for this tutorial), TextPad.</p>\r\n</li>\r\n<li>\r\n<p><strong>Netbeans</strong>&nbsp;&minus; A Java IDE that is open-source and free which can be downloaded from&nbsp;<a href=\"https://www.netbeans.org/index.html\" target=\"_blank\" rel=\"nofollow\">https://www.netbeans.org/index.html</a>.</p>\r\n</li>\r\n<li>\r\n<p><strong>Eclipse</strong>&nbsp;&minus; A Java IDE developed by the eclipse open-source community and can be downloaded from&nbsp;<a href=\"https://www.eclipse.org/\" target=\"_blank\" rel=\"nofollow\">https://www.eclipse.org/</a>.</p>\r\n</li>\r\n</ul>\r\n<h2>What is Next?</h2>\r\n<p>Next chapter will teach you how to write and run your first Java program and some of the important basic syntaxes in Java needed for developing applications.</p>', '2', 1, 1, '2019-05-20 11:09:07', '2019-05-26 04:07:59'),
(10, 1, 'What is Laravel framwork ?', 'what-is-laravel-framwork', 'what-is-laravel-framwork-2019-05-20-5ce2e08700599.jpg', '<p>Laravel is a powerful MVC PHP framework, designed for developers who need a simple and elegant toolkit to create full-featured web applications. Laravel was created by Taylor Otwell. This is a brief tutorial that explains the basics of Laravel framework.</p>', '8', 1, 1, '2019-05-20 11:14:47', '2019-05-26 06:07:39'),
(11, 1, 'Laravel - Overview', 'laravel-overview', 'laravel-overview-2019-05-20-5ce2e1709831c.jpg', '<p>Laravel is an open-source PHP framework, which is robust and easy to understand. It follows a model-view-controller design pattern. Laravel reuses the existing components of different frameworks which helps in creating a web application. The web application thus designed is more structured and pragmatic.</p>\r\n<p>Laravel offers a rich set of functionalities which incorporates the basic features of PHP frameworks like CodeIgniter, Yii and other programming languages like Ruby on Rails. Laravel has a very rich set of features which will boost the speed of web development.</p>\r\n<p>If you are familiar with Core PHP and Advanced PHP, Laravel will make your task easier. It saves a lot time if you are planning to develop a website from scratch. Moreover, a website built in Laravel is secure and prevents several web attacks.</p>\r\n<h2>Advantages of Laravel</h2>\r\n<p>Laravel offers you the following advantages, when you are designing a web application based on it &minus;</p>\r\n<ul class=\"list\">\r\n<li>\r\n<p>The web application becomes more scalable, owing to the Laravel framework.</p>\r\n</li>\r\n<li>\r\n<p>Considerable time is saved in designing the web application, since Laravel reuses the components from other framework in developing web application.</p>\r\n</li>\r\n<li>\r\n<p>It includes namespaces and interfaces, thus helps to organize and manage resources.</p>\r\n</li>\r\n</ul>\r\n<h3>Composer</h3>\r\n<p>Composer is a tool which includes all the dependencies and libraries. It allows a user to create a project with respect to the mentioned framework (for example, those used in Laravel installation). Third party libraries can be installed easily with help of composer.</p>\r\n<p>All the dependencies are noted in&nbsp;<strong>composer.json</strong>&nbsp;file which is placed in the source folder.</p>\r\n<h3>Artisan</h3>\r\n<p>Command line interface used in Laravel is called&nbsp;<strong>Artisan</strong>. It includes a set of commands which assists in building a web application. These commands are incorporated from Symphony framework, resulting in add-on features in Laravel 5.1 (latest version of Laravel).</p>\r\n<h2>Features of Laravel</h2>\r\n<p>Laravel offers the following key features which makes it an ideal choice for designing web applications &minus;</p>\r\n<h3>Modularity</h3>\r\n<p>Laravel provides 20 built in libraries and modules which helps in enhancement of the application. Every module is integrated with Composer dependency manager which eases updates.</p>\r\n<h3>Testability</h3>\r\n<p>Laravel includes features and helpers which helps in testing through various test cases. This feature helps in maintaining the code as per the requirements.</p>\r\n<h3>Routing</h3>\r\n<p>Laravel provides a flexible approach to the user to define routes in the web application. Routing helps to scale the application in a better way and increases its performance.</p>\r\n<h3>Configuration Management</h3>\r\n<p>A web application designed in Laravel will be running on different environments, which means that there will be a constant change in its configuration. Laravel provides a consistent approach to handle the configuration in an efficient way.</p>\r\n<h3>Query Builder and ORM</h3>\r\n<p>Laravel incorporates a query builder which helps in querying databases using various simple chain methods. It provides&nbsp;<strong>ORM</strong>&nbsp;(Object Relational Mapper) and&nbsp;<strong>ActiveRecord</strong>&nbsp;implementation called Eloquent.</p>\r\n<h3>Schema Builder</h3>\r\n<p>Schema Builder maintains the database definitions and schema in PHP code. It also maintains a track of changes with respect to database migrations.</p>\r\n<h3>Template Engine</h3>\r\n<p>Laravel uses the&nbsp;<strong>Blade Template</strong>&nbsp;engine, a lightweight template language used to design hierarchical blocks and layouts with predefined blocks that include dynamic content.</p>\r\n<h3>E-mail</h3>\r\n<p>Laravel includes a&nbsp;<strong>mail</strong>&nbsp;class which helps in sending mail with rich content and attachments from the web application.</p>\r\n<h3>Authentication</h3>\r\n<p>User authentication is a common feature in web applications. Laravel eases designing authentication as it includes features such as&nbsp;<strong>register, forgot password</strong>&nbsp;and&nbsp;<strong>send password reminders</strong>.</p>\r\n<h3>Redis</h3>\r\n<p>Laravel uses&nbsp;<strong>Redis</strong>&nbsp;to connect to an existing session and general-purpose cache. Redis interacts with session directly.</p>\r\n<h3>Queues</h3>\r\n<p>Laravel includes queue services like emailing large number of users or a specified&nbsp;<strong>Cron</strong>&nbsp;job. These queues help in completing tasks in an easier manner without waiting for the previous task to be completed.</p>\r\n<h3>Event and Command Bus</h3>\r\n<p>Laravel 5.1 includes&nbsp;<strong>Command Bus</strong>&nbsp;which helps in executing commands and dispatch events in a simple way. The commands in Laravel act as per the application&rsquo;s lifecycle.</p>', '4', 1, 1, '2019-05-20 11:18:40', '2019-05-24 04:30:25'),
(13, 1, 'রেললাইনের পাশে সাংবাদিকের লাশ', '', '-2019-05-22-5ce575360c679.jpg', '<p>জামালপুর সদর উপজেলায় রেললাইনের পাশ থেকে মঙ্গলবার রাতে ইহসান রেজার (২২) লাশ উদ্ধার করা হয়েছে। তিনি ঢাকায় একটি অনলাইন নিউজ পোর্টালের সহসম্পাদক হিসেবে কাজ করতেন বলে জানিয়েছে পুলিশ।<br /><br />ইহসান রেজা শেরপুর পৌর শহরের চকবাজার এলাকার সাংবাদিক কাকন রেজার ছেলে। কাকন রেজা সাপ্তাহিক শেরপুর পত্রিকার সম্পাদক। ইহসান ঢাকার তেজগাঁও কলেজের স্নাতক (অনার্স) দ্বিতীয় বর্ষের ছাত্র।</p>\r\n<p>পুলিশ ও স্থানীয় সূত্রে জানা গেছে, সদর উপজেলার নান্দিনা বন্ধপাড়া এলাকার রেললাইনের পাশে গতকাল রাতে অজ্ঞাত এক যুবকের লাশ পড়ে থাকতে দেখেন স্থানীয় লোকজন। খবর পেয়ে রাত ১১টার দিকে পুলিশ লাশটি থানায় নিয়ে যায়। এরপর আজ বুধবার সকালে অজ্ঞাত হিসেবে লাশটি ময়নাতদন্তের জন্য জামালপুর জেনারেল হাসপাতালের মর্গে পাঠানো হয়। পরে পরিবারের লোকজন খবর পেয়ে মর্গে গিয়ে ইহসানের লাশ শনাক্ত করে।</p>\r\n<p>নিহতের বাবা কাকন রেজা সাংবাদিকদের বলেন, গতকাল সন্ধ্যা সাড়ে সাতটার দিকে মুঠোফোনে ইহসানের সঙ্গে তাঁর কথা হয়। ঢাকা থেকে শেরপুরের বাড়িতে আসছে। এরপর রাতে আর বাড়ি ফেরেনি ইহসান। আজ বিকেলের দিকে মর্গে গিয়ে তিনি ছেলের লাশ শনাক্ত করেন। কাকন রেজার ভাষ্য, তাঁর ছেলের সঙ্গে কারও শত্রুতা ছিল না। এটা হত্যা না দুর্ঘটনা, এই মুহূর্তে তিনি তা ধারণা করতে পারছেন না।</p>\r\n<p>জামালপুর রেলওয়ে থানার ভারপ্রাপ্ত কর্মকর্তা (ওসি) তাপস চন্দ্র পণ্ডিত প্রথম আলোকে বলেন, &lsquo;অজ্ঞাত হিসেবে লাশটি উদ্ধার করা হয়। গতকাল রাত ৯টা থেকে ১১টার মধ্যে এই রুটে তিনটি ট্রেন চলাচল করে। ওই তিনটি ট্রেনের কোনো একটি থেকে হয়তো পড়েও যেতে পারেন ইহসান। তাঁর শারীরে তেমন কোনো আঘাতের চিহ্ন পাওয়া যায়নি। তবে মাথায় আঘাত থাকতে পারে। এ ঘটনায় থানায় একটি অপমৃত্যুর মামলা হয়েছে।&rsquo;</p>', '3', 0, 1, '2019-05-22 10:13:42', '2019-05-24 03:51:37'),
(15, 1, 'What is Angular js ?', 'what-is-angular-js', 'what-is-angular-js-2019-05-24-5ce7c0f4ca523.png', '<p><strong>AngularJS</strong>&nbsp;is a very powerful JavaScript Framework. It is used in Single Page Application (SPA) projects. It extends HTML DOM with additional attributes and makes it more responsive to user actions. AngularJS is open source, completely free, and used by thousands of developers around the world. It is licensed under the Apache license version 2.0.</p>', '3', 1, 1, '2019-05-24 04:01:25', '2019-05-26 00:41:13'),
(16, 3, 'This is New post', 'this-is-new-post', 'this-is-new-post-2019-05-25-5ce9979d87514.jpg', '<p>This is new post</p>', '5', 1, 1, '2019-05-25 13:29:34', '2019-05-26 07:06:53'),
(17, 3, 'Areas of financ', 'areas-of-financ', 'areas-of-financ-2019-05-26-5cea43680b311.jpg', '<h3><span id=\"Personal_finance\" class=\"mw-headline\">Personal finance</span><span class=\"mw-editsection\"><span class=\"mw-editsection-bracket\">[</span><a title=\"Edit section: Personal finance\" href=\"https://en.wikipedia.org/w/index.php?title=Finance&amp;action=edit&amp;section=2\">edit</a><span class=\"mw-editsection-bracket\">]</span></span></h3>\r\n<div class=\"hatnote navigation-not-searchable\">Main article:&nbsp;<a title=\"Personal finance\" href=\"https://en.wikipedia.org/wiki/Personal_finance\">Personal finance</a></div>\r\n<p>Matters in personal finance revolve around:</p>\r\n<ul>\r\n<li>Protection against unforeseen personal events, as well as events in the wider economies</li>\r\n<li>Transference of family wealth across generations (bequests and inheritance)</li>\r\n<li>Effects of tax policies (tax subsidies or penalties) management of personal finances</li>\r\n<li>Effects of credit on individual financial standing</li>\r\n<li>Development of a savings plan or financing for large purchases (auto, education, home)</li>\r\n<li>Planning a secure financial future in an environment of economic instability</li>\r\n<li>Pursuing a checking and/or a savings account</li>\r\n<li>Preparation for retirement/ long term expenses</li>\r\n</ul>\r\n<p>Personal finance may involve paying for education, financing&nbsp;<a title=\"Durable good\" href=\"https://en.wikipedia.org/wiki/Durable_good\">durable goods</a>&nbsp;such as&nbsp;<a title=\"Real estate\" href=\"https://en.wikipedia.org/wiki/Real_estate\">real estate</a>&nbsp;and cars, buying&nbsp;<a title=\"Insurance\" href=\"https://en.wikipedia.org/wiki/Insurance\">insurance</a>, e.g. health and property insurance, investing and saving for&nbsp;<a title=\"Retirement\" href=\"https://en.wikipedia.org/wiki/Retirement\">retirement</a>.</p>\r\n<p>Personal finance may also involve paying for a loan, or debt obligations. The six key areas of personal financial planning, as suggested by the Financial Planning Standards Board, are:<sup id=\"cite_ref-2\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Finance#cite_note-2\">[2]</a></sup></p>\r\n<ol>\r\n<li><strong>Financial position</strong>: is concerned with understanding the personal resources available by examining net worth and household cash flows. Net worth is a person\'s balance sheet, calculated by adding up all assets under that person\'s control, minus all liabilities of the household, at one point in time. Household cash flows total up all from the expected sources of income within a year, minus all expected expenses within the same year. From this analysis, the financial planner can determine to what degree and in what time the personal goals can be accomplished. Ratios are frequently used on the corporate level to measure a companies ability to cover its cost given the assets it has on hand. This can be paralleled to an individual level as well. Maintaining a ratio of 2:1 or greater is seen as healthy in this respect.&nbsp;<sup id=\"cite_ref-3\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Finance#cite_note-3\">[3]</a></sup>&nbsp;This means that for every dollar of expenses there is an existing dollar value of assets such as cash to cover that cost.</li>\r\n<li><strong><a title=\"Insurance\" href=\"https://en.wikipedia.org/wiki/Insurance\">Adequate protection</a></strong>: the analysis of how to protect a household from unforeseen risks. These risks can be divided into the following: liability, property, death, disability, health and long term care. Some of these risks may be self-insurable, while most will require the purchase of an insurance contract. Determining how much insurance to get, at the most cost effective terms requires knowledge of the market for personal insurance. Business owners, professionals, athletes and entertainers require specialized insurance professionals to adequately protect themselves. Since insurance also enjoys some tax benefits, utilizing insurance investment products may be a critical piece of the overall investment planning.</li>\r\n<li><strong><a class=\"mw-redirect\" title=\"Tax planning\" href=\"https://en.wikipedia.org/wiki/Tax_planning\">Tax planning</a></strong>: typically the income tax is the single largest expense in a household. Managing taxes is not a question of if you will pay taxes, but when and how much. Government gives many incentives in the form of tax deductions and credits, which can be used to reduce the lifetime tax burden. Most modern governments use a progressive tax. Typically, as one\'s income grows, a higher&nbsp;<a title=\"Tax rate\" href=\"https://en.wikipedia.org/wiki/Tax_rate#Marginal\">marginal rate of tax</a>&nbsp;must be paid. Understanding how to take advantage of the myriad tax breaks when planning one\'s personal finances can make a significant impact in which can later save you money in the long term.</li>\r\n<li><strong>Investment and accumulation goals</strong>: planning how to accumulate enough money &ndash; for large purchases and life events &ndash; is what most people consider to be financial planning. Major reasons to accumulate assets include purchasing a house or car, starting a business, paying for education expenses, and saving for retirement.&nbsp;</li>\r\n<li><strong>Retirement planning</strong>&nbsp;is the process of understanding how much it costs to live at retirement, and coming up with a plan to distribute assets to meet any income shortfall. Methods for retirement plans include taking advantage of government allowed structures to manage tax liability including: individual (<a title=\"Individual retirement account\" href=\"https://en.wikipedia.org/wiki/Individual_retirement_account\">IRA</a>) structures, or employer sponsored&nbsp;<a class=\"mw-redirect\" title=\"Retirement plans\" href=\"https://en.wikipedia.org/wiki/Retirement_plans\">retirement plans</a>, annuities and life insurance products. Often times this field of personal finance is overlooked as many individuals see this being something in their distant future. However, the sooner you start&nbsp;<a class=\"mw-redirect\" title=\"Investing\" href=\"https://en.wikipedia.org/wiki/Investing\">investing</a>&nbsp;the greater likelihood you have for actually being prepared.&nbsp;<sup id=\"cite_ref-4\" class=\"reference\"></sup></li>\r\n<li><strong><a title=\"Estate planning\" href=\"https://en.wikipedia.org/wiki/Estate_planning\">Estate planning</a></strong>&nbsp;involves planning for the disposition of one\'s assets after death. Typically, there is a tax due to the state or federal government at one\'s death. Avoiding these taxes means that more of one\'s assets will be distributed to one\'s heirs. One can leave one\'s assets to family, friends or charitable groups.</li>\r\n</ol>', '0', 1, 0, '2019-05-26 01:42:32', '2019-05-26 06:20:28');

-- --------------------------------------------------------

--
-- Table structure for table `post_tag`
--

CREATE TABLE `post_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tag`
--

INSERT INTO `post_tag` (`id`, `post_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(6, 4, 2, '2019-05-20 04:07:41', '2019-05-20 04:07:41'),
(7, 5, 2, '2019-05-20 04:11:00', '2019-05-20 04:11:00'),
(14, 9, 2, '2019-05-20 11:09:07', '2019-05-20 11:09:07'),
(15, 10, 3, '2019-05-20 11:14:47', '2019-05-20 11:14:47'),
(16, 10, 4, '2019-05-20 11:14:47', '2019-05-20 11:14:47'),
(17, 10, 8, '2019-05-20 11:14:47', '2019-05-20 11:14:47'),
(18, 11, 3, '2019-05-20 11:18:40', '2019-05-20 11:18:40'),
(19, 11, 4, '2019-05-20 11:18:40', '2019-05-20 11:18:40'),
(20, 11, 8, '2019-05-20 11:18:40', '2019-05-20 11:18:40'),
(27, 12, 9, '2019-05-22 10:11:33', '2019-05-22 10:11:33'),
(28, 12, 10, '2019-05-22 10:11:33', '2019-05-22 10:11:33'),
(29, 12, 11, '2019-05-22 10:11:33', '2019-05-22 10:11:33'),
(34, 13, 5, '2019-05-24 03:51:37', '2019-05-24 03:51:37'),
(37, 15, 6, '2019-05-24 04:01:38', '2019-05-24 04:01:38'),
(38, 16, 3, '2019-05-25 13:29:34', '2019-05-25 13:29:34'),
(39, 16, 4, '2019-05-25 13:29:34', '2019-05-25 13:29:34'),
(40, 16, 8, '2019-05-25 13:29:34', '2019-05-25 13:29:34'),
(41, 16, 10, '2019-05-25 13:29:34', '2019-05-25 13:29:34'),
(42, 16, 11, '2019-05-25 13:29:34', '2019-05-25 13:29:34'),
(43, 16, 12, '2019-05-25 13:29:34', '2019-05-25 13:29:34'),
(46, 17, 7, '2019-05-26 02:06:43', '2019-05-26 02:06:43');

-- --------------------------------------------------------

--
-- Table structure for table `post_user`
--

CREATE TABLE `post_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_user`
--

INSERT INTO `post_user` (`id`, `post_id`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 11, 1, '2019-05-22 04:33:51', '2019-05-22 04:33:51'),
(3, 10, 1, '2019-05-22 04:44:20', '2019-05-22 04:44:20'),
(7, 11, 2, '2019-05-22 05:48:55', '2019-05-22 05:48:55'),
(8, 10, 2, '2019-05-22 05:48:57', '2019-05-22 05:48:57'),
(12, 9, 2, '2019-05-22 05:49:12', '2019-05-22 05:49:12'),
(16, 5, 1, '2019-05-23 03:33:26', '2019-05-23 03:33:26'),
(17, 13, 1, '2019-05-23 03:36:24', '2019-05-23 03:36:24'),
(18, 9, 1, '2019-05-23 09:08:53', '2019-05-23 09:08:53'),
(19, 4, 3, '2019-05-25 14:08:05', '2019-05-25 14:08:05'),
(20, 5, 3, '2019-05-25 14:08:09', '2019-05-25 14:08:09'),
(22, 10, 3, '2019-05-25 14:08:17', '2019-05-25 14:08:17'),
(23, 16, 3, '2019-05-25 14:08:36', '2019-05-25 14:08:36'),
(24, 15, 3, '2019-05-26 04:09:39', '2019-05-26 04:09:39'),
(25, 9, 3, '2019-05-26 04:09:45', '2019-05-26 04:09:45'),
(26, 16, 1, '2019-05-26 04:19:59', '2019-05-26 04:19:59');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', NULL, NULL),
(2, 'Author', 'author', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscribars`
--

CREATE TABLE `subscribars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribars`
--

INSERT INTO `subscribars` (`id`, `email`, `created_at`, `updated_at`) VALUES
(2, 'sanowargiit22@gmail.com', '2019-05-19 15:38:49', '2019-05-19 15:38:49'),
(3, 'mdsanowarhossen4@gmail.com', '2019-05-19 15:39:21', '2019-05-19 15:39:21');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(2, 'Java', 'java', '2019-05-20 04:00:19', '2019-05-20 04:00:19'),
(3, 'Laravel', 'laravel', '2019-05-20 04:00:25', '2019-05-20 04:00:25'),
(4, 'Php', 'php', '2019-05-20 04:00:32', '2019-05-20 04:00:32'),
(5, 'Java world', 'java-world', '2019-05-20 11:10:38', '2019-05-20 11:10:38'),
(6, 'Java update', 'java-update', '2019-05-20 11:10:57', '2019-05-20 11:10:57'),
(7, 'php new version', 'php-new-version', '2019-05-20 11:11:09', '2019-05-20 11:11:09'),
(8, 'laravel update version', 'laravel-update-version', '2019-05-20 11:11:30', '2019-05-20 11:11:30'),
(9, 'মাদক', 'মাদক', '2019-05-22 10:07:32', '2019-05-22 10:07:32'),
(10, 'মামলায়', 'মামলায়', '2019-05-22 10:07:48', '2019-05-22 10:07:48'),
(11, 'সন্ত্রাস', 'সন্ত্রাস', '2019-05-22 10:08:05', '2019-05-22 10:08:05'),
(12, 'Angular js', 'angular-js', '2019-05-24 03:37:45', '2019-05-24 03:37:45'),
(13, 'Finance', 'finance', '2019-05-26 01:38:37', '2019-05-26 01:38:37'),
(14, 'Business', 'business', '2019-05-26 01:38:46', '2019-05-26 01:38:46');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT '2',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `about` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `user_name`, `email`, `email_verified_at`, `password`, `image`, `about`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'Md Sanowar Hossen', 'sanowar', 'sanowargiit22@gmail.com', NULL, '$2y$10$Vpcgg9NpuOh/CwNTz4/Mt.J0SUAlbTnj70pGfY5Bprwc/nnBgcZ4K', 'md-sanowar-hossen-2019-05-20-5ce30cf760080.jpg', 'Hi I am sanowar. I am a student of Global Institute of Information Technology.I am professional web designer and Developer.I have 2 year experience in php laravel framework.', NULL, '2019-05-25 18:00:00', '2019-05-21 08:05:03'),
(3, 2, 'Alina Seema', 'alina', 'alinaseema@gmail.com', NULL, '$2y$10$ps2N/Ic.Yr61vgHQV7x7sedQ/UnFupkrW2ZHfOgvZ0ZYxt6vE0c4O', 'alina-seema-2019-05-25-5ce98202e5e8e.jpg', 'Hi I am Alina Seema , I am a student of Begum Rokeya University. Department of Finance.', NULL, '2019-05-25 11:52:07', '2019-05-25 11:57:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_post`
--
ALTER TABLE `category_post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_post_id_foreign` (`post_id`),
  ADD KEY `comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

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
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Indexes for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_user`
--
ALTER TABLE `post_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_user_post_id_foreign` (`post_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribars`
--
ALTER TABLE `subscribars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_name_unique` (`user_name`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `category_post`
--
ALTER TABLE `category_post`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `post_tag`
--
ALTER TABLE `post_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `post_user`
--
ALTER TABLE `post_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subscribars`
--
ALTER TABLE `subscribars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_user`
--
ALTER TABLE `post_user`
  ADD CONSTRAINT `post_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
