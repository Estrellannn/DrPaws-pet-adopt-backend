CREATE DATABASE IF NOT EXISTS pet_adopt DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE pet_adopt;

USE pet_adopt;
CREATE TABLE adopt (
  `id` INT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
  `pet_name` VARCHAR(50) NOT NULL COMMENT '宠物名字',
  `pet_type` VARCHAR(30) NOT NULL COMMENT '宠物类型：猫/狗',
  `pet_breed` VARCHAR(50) COMMENT '宠物品种',
  `pet_age` VARCHAR(30) COMMENT '宠物年龄',
  `pet_gender` VARCHAR(10) COMMENT '宠物性别',
  `pet_desc` TEXT COMMENT '宠物简介',
  `pet_img` VARCHAR(255) COMMENT '宠物图片地址',
  `health` VARCHAR(50) COMMENT '健康情况，是否疫苗绝育'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='宠物领养表';


INSERT INTO `adopt`(`pet_name`,`pet_type`,`pet_breed`,`pet_age`,`pet_gender`,`pet_desc`,`pet_img`,`health`)
VALUES
('花花','猫咪','狸花','1岁','母','性格温顺亲人，喜欢黏人，会简单握手，寻找稳定的家','/img/1.jpg','已打疫苗，未绝育'),
('豆豆','狗狗','金毛','2岁','母','软乎乎小金毛，胆子偏小，适合安静家庭','/img/5.jpg','已打疫苗，未绝育'),
('面包','猫咪','橘猫','2岁','公','很聪明，服从性好，运动量偏大','/img/2.jpg','已打疫苗，未绝育'),
('旺财','狗狗','牧羊犬','2岁','母','适应能力很强，聪明听话，活泼可爱，性格好，不乱叫','/img/7.jpg','已打疫苗，未绝育'),
('土豆','猫咪','三花','1岁','公','忠诚热情，很亲人开朗','/img/3.jpg','已打疫苗，未绝育'),
('多多','猫咪','狸花','1岁','公','超级温顺，安静亲人随便抱','/img/4.jpg','已打疫苗，未绝育'),
('毛球','狗狗','拉布拉多','1岁','母','小型犬，温顺亲人随便抱，特别乖，安静不叫唤','/img/6.jpg','已打疫苗，未绝育'),
('可乐','狗狗','金毛','2岁','母','特别老实，安静不叫唤不拆家，大部分时间安静睡觉，会用尿垫','/img/8.jpg','已打疫苗，未绝育');


CREATE TABLE `user` (
  `id` BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '主键id',
  `username` VARCHAR(50) NOT NULL UNIQUE COMMENT '用户名(登录账号，不能重复，不能为空)',
  `password` VARCHAR(100) NOT NULL COMMENT '密码(存加密后的密码，不能为空)',
  `nickname` VARCHAR(50) NOT NULL COMMENT '昵称，不能为空',
  `gender` TINYINT DEFAULT NULL COMMENT '性别 1女 2男 ',
  `phone` VARCHAR(11) NOT NULL COMMENT '手机号，不能为空',
  `id_card` VARCHAR(18) DEFAULT NULL COMMENT '身份证号，可空',
  `address` VARCHAR(255) DEFAULT NULL COMMENT '住址，可空',
  `avatar` VARCHAR(255) DEFAULT NULL COMMENT '头像图片url，可空',
  `bg_img` VARCHAR(255) DEFAULT NULL COMMENT '个人主页背景图url，可空'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';


INSERT INTO `user` (`id`, `username`, `password`, `nickname`, `gender`, `phone`, `id_card`, `address`, `avatar`, `bg_img`)
VALUES
(1, 'aoba', '123', '苍叶', 2, '13922220422', '412345678912345221', '碧岛旧住民区东区', '/img/aoba.jpg', NULL),
(2, '阿斯代伦', '456', '阿斯代伦', 2, '13813001492', '440106199202021234', '博得之门上城区', '/img/阿斯代伦.png', NULL),
(3, '强尼', '789', '强尼·银手', 2, '13800001116', NULL, '夜之城沃森区来生酒吧', '/img/强尼.jpg', NULL),
(4, '亨利', '012', '亨利', 2, '13800001403', NULL, '库特堡铁匠铺', '/img/henry.jpg', NULL),
(5, 'bond', '111', 'James Bond', 2, '13800001111', NULL, '伦敦贝斯沃特', '/img/James Bond.png', NULL),
(6, '悟空', '222', '悟空', 2, '13800008884', NULL, '花果山', '/img/悟空.jpg', NULL);


