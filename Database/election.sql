-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 09, 2025 at 08:04 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `election`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add vote', 7, 'add_vote'),
(26, 'Can change vote', 7, 'change_vote'),
(27, 'Can delete vote', 7, 'delete_vote'),
(28, 'Can view vote', 7, 'view_vote'),
(29, 'Can add candidate', 8, 'add_candidate'),
(30, 'Can change candidate', 8, 'change_candidate'),
(31, 'Can delete candidate', 8, 'delete_candidate'),
(32, 'Can view candidate', 8, 'view_candidate');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$1000000$YPgtoPer5NkKQQYHtWthsy$9hjgxf9CEJu0ZlkaiScYZ449llYwpesi/WsuXixFi8g=', '2025-07-08 13:30:45.697421', 0, 'Ali', '', '', 'a@a.com', 0, 1, '2025-07-08 13:30:34.235796'),
(2, 'pbkdf2_sha256$1000000$5boQo6FuNk1XEbHx2wQWvs$ovfZRDg7veJstaARMuO7G4yfuYDRabvnEasqksxgOZQ=', '2025-07-08 15:15:37.776529', 1, 'kulmie', '', '', 'kulmie@kulmie.com', 1, 1, '2025-07-08 13:41:30.665508');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2025-07-08 13:43:21.865457', '1', 'Ismail', 1, '[{\"added\": {}}]', 8, 2),
(2, '2025-07-08 15:16:18.966078', '1', 'Ismail Ibrahim Mohamed', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 8, 2),
(3, '2025-07-08 15:23:10.323196', '2', 'Ustaad Hashim Abdikadir', 1, '[{\"added\": {}}]', 8, 2),
(4, '2025-07-08 15:26:06.791332', '3', 'Muhudin Nur Kulmie', 1, '[{\"added\": {}}]', 8, 2),
(5, '2025-07-08 15:36:55.732314', '1', 'Ismail Ibrahim Mohamed', 2, '[{\"changed\": {\"fields\": [\"Photo\"]}}]', 8, 2),
(6, '2025-07-08 15:37:24.478856', '2', 'Ustaad Hashim Abdikadir', 2, '[{\"changed\": {\"fields\": [\"Photo\"]}}]', 8, 2),
(7, '2025-07-08 15:37:30.537425', '3', 'Muhudin Nur Kulmie', 2, '[]', 8, 2),
(8, '2025-07-08 15:37:41.313949', '3', 'Muhudin Nur Kulmie', 2, '[{\"changed\": {\"fields\": [\"Photo\"]}}]', 8, 2),
(9, '2025-07-08 15:55:48.714556', '1', 'kulmie voted for Ustaad Hashim Abdikadir', 1, '[{\"added\": {}}]', 7, 2),
(10, '2025-07-08 16:06:44.980531', '2', 'Ali voted for Ustaad Hashim Abdikadir', 1, '[{\"added\": {}}]', 7, 2),
(11, '2025-07-08 16:07:16.244062', '1', 'kulmie voted for Ismail Ibrahim Mohamed', 2, '[{\"changed\": {\"fields\": [\"Candidate\"]}}]', 7, 2),
(12, '2025-07-08 16:07:32.746295', '1', 'kulmie voted for Ustaad Hashim Abdikadir', 2, '[{\"changed\": {\"fields\": [\"Candidate\"]}}]', 7, 2);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(8, 'election_app', 'candidate'),
(7, 'election_app', 'vote'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-07-08 13:16:34.765146'),
(2, 'auth', '0001_initial', '2025-07-08 13:16:35.760135'),
(3, 'admin', '0001_initial', '2025-07-08 13:16:36.008729'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-07-08 13:16:36.025491'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-07-08 13:16:36.052217'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-07-08 13:16:36.248567'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-07-08 13:16:36.378740'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-07-08 13:16:36.464067'),
(9, 'auth', '0004_alter_user_username_opts', '2025-07-08 13:16:36.483543'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-07-08 13:16:36.610491'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-07-08 13:16:36.614875'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-07-08 13:16:36.633310'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-07-08 13:16:36.768733'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-07-08 13:16:36.895593'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-07-08 13:16:36.969734'),
(16, 'auth', '0011_update_proxy_permissions', '2025-07-08 13:16:36.992635'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-07-08 13:16:37.131223'),
(18, 'election_app', '0001_initial', '2025-07-08 13:16:37.401136'),
(19, 'election_app', '0002_remove_vote_candidate_remove_vote_user_and_more', '2025-07-08 13:16:37.670297'),
(20, 'sessions', '0001_initial', '2025-07-08 13:16:37.738774'),
(21, 'election_app', '0003_initial', '2025-07-08 13:40:28.450526'),
(22, 'election_app', '0004_rename_user_vote_voter', '2025-07-08 15:55:19.570509');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('bo1jlu24k754fjp5xgp2zuebp4ms2m40', '.eJxVzDsOwjAQBNC7uEaW_yaU9JzBWu9ucADFUpxUiLvjSCmgnTczb5FgW0vaGi9pInERRpx-swz45HkHesB8rxLrvC5TlntFHtrkrRK_rkf376BAK33tdTCB4wA4UB5zjBYtq6hsDsE6h4SdAHk0YMkPXhvXRTumAFnBWXy-7uE4WQ:1uZ8Zx:9PTUC3apxXQMBX-_C03Sb04GZlR1qmgCecVlo8N8MbI', '2025-07-22 13:41:49.206976'),
('c8mc6xvmi1d61hac27fq8du7schkrxax', '.eJxVzDsOwjAQBNC7uEaW_yaU9JzBWu9ucADFUpxUiLvjSCmgnTczb5FgW0vaGi9pInERRpx-swz45HkHesB8rxLrvC5TlntFHtrkrRK_rkf376BAK33tdTCB4wA4UB5zjBYtq6hsDsE6h4SdAHk0YMkPXhvXRTumAFnBWXy-7uE4WQ:1uZA2i:KUh_zT8YunCUbMUCdQP76rRoYpY5J8gyCpDLCOoiKog', '2025-07-22 15:15:36.437933'),
('gzx97y89r6fi8y1lii5dx34ny2rsobma', '.eJxVzDsOwjAQBNC7uEaW_yaU9JzBWu9ucADFUpxUiLvjSCmgnTczb5FgW0vaGi9pInERRpx-swz45HkHesB8rxLrvC5TlntFHtrkrRK_rkf376BAK33tdTCB4wA4UB5zjBYtq6hsDsE6h4SdAHk0YMkPXhvXRTumAFnBWXy-7uE4WQ:1uZA2j:5cCkWQrNPg41XAwUrHwBKZ_odBR_XA1RXmP1yRcFqyo', '2025-07-22 15:15:37.782177');

-- --------------------------------------------------------

--
-- Table structure for table `election_app_candidate`
--

CREATE TABLE `election_app_candidate` (
  `id` bigint NOT NULL,
  `name` varchar(100) NOT NULL,
  `bio` longtext NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `election_app_candidate`
--

INSERT INTO `election_app_candidate` (`id`, `name`, `bio`, `photo`) VALUES
(1, 'Ismail Ibrahim Mohamed', 'Igu dooro boob iyo dhac', 'candidates/default_AK64OmV_MyxsYla.png'),
(2, 'Ustaad Hashim Abdikadir', 'Igu Dooro Cadaalad Iyo Sinnaan.', 'candidates/default_wlWBvHI_bTVfjjP.png'),
(3, 'Muhudin Nur Kulmie', 'Waxba Ha Igu Dooran', 'candidates/web_22cNomD.whatsapp.png');

-- --------------------------------------------------------

--
-- Table structure for table `election_app_vote`
--

CREATE TABLE `election_app_vote` (
  `id` bigint NOT NULL,
  `voted_at` datetime(6) NOT NULL,
  `candidate_id` bigint NOT NULL,
  `voter_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `election_app_vote`
--

INSERT INTO `election_app_vote` (`id`, `voted_at`, `candidate_id`, `voter_id`) VALUES
(1, '2025-07-08 15:55:48.712287', 2, 2),
(2, '2025-07-08 16:06:44.977834', 2, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `election_app_candidate`
--
ALTER TABLE `election_app_candidate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `election_app_vote`
--
ALTER TABLE `election_app_vote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `election_app_vote_candidate_id_d4c3c61f_fk_election_` (`candidate_id`),
  ADD KEY `election_app_vote_voter_id_bc554f70_fk_auth_user_id` (`voter_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `election_app_candidate`
--
ALTER TABLE `election_app_candidate`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `election_app_vote`
--
ALTER TABLE `election_app_vote`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `election_app_vote`
--
ALTER TABLE `election_app_vote`
  ADD CONSTRAINT `election_app_vote_candidate_id_d4c3c61f_fk_election_` FOREIGN KEY (`candidate_id`) REFERENCES `election_app_candidate` (`id`),
  ADD CONSTRAINT `election_app_vote_voter_id_bc554f70_fk_auth_user_id` FOREIGN KEY (`voter_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
