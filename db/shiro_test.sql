/*
 Navicat Premium Data Transfer

 Source Server         : SSL
 Source Server Type    : MariaDB
 Source Server Version : 100430 (10.4.30-MariaDB-log)
 Source Host           : localhost:3318
 Source Schema         : shiro_test

 Target Server Type    : MariaDB
 Target Server Version : 100430 (10.4.30-MariaDB-log)
 File Encoding         : 65001

 Date: 16/01/2024 00:23:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of groups
-- ----------------------------
INSERT INTO `groups` VALUES (1, 'admin', 'Administrator');
INSERT INTO `groups` VALUES (2, 'sp', 'Supervisor');
INSERT INTO `groups` VALUES (3, 'op', 'Operator');

-- ----------------------------
-- Table structure for perms
-- ----------------------------
DROP TABLE IF EXISTS `perms`;
CREATE TABLE `perms`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` mediumint(8) NOT NULL,
  `permission` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of perms
-- ----------------------------
INSERT INTO `perms` VALUES (1, 1, 'admin:*');
INSERT INTO `perms` VALUES (2, 2, 'user:read,write;branch:*');
INSERT INTO `perms` VALUES (3, 3, 'branch:*');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `group_id` mediumint(8) NOT NULL DEFAULT 0,
  `ip_address` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `photo` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `activation_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `forgotten_password_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED NULL DEFAULT NULL,
  `remember_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED NULL DEFAULT NULL,
  `active` tinyint(1) UNSIGNED NULL DEFAULT NULL,
  `first_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `branch_code` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`, `username`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username`, `email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 1, '127.0.0.1', 'administrator', 't8Vy/MSa4VUUXres1f+rOb1fMfHJ0okkhamsY5wYuOk=', '', 'admin@admin.com', '0', '', NULL, NULL, NULL, 1268889823, 1447697531, 1, 'Admin', 'Admin', 'ADMIN', '0', 'MDN-POINT');
INSERT INTO `users` VALUES (2, 1, '127.0.0.1', 'admin', '5ZJ5tdQr2DmM2IY4+s1V5nyu65x0GOtOrPsqi/hYRh0=', NULL, 'auth401@gmail.com', '3042403_20130317060304.jpg', NULL, NULL, NULL, NULL, 1408809661, 1447041464, 1, 'Agung', 'Susanto', '0', '222', 'BRI-MDN-PTR');
INSERT INTO `users` VALUES (6, 2, '127.0.0.1', 'rangga', 'xsuapII00VYg6+hcdH7nKJozk7TRw2iR2FDdfqmikDI=', NULL, 'rangga@praditya.com', '', NULL, NULL, NULL, NULL, 1419754982, 1419754982, 1, 'rangga', 'praditya', '', '', 'MDN-POINT');
INSERT INTO `users` VALUES (7, 2, '127.0.0.1', 'fatih', 'dThf6Y3qfYlBfq1cRUUzwirIS89QXogCZzUblhnrqkM=', NULL, 'fatih@abiyasa.com', '', NULL, NULL, NULL, NULL, 1419755120, 1419755120, 1, 'Fatih', 'Abiyasa', '', '111111', 'MDN-POINT');
INSERT INTO `users` VALUES (8, 3, '127.0.0.1', 'bima', 'ivWbHIh7dutYWnuJXRvQC7POXDGsSKQXgTvLKJxKuuI=', NULL, 'bima@sena.com', '', NULL, NULL, NULL, NULL, 1419755249, 1447474837, 1, 'Bima', 'Sena', '', '', 'MDN-POINT');
INSERT INTO `users` VALUES (9, 3, '127.0.0.1', 'dina', 'ehQDOtKVX+yMpWHuNotE0TapEMnoYMNYKTX1f9SdL7U=', NULL, 'dina@wulansari.com', '', NULL, NULL, NULL, NULL, 1419755362, 1419755362, 1, 'dina', 'wulansari', '', '', 'MDN-POINT');
INSERT INTO `users` VALUES (13, 2, '127.0.0.1', 'agung', 'F/4yOE3xgtBSkl/ghls0Jne+661Ei3/rGFPg0obL6po=', NULL, 'agung@gmail.com', '', NULL, NULL, NULL, NULL, 1447474416, 1447697458, 1, 'Danang', 'Junaedi', NULL, '91919', 'MDN-POINT');

SET FOREIGN_KEY_CHECKS = 1;
