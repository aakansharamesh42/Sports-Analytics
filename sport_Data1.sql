/*
 Navicat MySQL Data Transfer

 Source Server         : mysqlData
 Source Server Type    : MySQL
 Source Server Version : 80300
 Source Host           : localhost:3306
 Source Schema         : sport_Data1

 Target Server Type    : MySQL
 Target Server Version : 80300
 File Encoding         : 65001

 Date: 31/03/2024 16:33:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add custom user', 6, 'add_customuser');
INSERT INTO `auth_permission` VALUES (22, 'Can change custom user', 6, 'change_customuser');
INSERT INTO `auth_permission` VALUES (23, 'Can delete custom user', 6, 'delete_customuser');
INSERT INTO `auth_permission` VALUES (24, 'Can view custom user', 6, 'view_customuser');
INSERT INTO `auth_permission` VALUES (25, 'Can add user', 7, 'add_user');
INSERT INTO `auth_permission` VALUES (26, 'Can change user', 7, 'change_user');
INSERT INTO `auth_permission` VALUES (27, 'Can delete user', 7, 'delete_user');
INSERT INTO `auth_permission` VALUES (28, 'Can view user', 7, 'view_user');
INSERT INTO `auth_permission` VALUES (29, 'Can add player', 8, 'add_player');
INSERT INTO `auth_permission` VALUES (30, 'Can change player', 8, 'change_player');
INSERT INTO `auth_permission` VALUES (31, 'Can delete player', 8, 'delete_player');
INSERT INTO `auth_permission` VALUES (32, 'Can view player', 8, 'view_player');
INSERT INTO `auth_permission` VALUES (33, 'Can add team', 9, 'add_team');
INSERT INTO `auth_permission` VALUES (34, 'Can change team', 9, 'change_team');
INSERT INTO `auth_permission` VALUES (35, 'Can delete team', 9, 'delete_team');
INSERT INTO `auth_permission` VALUES (36, 'Can view team', 9, 'view_team');
INSERT INTO `auth_permission` VALUES (37, 'Can add performance data', 10, 'add_performancedata');
INSERT INTO `auth_permission` VALUES (38, 'Can change performance data', 10, 'change_performancedata');
INSERT INTO `auth_permission` VALUES (39, 'Can delete performance data', 10, 'delete_performancedata');
INSERT INTO `auth_permission` VALUES (40, 'Can view performance data', 10, 'view_performancedata');
COMMIT;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_main_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_main_user_id` FOREIGN KEY (`user_id`) REFERENCES `main_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'main', 'customuser');
INSERT INTO `django_content_type` VALUES (7, 'main', 'user');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (10, 'test', 'performancedata');
INSERT INTO `django_content_type` VALUES (8, 'test', 'player');
INSERT INTO `django_content_type` VALUES (9, 'test', 'team');
COMMIT;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2024-03-31 10:50:54.513767');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2024-03-31 10:50:54.525932');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2024-03-31 10:50:54.565924');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2024-03-31 10:50:54.576575');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2024-03-31 10:50:54.578956');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2024-03-31 10:50:54.581165');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2024-03-31 10:50:54.582868');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2024-03-31 10:50:54.583351');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2024-03-31 10:50:54.584937');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2024-03-31 10:50:54.587601');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2024-03-31 10:50:54.596987');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2024-03-31 10:50:54.601354');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2024-03-31 10:50:54.603832');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2024-03-31 10:50:54.605686');
INSERT INTO `django_migrations` VALUES (15, 'main', '0001_initial', '2024-03-31 10:50:54.652699');
INSERT INTO `django_migrations` VALUES (16, 'admin', '0001_initial', '2024-03-31 10:50:54.672908');
INSERT INTO `django_migrations` VALUES (17, 'admin', '0002_logentry_remove_auto_add', '2024-03-31 10:50:54.675300');
INSERT INTO `django_migrations` VALUES (18, 'admin', '0003_logentry_add_action_flag_choices', '2024-03-31 10:50:54.677927');
INSERT INTO `django_migrations` VALUES (19, 'sessions', '0001_initial', '2024-03-31 10:50:54.685259');
INSERT INTO `django_migrations` VALUES (20, 'test', '0001_initial', '2024-03-31 10:50:54.725242');
COMMIT;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_session
-- ----------------------------
BEGIN;
INSERT INTO `django_session` VALUES ('azk5achv640p0rhhqreeftd0roeuppy6', '.eJxVjEsOwjAMBe-SNYoSO9QJS_Y9Q-XEDi2gVupnhbg7VOoCtm9m3st0vK19ty06d4OYiwFz-t0yl4eOO5A7j7fJlmlc5yHbXbEHXWw7iT6vh_t30PPSf2sPBFIqVgZxmChWVwMREgpmysxJG2qIY9FGvXN49ph8VgkAIUUw7w_cJTdG:1rqvnZ:RH-LVX8GmVKZ5FLEmBjyLoYVIgneEZxmW-gBXIEEGms', '2024-04-14 14:04:37.427736');
COMMIT;

-- ----------------------------
-- Table structure for main_customuser
-- ----------------------------
DROP TABLE IF EXISTS `main_customuser`;
CREATE TABLE `main_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `age` int unsigned NOT NULL,
  `position` varchar(100) NOT NULL,
  `team` varchar(100) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `nation` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  CONSTRAINT `main_customuser_chk_1` CHECK ((`age` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for main_user
-- ----------------------------
DROP TABLE IF EXISTS `main_user`;
CREATE TABLE `main_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `user_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of main_user
-- ----------------------------
BEGIN;
INSERT INTO `main_user` VALUES (1, 'pbkdf2_sha256$720000$eFRsgs1mblCp85bYEeT6kA$PZmKstFM1V6U7Q4qUTQjYBppOoESmQIhLhUjwKiGRDY=', NULL, 0, '', '', 0, 1, '2024-03-25 22:27:43.981691', 'Marco Rossi', 'MarcoRossi@gmail.com', '1');
INSERT INTO `main_user` VALUES (2, 'pbkdf2_sha256$720000$v3ghFAFLglZKz66tPepTD9$kfmntJdGm9PgziL/cKki1Cre5qgOI6JlmRYYOsPcum0=', '2024-03-31 14:04:37.425592', 0, '', '', 0, 1, '2024-03-25 22:35:30.620786', 'Luca Bianchi', 'LucaBianchi@gmail.com', '1');
INSERT INTO `main_user` VALUES (3, 'pbkdf2_sha256$720000$GWhRJfk8YhH0ueW4H4X7eH$gT6pfqqX7glhySFZeAeyYxJN7Z3k9RyZU7UFRUwCLoM=', NULL, 0, '', '', 0, 1, '2024-03-25 22:36:19.715218', 'Alessandro Romano', 'AlessandroRomano@gmail.com', '1');
INSERT INTO `main_user` VALUES (4, 'pbkdf2_sha256$720000$f2BhVyrrZmTw7sLjwZnP7T$b6AHUHAB4cewFSvN+LbMdEI2FME+KgLRnpaADrqMCpE=', NULL, 0, '', '', 0, 1, '2024-03-25 22:36:47.036730', 'Andrea Colombo', 'AndreaColombo@gmail.com', '1');
INSERT INTO `main_user` VALUES (5, 'pbkdf2_sha256$720000$Uy6jhN0B95mIHMf3ZPT05l$d8QB07eJeL8UhPQEaGJhRLCym2bFD2Y36wPaRmUCPlc=', NULL, 0, '', '', 0, 1, '2024-03-25 22:37:11.459064', 'Stefano Ricci', 'StefanoRicci@gmail.com', '1');
INSERT INTO `main_user` VALUES (6, 'pbkdf2_sha256$720000$LyysLMJoYSLVURRGun5g77$Iy0YCIZE/D7Dp6zyKPZ+R74nq9ajATtKNadB6Yjiwgs=', NULL, 0, '', '', 0, 1, '2024-03-25 22:37:30.580059', 'Angelo Marino', 'AngeloMarino@gmail.com', '1');
INSERT INTO `main_user` VALUES (7, 'pbkdf2_sha256$720000$Vmms03wp3c1dSBov3qRnei$31OdEKWWPcikhIV0orrYzumfmeLxPWJfQFgD/DuifBs=', NULL, 0, '', '', 0, 1, '2024-03-26 06:43:52.754049', 'alice', 'alice@gmail.com', '2');
INSERT INTO `main_user` VALUES (8, 'pbkdf2_sha256$720000$xWefFY0qXDLXCde9T4R072$q5Cg689oucl3um+y+MccI9+xu9lpALcXQ7OlbY6GpSQ=', NULL, 0, '', '', 0, 1, '2024-03-26 06:45:59.038371', '111', '111@gmail.com', '2');
INSERT INTO `main_user` VALUES (9, 'pbkdf2_sha256$720000$2f0envmHaS2vk4z1mkQD22$KiUKYI8Upsw2JSqH9SEg5zqZi735sSzubtvrUxXC3Zo=', NULL, 0, '', '', 0, 1, '2024-03-26 06:46:13.661735', '1', '1@qq.com', '2');
COMMIT;

-- ----------------------------
-- Table structure for main_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `main_user_groups`;
CREATE TABLE `main_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_user_groups_user_id_group_id_ae195797_uniq` (`user_id`,`group_id`),
  KEY `main_user_groups_group_id_a337ba62_fk_auth_group_id` (`group_id`),
  CONSTRAINT `main_user_groups_group_id_a337ba62_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `main_user_groups_user_id_df502602_fk_main_user_id` FOREIGN KEY (`user_id`) REFERENCES `main_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for main_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `main_user_user_permissions`;
CREATE TABLE `main_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_user_user_permissions_user_id_permission_id_96b9fadf_uniq` (`user_id`,`permission_id`),
  KEY `main_user_user_permi_permission_id_cd2b56a3_fk_auth_perm` (`permission_id`),
  CONSTRAINT `main_user_user_permi_permission_id_cd2b56a3_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `main_user_user_permissions_user_id_451ce57f_fk_main_user_id` FOREIGN KEY (`user_id`) REFERENCES `main_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for test_performancedata
-- ----------------------------
DROP TABLE IF EXISTS `test_performancedata`;
CREATE TABLE `test_performancedata` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `session` varchar(100) NOT NULL,
  `speed` decimal(5,2) NOT NULL,
  `distance_covered` decimal(5,2) NOT NULL,
  `resting_period` int NOT NULL,
  `step_counts` int NOT NULL,
  `stress_levels` varchar(100) NOT NULL,
  `hydration_status` varchar(100) NOT NULL,
  `heart_rate` int NOT NULL,
  `calorie_expenditure` int NOT NULL,
  `sleep_quality` varchar(100) NOT NULL,
  `player_id` bigint NOT NULL,
  `accuracy` decimal(5,2) NOT NULL,
  `health_advice` longtext,
  `training_advice` longtext,
  PRIMARY KEY (`id`),
  KEY `test_performancedata_player_id_8a4f5874_fk_test_player_id` (`player_id`),
  CONSTRAINT `test_performancedata_player_id_8a4f5874_fk_test_player_id` FOREIGN KEY (`player_id`) REFERENCES `test_player` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of test_performancedata
-- ----------------------------
BEGIN;
INSERT INTO `test_performancedata` VALUES (1, '2024-02-10', 'Game', 8.30, 106.00, 26, 9892, 'Moderate', 'Adequate', 162, 2558, 'Poor', 1, 0.89, NULL, 'Poor cardiorespiratory function, consider increasing aerobic exercise duration.');
INSERT INTO `test_performancedata` VALUES (2, '2024-11-21', 'Game', 4.40, 102.00, 31, 9363, 'High', 'Good', 166, 2590, 'Excellent', 1, 0.67, NULL, 'Poor cardiorespiratory function, consider increasing aerobic exercise duration. Running speed below team average, need to strengthen running training and increase sprints.');
INSERT INTO `test_performancedata` VALUES (3, '2024-05-19', 'Game', 10.80, 102.00, 28, 9547, 'Low', 'High', 130, 2755, 'Good', 1, 0.11, NULL, 'Shooting accuracy is poor, need to improve shooting technique including angle and power control.');
INSERT INTO `test_performancedata` VALUES (4, '2024-04-23', 'Training', 9.70, 102.00, 28, 9267, 'High', 'High', 174, 2506, 'Poor', 1, 0.82, NULL, 'Poor cardiorespiratory function, consider increasing aerobic exercise duration.');
INSERT INTO `test_performancedata` VALUES (5, '2024-05-05', 'Training', 11.00, 105.00, 21, 9060, 'High', 'Good', 100, 2731, 'Excellent', 1, 0.09, NULL, 'Shooting accuracy is poor, need to improve shooting technique including angle and power control.');
INSERT INTO `test_performancedata` VALUES (6, '2024-07-15', 'Training', 6.10, 109.00, 20, 9399, 'Low', 'High', 172, 2587, 'Excellent', 1, 0.06, NULL, 'Poor cardiorespiratory function, consider increasing aerobic exercise duration. Running speed below team average, need to strengthen running training and increase sprints. Shooting accuracy is poor, need to improve shooting technique including angle and power control.');
INSERT INTO `test_performancedata` VALUES (7, '2024-08-11', 'Game', 8.20, 101.00, 27, 9810, 'Low', 'Good', 81, 2685, 'Good', 2, 0.59, NULL, '');
INSERT INTO `test_performancedata` VALUES (8, '2024-08-12', 'Game', 10.80, 106.00, 29, 9674, 'High', 'Good', 65, 2661, 'Fair', 2, 0.90, NULL, '');
INSERT INTO `test_performancedata` VALUES (9, '2024-05-18', 'Game', 9.70, 101.00, 29, 9033, 'Low', 'Good', 168, 2641, 'Fair', 2, 0.69, NULL, 'Poor cardiorespiratory function, consider increasing aerobic exercise duration.');
INSERT INTO `test_performancedata` VALUES (10, '2024-08-10', 'Training', 4.40, 108.00, 25, 9158, 'Moderate', 'Adequate', 176, 2709, 'Poor', 2, 0.62, NULL, 'Poor cardiorespiratory function, consider increasing aerobic exercise duration. Running speed below team average, need to strengthen running training and increase sprints.');
INSERT INTO `test_performancedata` VALUES (11, '2024-02-26', 'Training', 7.90, 97.00, 27, 9990, 'High', 'High', 133, 2699, 'Poor', 2, 0.31, NULL, 'Shooting accuracy is poor, need to improve shooting technique including angle and power control.');
INSERT INTO `test_performancedata` VALUES (12, '2024-01-07', 'Training', 8.60, 98.00, 28, 9684, 'High', 'Good', 71, 2562, 'Fair', 2, 0.21, NULL, 'Shooting accuracy is poor, need to improve shooting technique including angle and power control.');
INSERT INTO `test_performancedata` VALUES (13, '2024-03-28', 'Game', 10.80, 108.00, 23, 9167, 'Moderate', 'Good', 80, 2772, 'Poor', 3, 0.24, NULL, 'Shooting accuracy is poor, need to improve shooting technique including angle and power control.');
INSERT INTO `test_performancedata` VALUES (14, '2024-07-06', 'Game', 6.60, 95.00, 34, 9889, 'Low', 'Adequate', 80, 2542, 'Fair', 3, 0.79, NULL, 'Running speed below team average, need to strengthen running training and increase sprints.');
INSERT INTO `test_performancedata` VALUES (15, '2024-09-09', 'Game', 6.70, 98.00, 27, 9949, 'Moderate', 'High', 120, 2543, 'Fair', 3, 0.85, NULL, 'Running speed below team average, need to strengthen running training and increase sprints.');
INSERT INTO `test_performancedata` VALUES (16, '2024-08-18', 'Training', 4.30, 106.00, 34, 9339, 'Moderate', 'High', 170, 2601, 'Excellent', 3, 0.04, NULL, 'Poor cardiorespiratory function, consider increasing aerobic exercise duration. Running speed below team average, need to strengthen running training and increase sprints. Shooting accuracy is poor, need to improve shooting technique including angle and power control.');
INSERT INTO `test_performancedata` VALUES (17, '2024-08-09', 'Training', 10.80, 99.00, 30, 9654, 'Moderate', 'Good', 177, 2578, 'Fair', 3, 0.93, NULL, 'Poor cardiorespiratory function, consider increasing aerobic exercise duration.');
INSERT INTO `test_performancedata` VALUES (18, '2024-10-22', 'Training', 8.60, 95.00, 23, 9807, 'High', 'Adequate', 106, 2572, 'Good', 3, 0.69, NULL, '');
INSERT INTO `test_performancedata` VALUES (19, '2024-11-21', 'Game', 7.30, 105.00, 26, 9466, 'Low', 'Adequate', 128, 2511, 'Good', 4, 0.27, NULL, 'Shooting accuracy is poor, need to improve shooting technique including angle and power control.');
INSERT INTO `test_performancedata` VALUES (20, '2024-11-30', 'Game', 4.10, 108.00, 21, 9039, 'High', 'Good', 118, 2758, 'Fair', 4, 0.42, NULL, 'Running speed below team average, need to strengthen running training and increase sprints.');
INSERT INTO `test_performancedata` VALUES (21, '2024-11-30', 'Game', 10.70, 103.00, 29, 9411, 'Low', 'Good', 159, 2644, 'Fair', 4, 0.82, NULL, '');
INSERT INTO `test_performancedata` VALUES (22, '2024-11-29', 'Training', 4.70, 101.00, 26, 9749, 'Low', 'Good', 139, 2510, 'Good', 4, 0.14, NULL, 'Running speed below team average, need to strengthen running training and increase sprints. Shooting accuracy is poor, need to improve shooting technique including angle and power control.');
INSERT INTO `test_performancedata` VALUES (23, '2024-11-08', 'Training', 10.10, 104.00, 33, 9704, 'High', 'Good', 163, 2658, 'Good', 4, 0.42, NULL, 'Poor cardiorespiratory function, consider increasing aerobic exercise duration.');
INSERT INTO `test_performancedata` VALUES (24, '2024-04-03', 'Training', 6.50, 107.00, 31, 9980, 'High', 'High', 160, 2710, 'Excellent', 4, 0.40, NULL, 'Running speed below team average, need to strengthen running training and increase sprints. Shooting accuracy is poor, need to improve shooting technique including angle and power control.');
INSERT INTO `test_performancedata` VALUES (25, '2024-09-26', 'Game', 10.10, 97.00, 34, 9015, 'High', 'High', 126, 2547, 'Excellent', 5, 0.02, NULL, 'Shooting accuracy is poor, need to improve shooting technique including angle and power control.');
INSERT INTO `test_performancedata` VALUES (26, '2024-06-21', 'Game', 5.00, 109.00, 34, 9400, 'High', 'Good', 130, 2791, 'Good', 5, 0.79, NULL, 'Running speed below team average, need to strengthen running training and increase sprints.');
INSERT INTO `test_performancedata` VALUES (27, '2024-12-29', 'Game', 5.50, 108.00, 27, 9373, 'Moderate', 'Adequate', 84, 2626, 'Excellent', 5, 0.14, NULL, 'Running speed below team average, need to strengthen running training and increase sprints. Shooting accuracy is poor, need to improve shooting technique including angle and power control.');
INSERT INTO `test_performancedata` VALUES (28, '2024-09-25', 'Training', 5.80, 95.00, 31, 9426, 'Low', 'Adequate', 105, 2552, 'Poor', 5, 0.02, NULL, 'Running speed below team average, need to strengthen running training and increase sprints. Shooting accuracy is poor, need to improve shooting technique including angle and power control.');
INSERT INTO `test_performancedata` VALUES (29, '2024-01-05', 'Training', 10.00, 105.00, 32, 9523, 'Low', 'Good', 76, 2700, 'Fair', 5, 0.75, NULL, '');
INSERT INTO `test_performancedata` VALUES (30, '2024-10-20', 'Training', 4.20, 106.00, 33, 9426, 'High', 'Good', 133, 2640, 'Poor', 5, 0.37, NULL, 'Running speed below team average, need to strengthen running training and increase sprints. Shooting accuracy is poor, need to improve shooting technique including angle and power control.');
INSERT INTO `test_performancedata` VALUES (31, '2024-10-05', 'Game', 8.20, 101.00, 28, 9523, 'Moderate', 'Adequate', 85, 2605, 'Excellent', 6, 0.47, NULL, '');
INSERT INTO `test_performancedata` VALUES (32, '2024-06-04', 'Game', 8.20, 107.00, 29, 9538, 'Low', 'Good', 138, 2756, 'Good', 6, 0.34, NULL, 'Shooting accuracy is poor, need to improve shooting technique including angle and power control.');
INSERT INTO `test_performancedata` VALUES (33, '2024-04-27', 'Game', 8.40, 103.00, 34, 9787, 'Moderate', 'Adequate', 93, 2537, 'Good', 6, 0.80, NULL, '');
INSERT INTO `test_performancedata` VALUES (34, '2024-08-01', 'Training', 6.90, 98.00, 26, 9179, 'High', 'Adequate', 158, 2602, 'Poor', 6, 0.59, NULL, 'Running speed below team average, need to strengthen running training and increase sprints.');
INSERT INTO `test_performancedata` VALUES (35, '2024-05-20', 'Training', 7.70, 95.00, 30, 9072, 'Low', 'Adequate', 179, 2681, 'Fair', 6, 0.90, NULL, 'Poor cardiorespiratory function, consider increasing aerobic exercise duration.');
INSERT INTO `test_performancedata` VALUES (36, '2024-04-17', 'Training', 8.00, 107.00, 21, 9489, 'Low', 'Good', 129, 2616, 'Poor', 6, 0.09, NULL, 'Shooting accuracy is poor, need to improve shooting technique including angle and power control.');
COMMIT;

-- ----------------------------
-- Table structure for test_player
-- ----------------------------
DROP TABLE IF EXISTS `test_player`;
CREATE TABLE `test_player` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of test_player
-- ----------------------------
BEGIN;
INSERT INTO `test_player` VALUES (1, 'Marco Rossi');
INSERT INTO `test_player` VALUES (2, 'Luca Bianchi');
INSERT INTO `test_player` VALUES (3, 'Alessandro Romano');
INSERT INTO `test_player` VALUES (4, 'Andrea Colombo');
INSERT INTO `test_player` VALUES (5, 'Stefano Ricci');
INSERT INTO `test_player` VALUES (6, 'Angelo Marino');
COMMIT;

-- ----------------------------
-- Table structure for test_team
-- ----------------------------
DROP TABLE IF EXISTS `test_team`;
CREATE TABLE `test_team` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SET FOREIGN_KEY_CHECKS = 1;
