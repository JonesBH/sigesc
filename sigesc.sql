/*
 Navicat Premium Data Transfer

 Source Server         : OneDev -Sigesc
 Source Server Type    : MariaDB
 Source Server Version : 100141
 Source Host           : 191.252.178.138:3306
 Source Schema         : sigesc

 Target Server Type    : MariaDB
 Target Server Version : 100141
 File Encoding         : 65001

 Date: 10/11/2019 14:19:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for condominios
-- ----------------------------
DROP TABLE IF EXISTS `condominios`;
CREATE TABLE `condominios`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logradouro` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` int(11) NOT NULL,
  `complemento` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `condominios_nome_unique`(`nome`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of condominios
-- ----------------------------
INSERT INTO `condominios` VALUES (1, 'Edifício Itatiaia', 'Rua Carlos Campos Motta', 223, '', 'Itatiaia', 'Belo Horizonte', 'MG', 31360660, '2019-11-09 18:34:55', '2019-11-09 18:34:55');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (33, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (34, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (35, '2019_11_08_124856_create_condominios_table', 1);
INSERT INTO `migrations` VALUES (36, '2019_11_08_220726_create_unidades_table', 1);
INSERT INTO `migrations` VALUES (37, '2019_11_09_180725_create_moradores_table', 1);

-- ----------------------------
-- Table structure for moradores
-- ----------------------------
DROP TABLE IF EXISTS `moradores`;
CREATE TABLE `moradores`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `unidade_id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `moradores_unidade_id_foreign`(`unidade_id`) USING BTREE,
  CONSTRAINT `moradores_unidade_id_foreign` FOREIGN KEY (`unidade_id`) REFERENCES `unidades` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of moradores
-- ----------------------------
INSERT INTO `moradores` VALUES (1, 1, 'Morador do 101', '2019-11-09 18:34:56', '2019-11-09 19:33:51');
INSERT INTO `moradores` VALUES (2, 2, 'Morador do 102', '2019-11-09 18:34:56', '2019-11-09 18:34:56');
INSERT INTO `moradores` VALUES (3, 3, 'Morador do 201', '2019-11-09 18:34:56', '2019-11-09 18:34:56');
INSERT INTO `moradores` VALUES (4, 4, 'Morador do 202', '2019-11-09 18:34:56', '2019-11-09 18:34:56');
INSERT INTO `moradores` VALUES (5, 5, 'Morador do 301', '2019-11-09 18:34:56', '2019-11-09 18:34:56');
INSERT INTO `moradores` VALUES (6, 6, 'Morador do 302', '2019-11-09 18:34:56', '2019-11-09 18:34:56');
INSERT INTO `moradores` VALUES (7, 7, 'Morador do 401', '2019-11-09 18:34:56', '2019-11-09 18:34:56');
INSERT INTO `moradores` VALUES (8, 8, 'Morador do 402', '2019-11-09 18:34:56', '2019-11-09 18:34:56');
INSERT INTO `moradores` VALUES (9, 9, 'Morador do 103', '2019-11-09 18:34:56', '2019-11-09 18:34:56');
INSERT INTO `moradores` VALUES (10, 10, 'Morador do 104', '2019-11-09 18:34:56', '2019-11-09 18:34:56');
INSERT INTO `moradores` VALUES (11, 11, 'Morador do 203', '2019-11-09 18:34:56', '2019-11-09 18:34:56');
INSERT INTO `moradores` VALUES (12, 12, 'Morador do 204', '2019-11-09 18:34:56', '2019-11-09 18:34:56');
INSERT INTO `moradores` VALUES (13, 13, 'Morador do 303', '2019-11-09 18:34:56', '2019-11-09 18:34:56');
INSERT INTO `moradores` VALUES (14, 14, 'Morador do 304', '2019-11-09 18:34:56', '2019-11-09 18:34:56');
INSERT INTO `moradores` VALUES (15, 15, 'Morador do 403', '2019-11-09 18:34:56', '2019-11-09 18:34:56');
INSERT INTO `moradores` VALUES (16, 16, 'Morador do 404', '2019-11-09 18:34:56', '2019-11-09 18:34:56');
INSERT INTO `moradores` VALUES (17, 17, 'Morador do 105', '2019-11-09 18:34:56', '2019-11-09 18:34:56');
INSERT INTO `moradores` VALUES (18, 18, 'Morador do 106', '2019-11-09 18:34:56', '2019-11-09 18:34:56');
INSERT INTO `moradores` VALUES (19, 19, 'Morador do 205', '2019-11-09 18:34:56', '2019-11-09 18:34:56');
INSERT INTO `moradores` VALUES (20, 20, 'Morador do 206', '2019-11-09 18:34:56', '2019-11-09 18:34:56');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for unidades
-- ----------------------------
DROP TABLE IF EXISTS `unidades`;
CREATE TABLE `unidades`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `condominio_id` int(10) UNSIGNED NOT NULL,
  `bloco` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `area` double(10, 2) NULL DEFAULT NULL,
  `numero` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `unidades_condominio_id_foreign`(`condominio_id`) USING BTREE,
  CONSTRAINT `unidades_condominio_id_foreign` FOREIGN KEY (`condominio_id`) REFERENCES `condominios` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of unidades
-- ----------------------------
INSERT INTO `unidades` VALUES (1, 1, 'A', 55.00, 101, '2019-11-08 23:28:26', '2019-11-08 23:28:26');
INSERT INTO `unidades` VALUES (2, 1, 'A', 65.00, 102, '2019-11-08 23:28:26', '2019-11-08 23:28:26');
INSERT INTO `unidades` VALUES (3, 1, 'A', 55.00, 201, '2019-11-08 23:28:26', '2019-11-08 23:28:26');
INSERT INTO `unidades` VALUES (4, 1, 'A', 65.00, 202, '2019-11-08 23:28:27', '2019-11-08 23:28:27');
INSERT INTO `unidades` VALUES (5, 1, 'A', 55.00, 301, '2019-11-08 23:28:27', '2019-11-08 23:28:27');
INSERT INTO `unidades` VALUES (6, 1, 'A', 65.00, 302, '2019-11-08 23:28:27', '2019-11-08 23:28:27');
INSERT INTO `unidades` VALUES (7, 1, 'A', 55.00, 401, '2019-11-08 23:28:27', '2019-11-08 23:28:27');
INSERT INTO `unidades` VALUES (8, 1, 'A', 65.00, 402, '2019-11-08 23:28:27', '2019-11-08 23:28:27');
INSERT INTO `unidades` VALUES (9, 1, 'B', 55.00, 103, '2019-11-08 23:28:27', '2019-11-08 23:28:27');
INSERT INTO `unidades` VALUES (10, 1, 'B', 65.00, 104, '2019-11-08 23:28:27', '2019-11-08 23:28:27');
INSERT INTO `unidades` VALUES (11, 1, 'B', 55.00, 203, '2019-11-08 23:28:27', '2019-11-08 23:28:27');
INSERT INTO `unidades` VALUES (12, 1, 'B', 65.00, 204, '2019-11-08 23:28:27', '2019-11-08 23:28:27');
INSERT INTO `unidades` VALUES (13, 1, 'B', 55.00, 303, '2019-11-08 23:28:27', '2019-11-08 23:28:27');
INSERT INTO `unidades` VALUES (14, 1, 'B', 65.00, 304, '2019-11-08 23:28:27', '2019-11-08 23:28:27');
INSERT INTO `unidades` VALUES (15, 1, 'B', 55.00, 403, '2019-11-08 23:28:27', '2019-11-08 23:28:27');
INSERT INTO `unidades` VALUES (16, 1, 'B', 65.00, 404, '2019-11-08 23:28:27', '2019-11-08 23:28:27');
INSERT INTO `unidades` VALUES (17, 1, 'C', 75.00, 105, '2019-11-09 00:23:40', '2019-11-09 00:29:16');
INSERT INTO `unidades` VALUES (18, 1, 'C', 55.00, 106, '2019-11-09 00:24:03', '2019-11-09 00:24:03');
INSERT INTO `unidades` VALUES (19, 1, 'C', 45.00, 205, '2019-11-09 00:48:18', '2019-11-09 00:48:18');
INSERT INTO `unidades` VALUES (20, 1, 'C', 75.00, 206, '2019-11-09 00:48:41', '2019-11-09 14:23:57');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Jeymerson Jones', 'jeymerson@gmail.com', '$2y$10$5Qj6WBYiKj0G5uS7I85QLulV65xw/jxuKpaMqI/mzyK3qRiRUHyU.', NULL, '2019-11-09 18:34:55', '2019-11-09 18:34:55');

SET FOREIGN_KEY_CHECKS = 1;
