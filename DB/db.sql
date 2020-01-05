/*
 Navicat Premium Data Transfer

 Source Server         : auction
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : 127.0.0.1:3306
 Source Schema         : DB

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 05/01/2020 21:34:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username_UNIQUE` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
BEGIN;
INSERT INTO `admin` VALUES (1, 'lem', 'nguyenhuugiatri@gmail.com', '0964351101', 'lemdeptry', '$2a$10$VdYEIX7Jq/cOvw1mJfF2MOJIfMGacz1r1eC0A0fVqGHTo3sZoJ0tG');
COMMIT;

-- ----------------------------
-- Table structure for ban
-- ----------------------------
DROP TABLE IF EXISTS `ban`;
CREATE TABLE `ban` (
  `id_product` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_product`,`id_user`) USING BTREE,
  KEY `fk_ban_user` (`id_user`) USING BTREE,
  CONSTRAINT `fk_ban_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_ban_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ban
-- ----------------------------
BEGIN;
INSERT INTO `ban` VALUES (4, 1);
COMMIT;

-- ----------------------------
-- Table structure for biddinglist
-- ----------------------------
DROP TABLE IF EXISTS `biddinglist`;
CREATE TABLE `biddinglist`  (
  `id_product` int(11) NOT NULL,
  `time` datetime(0) NOT NULL,
  `bidPrice` float NULL DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id_product`, `time`, `id_user`) USING BTREE,
  INDEX `fk_aucHistory_user_idx`(`id_user`) USING BTREE,
  INDEX `fk_aucHistory_product_idx`(`id_product`) USING BTREE,
  CONSTRAINT `fk_aucHistory_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_aucHistory_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of biddinglist
-- ----------------------------
INSERT INTO `biddinglist` VALUES (2, '2020-01-02 00:22:34', 1200, 2);
INSERT INTO `biddinglist` VALUES (3, '2020-01-02 00:21:53', 1000, 10);
INSERT INTO `biddinglist` VALUES (3, '2020-01-05 16:19:16', 50000, 2);
INSERT INTO `biddinglist` VALUES (3, '2020-01-22 15:49:30', 5000, 2);
INSERT INTO `biddinglist` VALUES (4, '2020-01-02 00:22:53', 4000, 3);
INSERT INTO `biddinglist` VALUES (5, '2020-01-09 15:39:46', 2000, 10);
INSERT INTO `biddinglist` VALUES (6, '2020-01-03 15:40:34', 20000, 10);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `status` int(1) NOT NULL DEFAULT '1',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
BEGIN;
INSERT INTO `category` VALUES (1, 1, 'Laptop');
INSERT INTO `category` VALUES (1, 2, 'Smartphone');
INSERT INTO `category` VALUES (1, 3, 'Tablet');
COMMIT;

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id_product` int(11) NOT NULL,
  `src` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id_product`,`src`) USING BTREE,
  KEY `fk_image_product_idx` (`id_product`) USING BTREE,
  CONSTRAINT `fk_image_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of image
-- ----------------------------
BEGIN;
INSERT INTO `image` VALUES (1, 'sr1_1');
INSERT INTO `image` VALUES (1, 'sr1_2');
INSERT INTO `image` VALUES (1, 'sr1_3');
INSERT INTO `image` VALUES (2, 'sr2_1');
INSERT INTO `image` VALUES (2, 'sr2_2');
INSERT INTO `image` VALUES (2, 'sr2_3');
INSERT INTO `image` VALUES (3, 'lem');
INSERT INTO `image` VALUES (3, 'sr3_1');
INSERT INTO `image` VALUES (3, 'sr3_2');
INSERT INTO `image` VALUES (3, 'sr3_3');
INSERT INTO `image` VALUES (4, 's1');
INSERT INTO `image` VALUES (4, 's2');
INSERT INTO `image` VALUES (4, 's3');
INSERT INTO `image` VALUES (5, 's1');
INSERT INTO `image` VALUES (5, 's2');
INSERT INTO `image` VALUES (5, 's3');
INSERT INTO `image` VALUES (6, 's1');
INSERT INTO `image` VALUES (6, 's2');
INSERT INTO `image` VALUES (6, 's3');
INSERT INTO `image` VALUES (44, 'wwwww');
INSERT INTO `image` VALUES (45, 'lku');
INSERT INTO `image` VALUES (49, '2020-01-02 07:36:19-2.jpeg');
INSERT INTO `image` VALUES (52, '\'2020-01-02 07:39:29-2.jpeg\'');
INSERT INTO `image` VALUES (53, '2020-01-02 07:40:11-2.jpeg');
INSERT INTO `image` VALUES (55, '/uploads/1/2020-01-02 07:42:42-2.jpeg');
INSERT INTO `image` VALUES (56, '/uploads/1/2020-01-02 08:38:44-1.jpeg');
INSERT INTO `image` VALUES (56, '/uploads/1/2020-01-02 08:38:44-2.jpeg');
INSERT INTO `image` VALUES (57, '/uploads/1/2020-01-02 08:38:44-1.jpeg');
INSERT INTO `image` VALUES (57, '/uploads/1/2020-01-02 08:38:44-2.jpeg');
INSERT INTO `image` VALUES (57, '/uploads/1/2020-01-02 08:42:41-2.jpeg');
INSERT INTO `image` VALUES (59, '/uploads/1/2020-01-05-04-33-35-1.jpeg');
INSERT INTO `image` VALUES (59, '/uploads/1/2020-01-05-04-33-35-2.jpeg');
INSERT INTO `image` VALUES (59, '/uploads/1/2020-01-05-04-33-35-3.jpeg');
INSERT INTO `image` VALUES (60, '/uploads/6/2020-01-05-04-37-01-1.jpeg');
INSERT INTO `image` VALUES (60, '/uploads/6/2020-01-05-04-37-01-2.jpeg');
INSERT INTO `image` VALUES (60, '/uploads/6/2020-01-05-04-37-01-3.jpeg');
COMMIT;

-- ----------------------------
-- Table structure for parameter
-- ----------------------------
DROP TABLE IF EXISTS `parameter`;
CREATE TABLE `parameter` (
  `sell_product_cost` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `category` int(11) NOT NULL,
  `id_seller` int(11) DEFAULT NULL,
  `id_bidder` int(11) DEFAULT NULL,
  `bidStep` int(11) DEFAULT NULL,
  `currentPrice` int(11) NOT NULL,
  `buynowPrice` int(11) DEFAULT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `details` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `auctioned` int(11) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_product_category_idx` (`category`) USING BTREE,
  KEY `fk_product_bidder_idx` (`id_bidder`) USING BTREE,
  KEY `fk_product_seller` (`id_seller`) USING BTREE,
  CONSTRAINT `fk_product_bidder` FOREIGN KEY (`id_bidder`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_product_category` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_product_seller` FOREIGN KEY (`id_seller`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
BEGIN;
INSERT INTO `product` VALUES (1, 'Acer Nitro 5', 1, 1, 2, 1000, 10000, 20000, '2020-01-01 22:05:21', '2020-01-14 22:05:24', 'LAPTOP vip', 0);
INSERT INTO `product` VALUES (2, 'Macbook Pro 2019', 1, 3, 4, 1000, 15000, 20000, '2020-01-01 22:06:26', '2020-01-15 22:06:29', 'LAPTOP cùi', 0);
INSERT INTO `product` VALUES (3, 'Asus ROG', 1, 2, 1, 1000, 10000, 20000, '2020-01-01 22:07:23', '2020-01-14 22:07:26', 'LAPTOP vip', 0);
INSERT INTO `product` VALUES (4, 'Iphone', 2, 4, 3, 200, 1200, 3000, '2020-01-02 00:17:21', '2020-01-24 00:17:27', 'Iphone đẹp', 0);
INSERT INTO `product` VALUES (5, 'xiaomi', 2, 1, 10, 120, 1000, 1200, '2020-01-02 15:24:33', '2020-01-02 15:24:36', NULL, 0);
INSERT INTO `product` VALUES (6, 'xiaomi poco', 2, 1, NULL, 5, 10, 10, '2020-01-02 03:36:46', '2020-02-01 11:01:00', NULL, 0);
INSERT INTO `product` VALUES (7, 'xiaomi poco', 2, 1, NULL, 5, 10, 20, '2020-01-02 03:37:23', '2020-02-01 11:01:00', NULL, 0);
INSERT INTO `product` VALUES (44, 'xiaomi poco2', 2, 1, NULL, 123, 123, 321, '2020-01-02 07:28:04', '2020-12-12 11:11:00', NULL, 0);
INSERT INTO `product` VALUES (45, 'xiaomi poco2', 2, 1, NULL, 123, 123, 321, '2020-01-02 07:31:47', '2020-12-12 11:11:00', NULL, 0);
INSERT INTO `product` VALUES (49, 'xiaomi poco2', 2, 1, NULL, 123, 123, 321, '2020-01-02 07:36:19', '2020-12-12 11:11:00', NULL, 0);
INSERT INTO `product` VALUES (52, 'xiaomi poco2', 2, 1, NULL, 123, 123, 321, '2020-01-02 07:39:29', '2020-12-12 11:11:00', NULL, 0);
INSERT INTO `product` VALUES (53, 'xiaomi poco2', 2, 1, NULL, 123, 123, 321, '2020-01-02 07:40:11', '2020-12-12 11:11:00', NULL, 0);
INSERT INTO `product` VALUES (55, 'xiaomi poco2', 2, 1, NULL, 123, 123, 321, '2020-01-02 07:42:42', '2020-12-12 11:11:00', NULL, 0);
INSERT INTO `product` VALUES (56, 'xiaomi poco', 2, 1, NULL, 2, 12, 15, '2020-01-02 08:38:44', '2021-12-01 12:01:00', NULL, 0);
INSERT INTO `product` VALUES (57, 'xiaomi poco', 2, 1, NULL, 2, 12, 15, '2020-01-02 08:42:41', '2021-12-01 12:01:00', '<p style=\"text-align: right;\">asdasdasdasdasdasdas</p>\r\n<div id=\"eJOY__extension_root\" style=\"all: unset;\">&nbsp;</div>', 0);
INSERT INTO `product` VALUES (58, 'qwe', 2, 1, NULL, 1, 12, 5, '2020-01-05 04:31:32', '2222-12-02 12:02:00', '<p>&nbsp;</p>\r\n<div id=\"eJOY__extension_root\" style=\"all: unset;\">&nbsp;</div>', 0);
INSERT INTO `product` VALUES (59, '123', 2, 1, NULL, 2, 12, 15, '2020-01-05 04:33:35', '2222-12-21 02:02:00', '<p>&nbsp;</p>\r\n<div id=\"eJOY__extension_root\" style=\"all: unset;\">&nbsp;</div>', 0);
INSERT INTO `product` VALUES (60, 'hihi', 2, 6, NULL, 1, 12, 15, '2020-01-05 04:37:01', '2020-12-06 12:02:00', '<p><span style=\"color: #e67e23;\"><em>Lorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</em></span></p>\r\n<div id=\"eJOY__extension_root\" style=\"all: unset;\">&nbsp;</div>', 0);
COMMIT;

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `id_user` int(11) NOT NULL,
  `review` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `reviewer` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `marks` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id_user`, `reviewer`, `id_product`) USING BTREE,
  INDEX `fk_review_reviewer_idx`(`reviewer`) USING BTREE,
  INDEX `fk_review_product`(`id_product`) USING BTREE,
  CONSTRAINT `fk_review_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_review_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_reviewer_user` FOREIGN KEY (`reviewer`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of review
-- ----------------------------
BEGIN;
INSERT INTO `review` VALUES (1, 'Người bán ngu vl', 0, '2020-01-02 00:27:41', 2, 1, 1);
INSERT INTO `review` VALUES (2, 'a', 0, '2020-01-15 23:40:53', 1, 2, 0);
INSERT INTO `review` VALUES (2, 'Lừa đảo', NULL, NULL, 3, 3, 0);
INSERT INTO `review` VALUES (7, 'đồ ngon', NULL, NULL, 1, 4, 1);
INSERT INTO `review` VALUES (7, 'xịn', NULL, NULL, 2, 5, 1);
INSERT INTO `review` VALUES (7, 'oke', NULL, NULL, 5, 6, 1);
INSERT INTO `review` VALUES (7, 'haizz', NULL, NULL, 6, 7, 0);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` bit(1) DEFAULT b'1',
  `fullname` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `joindate` datetime DEFAULT NULL,
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` int(1) NOT NULL,
  `permission` int(1) NOT NULL DEFAULT '0',
  `request` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username_UNIQUE` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, b'0', 'thaianhvip', '0944026118', 'thaianh@gmail.co', '2020-01-08 22:01:03', 'thaianh', '$2a$10$VdYEIX7Jq/cOvw1mJfF2MOJIfMGacz1r1eC0A0fVqGHTo3sZoJ0tG', 0, 0, 1);
INSERT INTO `user` VALUES (2, b'1', 'thaiemcuiqwe', '0944026117', 'thaiem@gmail.com', '2020-01-14 22:01:37', 'thaiem', '$2a$10$O2ihTfrzG3xvjX0DlnEHTuQn7Kv4yT//jYAzl6wAMejUEZmVrtrE6', 0, 1, 0);
INSERT INTO `user` VALUES (3, b'1', 'thaianh1', '0944026116', 'as@gmail.com', '2020-01-14 22:04:08', 'thaianh1', '$2a$10$VdYEIX7Jq/cOvw1mJfF2MOJIfMGacz1r1eC0A0fVqGHTo3sZoJ0tG', 1, 1, 0);
INSERT INTO `user` VALUES (4, b'1', 'thaianh2', '0944026115', '123213@gmail.com', '2020-01-20 22:04:36', 'thaianh2', '$2a$10$VdYEIX7Jq/cOvw1mJfF2MOJIfMGacz1r1eC0A0fVqGHTo3sZoJ0tG', 0, 1, 0);
INSERT INTO `user` VALUES (5, b'1', 'lem', '0964351101', 'lem@gmail.com', '1999-06-12 00:00:00', 'lemdeptrai', '$2a$10$VdYEIX7Jq/cOvw1mJfF2MOJIfMGacz1r1eC0A0fVqGHTo3sZoJ0tG', 1, 1, 0);
INSERT INTO `user` VALUES (6, b'1', 'lem dep try', '123456', 'lemdeptry@gmail.com', NULL, 'lemdeptry', '$2a$10$VdYEIX7Jq/cOvw1mJfF2MOJIfMGacz1r1eC0A0fVqGHTo3sZoJ0tG', 0, 1, 0);
INSERT INTO `user` VALUES (7, b'1', 'Đỗ Thế Anh', '0904113942', 'nhoxtheanh@gmail.com', NULL, 'dotheanh', '$2a$10$B3Pxk1P0ybSGdN2TCtv5Mecz/aehej.RIQBDFHjx2Oht4ErdtbfT.', 1, 1, 0);
INSERT INTO `user` VALUES (8, b'1', 'Đỗ Thế Em hihi', '0904113942', 'nhoxtheem@gmail.com', NULL, 'dotheem', '$2a$10$qIbkqfKjHzHHEh/otJFuIOV39uC4rdKCz1u/CymSW/jAvGoE7IBZ2', 1, 1, 0);
INSERT INTO `user` VALUES (9, b'0', 'Đỗ Thế Chị', NULL, 'nhoxthechi@gmail.com', NULL, 'dothechi', '$2a$10$B3Pxk1P0ybSGdN2TCtv5Mecz/aehej.RIQBDFHjx2Oht4ErdtbfT.', 0, 1, 0);
INSERT INTO `user` VALUES (10, b'1', 'lem Nguyen', NULL, 'qweqwe@gmail.com', '2020-01-05 00:00:00', 'lemdeptry2', '$2a$10$sO35b9SfYKXgSBeko177FewKe9Ph//5oLOf4Ow6cNpmLTfvROz4ta', 1, 1, 0);
INSERT INTO `user` VALUES (14, b'1', 'aaaaaaa', '0911232111', 'aaaaaaaa@g.com', '2020-01-05 00:00:00', 'aaaaaaaa', '$2a$10$R.2q2fx0s9WwECqoB4yhouhq8KA7l1dfk4bGn9OZ3IeNGx0RK5pUW', 1, 1, 0);
INSERT INTO `user` VALUES (15, b'1', 'thaianhvip111', '0931467534', 'qweqwe11111@gmail.com', '2020-01-05 00:00:00', 'lemdeptry11111', '$2a$10$3wyZl.HmiOgkbmG6K5w7ceE.1Zo9WS4J/SkHMrfqTuALqzNvQgAG.', 1, 1, 0);
INSERT INTO `user` VALUES (16, b'0', 'thaianhvip111', '0931467534', 'qweqwe111111@gmail.com', '2020-01-05 00:00:00', 'lemdeptry111111', '$2a$10$6/8d62vvL0nw6txWfE74J.BNgR6JXhxNtG2.skFqFNQLZAQIEKhFm', 0, 1, 0);
INSERT INTO `user` VALUES (17, b'0', 'thaianhvip11111', '0931467534', 'qweqwe1111111@gmail.com', '2020-01-05 00:00:00', 'lemdeptry11111111', '$2a$10$thmPyuxUVy.rV1.OFnoZGeiU2PXH9lceGYSs75YZoVU4njX6Qp9Pq', 0, 1, 0);
INSERT INTO `user` VALUES (18, b'1', 'thaianhvip', '0931467534', 'qweqw22e@gmail.com', '2020-01-05 00:00:00', 'lemdeptry22', '$2a$10$xakNoNi.J0f1g/JOJ72s3eVlbPrSMCHmRYxaWmEY.DLKn8bdV990q', 0, 1, 0);
INSERT INTO `user` VALUES (19, b'1', 'thaianhvip123', '0931467534', 'qweqwe123@gmail.com', '2020-01-05 00:00:00', 'lemdeptry123', '$2a$10$gWrH/pH0LZon.Iyi.55AZ.0lqC0pMrM84T6nrf.cDe8SFJLvqDR5W', 1, 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for watchlist
-- ----------------------------
DROP TABLE IF EXISTS `watchlist`;
CREATE TABLE `watchlist` (
  `id_user` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  PRIMARY KEY (`id_user`,`id_product`) USING BTREE,
  KEY `fk_watchList_product_idx` (`id_product`) USING BTREE,
  KEY `fk_watchlist_user` (`id_user`) USING BTREE,
  CONSTRAINT `fk_watchlist_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_watchlist_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of watchlist
-- ----------------------------
BEGIN;
INSERT INTO `watchlist` VALUES (1, 1);
INSERT INTO `watchlist` VALUES (2, 1);
INSERT INTO `watchlist` VALUES (3, 2);
INSERT INTO `watchlist` VALUES (10, 44);
INSERT INTO `watchlist` VALUES (10, 45);
INSERT INTO `watchlist` VALUES (10, 49);
INSERT INTO `watchlist` VALUES (7, 53);
INSERT INTO `watchlist` VALUES (7, 56);
INSERT INTO `watchlist` VALUES (10, 56);
INSERT INTO `watchlist` VALUES (10, 57);

SET FOREIGN_KEY_CHECKS = 1;