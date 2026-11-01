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

 Date: 01/11/2026 21:06:28
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
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '分类主键',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '分类名称：宠物日常、宠物喂养、宠物医疗、宠物训练',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30002 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '帖子分类表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (3, '宠物医疗');
INSERT INTO `category` VALUES (2, '宠物喂养');
INSERT INTO `category` VALUES (1, '宠物日常');
INSERT INTO `category` VALUES (4, '宠物训练');

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '帖子主键',
  `user_id` bigint NOT NULL COMMENT '发布用户id，关联user.id',
  `category_id` bigint NOT NULL COMMENT '分类id，关联category.id',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '帖子标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '帖子正文',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_category_id`(`category_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60002 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '帖子表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES (1, 3, 1, '我家猫咪很粘人', '家里这只小猫是之前领养回来的，胆子很小，花了快一个月才慢慢信任我。现在特别粘人，每天下班刚走到门口就能听见它叫，开门就围着腿来回蹭，不管我是坐着追剧还是敲代码，都喜欢趴在旁边陪着。脾气很好，很少乱抓东西，也不随便上床，是一只很懂事的小宝贝，分享几张它日常的照片。');
INSERT INTO `post` VALUES (2, 2, 2, '幼犬换粮注意事项', '很多新手养狗容易直接一次性换新狗粮，这样很容易导致狗狗肠胃不适、软便甚至拉稀。正确做法是遵循7天换粮法，第一天旧粮占75%、新粮25%，之后每天逐步提高新粮比例，第七天完全换成新粮。换粮期间多观察狗狗的便便和精神状态，如果持续腹泻就要暂停换粮，优先考虑是不是粮食不适合它。');
INSERT INTO `post` VALUES (3, 1, 3, '猫咪耳螨处理分享', '前段时间发现家里猫咪总频繁挠耳朵、甩头，耳朵里面黑黑脏脏的，带去检查确诊是耳螨。每天坚持先用洗耳液清理耳道污垢，再上药，一定要坚持疗程，不能看着好转就停药，很容易复发。平时也要定期给猫咪清洁耳朵，多晒猫窝，保持环境干燥，耳螨很容易在潮湿环境反复传染。');
INSERT INTO `post` VALUES (4, 4, 4, '狗狗基础随行训练心得', '很多狗狗出门喜欢爆冲，拉着主人到处跑，很容易发生危险。我这段时间一直在训练我家小狗随行，核心就是牵短牵引绳，狗狗冲到前面就停下不走，等它回到身侧再继续前进并且给零食奖励。训练要有耐心，每次时间不要太长，循序渐进，慢慢狗狗就会习惯跟在身边走路，不会随便乱跑。');
INSERT INTO `post` VALUES (5, 5, 1, '领养小狗一个月记录', '一个月前成功领养了这只小土狗，刚来的时候怯生生的，躲在角落不敢出来，也不敢吃东西。经过这段时间慢慢陪伴，现在已经完全放开了，会主动跑过来撒娇，出去玩也很活泼。领养之前我也做了很多功课，领养不是一时兴起，是长久的责任，希望更多人愿意选择领养代替购买。');
INSERT INTO `post` VALUES (6, 6, 2, '猫咪主食罐头怎么挑选', '挑选猫咪主食罐头不能只看适口性，重点要看配料表，肉含量要高，尽量避开大量胶、植物蛋白还有过多添加剂。主食罐可以替代猫粮作为正餐，不要长期只喂零食罐，零食罐营养不均衡，吃多了容易挑食。喂食的时候也要控制好分量，根据猫咪体重调整，避免长胖。');

-- ----------------------------
-- Table structure for post_image
-- ----------------------------
DROP TABLE IF EXISTS `post_image`;
CREATE TABLE `post_image`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '图片主键',
  `post_id` bigint NOT NULL COMMENT '帖子id，关联post.id',
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '图片访问地址',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_post_id`(`post_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60002 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '帖子图片表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of post_image
-- ----------------------------
INSERT INTO `post_image` VALUES (1, 2, '/img/asdl1.jpg');
INSERT INTO `post_image` VALUES (2, 2, '/img/asdl2.jpg');
INSERT INTO `post_image` VALUES (3, 3, '/img/aoba1.jpg');
INSERT INTO `post_image` VALUES (4, 1, '/img/ni1.png');
INSERT INTO `post_image` VALUES (5, 1, '/img/ni2.png');
INSERT INTO `post_image` VALUES (6, 4, '/img/hen1.png');
INSERT INTO `post_image` VALUES (7, 4, '/img/hen2.png');
INSERT INTO `post_image` VALUES (8, 5, '/img/bond1.png');
INSERT INTO `post_image` VALUES (9, 5, '/img/bond2.png');
INSERT INTO `post_image` VALUES (10, 5, '/img/bond3.png');
INSERT INTO `post_image` VALUES (11, 6, '/img/wu1.png');
INSERT INTO `post_image` VALUES (12, 6, '/img/wu2.png');
INSERT INTO `post_image` VALUES (13, 6, '/img/wu3.png');

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
INSERT INTO `user` VALUES (60003, '1', '$2a$10$s.YEEbPPggw/762IDDfsyeyTqg6D4s3/TOQVSMTbCHG9bIoUIhGIC', '测试', 2, '13245223211', '645673575', '夜之城', 'http://localhost:8888/avatar/50816626-7185-4955-a810-5ca9f5d8ffd9.webp', NULL);

SET FOREIGN_KEY_CHECKS = 1;
