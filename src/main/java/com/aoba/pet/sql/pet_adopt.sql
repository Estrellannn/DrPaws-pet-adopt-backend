/*
 Navicat Premium Dump SQL

 Source Server         : TIDB
 Source Server Type    : MySQL
 Source Server Version : 80011 (8.0.11-TiDB-v8.5.3-serverless)
 Source Host           : gateway01.ap-southeast-1.prod.alicloud.tidbcloud.com:4000
 Source Schema         : pet_adopt

 Target Server Type    : MySQL
 Target Server Version : 80011 (8.0.11-TiDB-v8.5.3-serverless)
 File Encoding         : 65001

 Date: 22/10/2026 19:44:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adopt
-- ----------------------------
DROP TABLE IF EXISTS `adopt`;
CREATE TABLE `adopt`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pet_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '宠物名字',
  `pet_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '宠物类型：猫/狗',
  `pet_breed` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '宠物品种',
  `pet_age` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '宠物年龄',
  `pet_gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '宠物性别',
  `pet_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '宠物简介',
  `pet_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '宠物图片地址',
  `health` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '健康情况，是否疫苗绝育',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30001 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '宠物领养表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of adopt
-- ----------------------------
INSERT INTO `adopt` VALUES (1, '花花', '猫咪', '狸花', '1岁', '母', '性格温顺亲人，喜欢黏人，会简单握手，寻找稳定的家', '/img/1.jpg', '已打疫苗，未绝育');
INSERT INTO `adopt` VALUES (2, '豆豆', '狗狗', '金毛', '2岁', '母', '软乎乎小金毛，胆子偏小，适合安静家庭', '/img/5.jpg', '已打疫苗，未绝育');
INSERT INTO `adopt` VALUES (3, '面包', '猫咪', '橘猫', '2岁', '公', '很聪明，服从性好，运动量偏大', '/img/2.jpg', '已打疫苗，未绝育');
INSERT INTO `adopt` VALUES (4, '旺财', '狗狗', '牧羊犬', '2岁', '母', '适应能力很强，聪明听话，活泼可爱，性格好，不乱叫', '/img/7.jpg', '已打疫苗，未绝育');
INSERT INTO `adopt` VALUES (5, '土豆', '猫咪', '三花', '1岁', '公', '忠诚热情，很亲人开朗', '/img/3.jpg', '已打疫苗，未绝育');
INSERT INTO `adopt` VALUES (6, '多多', '猫咪', '狸花', '1岁', '公', '超级温顺，安静亲人随便抱', '/img/4.jpg', '已打疫苗，未绝育');
INSERT INTO `adopt` VALUES (7, '毛球', '狗狗', '拉布拉多', '1岁', '母', '小型犬，温顺亲人随便抱，特别乖，安静不叫唤', '/img/6.jpg', '已打疫苗，未绝育');
INSERT INTO `adopt` VALUES (8, '可乐', '狗狗', '金毛', '2岁', '母', '特别老实，安静不叫唤不拆家，大部分时间安静睡觉，会用尿垫', '/img/8.jpg', '已打疫苗，未绝育');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户名(登录账号，不能重复，不能为空)',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '密码(存加密后的密码，不能为空)',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '昵称，不能为空',
  `gender` tinyint NULL DEFAULT NULL COMMENT '性别 1女 2男 ',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '手机号，不能为空',
  `id_card` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '身份证号，可空',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '住址，可空',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '头像图片url，可空',
  `bg_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '个人主页背景图url，可空',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 90002 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'aoba', '$2a$10$D7uTX43bNbKc3V7oStrqROmkZdg4ZZXiekvRICSrpcm3ycte45Fpi', '苍叶', 2, '13922220422', '412345678912345221', '碧岛旧住民区东区', '/img/aoba.jpg', NULL);
INSERT INTO `user` VALUES (2, '阿斯代伦', '$2a$10$oCWn2idK9TCRgTYYfZpeAeCtnU70YTzgfznvWWFmhftRsTXCJFlX6', '阿斯代伦', 2, '13813001492', '440106199202021234', '博得之门上城区', '/img/阿斯代伦.png', NULL);
INSERT INTO `user` VALUES (3, '强尼', '$2a$10$Z6cOiUF4BT2HvqVYJjSosexP0GjlkgtAsFmNN6I0s9qrC7dDiYJVa', '强尼·银手', 2, '13800001116', NULL, '夜之城沃森区来生酒吧', '/img/强尼.jpg', NULL);
INSERT INTO `user` VALUES (4, '亨利', '$2a$10$jYiBh7R./lYXgDQ1E90QtOG82OeP201Da9dj6Xfi3gmaAg/3zFGte', '亨利', 2, '13800001403', NULL, '库特堡铁匠铺', '/img/henry.jpg', NULL);
INSERT INTO `user` VALUES (5, 'bond', '$2a$10$gtbS6i4z/FR/iSnZcylmtOY7emukS9qB4kUiuXIrWGjDMY7IrWvNG', 'James Bond', 2, '13800001111', NULL, '伦敦贝斯沃特', '/img/James Bond.png', NULL);
INSERT INTO `user` VALUES (6, '悟空', '$2a$10$PRoQL2bLF3T7SwgRgno.r.TtyPWPAQlK.3GXpANb5xKZayyTPV692', '悟空', 2, '13800008884', NULL, '花果山', '/img/悟空.jpg', NULL);
INSERT INTO `user` VALUES (60003, '1', '$2a$10$iXHjEW/mYc//4AHXBNngcuf8mnvOUjqYNCijff7IKfIcLV0FmJWni', '测试1', 2, '13245223211', '645673575', '大厦积分hi是', 'http://localhost:8888/avatar/dab1e8dd-d0f5-46e1-8fcd-563e7ec8f6b7.webp', NULL);

SET FOREIGN_KEY_CHECKS = 1;
