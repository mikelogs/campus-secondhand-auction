/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : second_hand_trading

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 16/09/2024 14:45:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sh_address
-- ----------------------------
DROP TABLE IF EXISTS `sh_address`;
CREATE TABLE `sh_address`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `consignee_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `consignee_phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人手机号',
  `province_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省',
  `city_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '市',
  `region_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区',
  `detail_address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
  `default_flag` tinyint NOT NULL COMMENT '是否默认地址',
  `user_id` bigint NOT NULL COMMENT '用户主键id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_index`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '地址表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sh_address
-- ----------------------------
INSERT INTO `sh_address` VALUES (36, '王国栋', '12345678910', '男生宿舍', '14号楼', '二层', '205，楼道东边，靠着厕所', 1, 40);
INSERT INTO `sh_address` VALUES (37, '李佳伟', '98765432110', '男生宿舍', '11号楼', '三层', '305楼道东侧挨着厕所', 1, 36);
INSERT INTO `sh_address` VALUES (38, '程建国', '18713790195', '男生宿舍', '11号楼', '二层', '205', 1, 37);
INSERT INTO `sh_address` VALUES (39, '美美', '15263698569', '女生宿舍', '9号楼', '一层', '103 楼道最东边', 1, 38);
INSERT INTO `sh_address` VALUES (40, '李娜', '15896565656', '女生宿舍', '9号楼', '四层', '406 楼道最东边，按着厕所', 1, 39);

-- ----------------------------
-- Table structure for sh_admin
-- ----------------------------
DROP TABLE IF EXISTS `sh_admin`;
CREATE TABLE `sh_admin`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `account_number` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员账号',
  `admin_password` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `admin_name` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员名字',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account_number`(`account_number` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sh_admin
-- ----------------------------
INSERT INTO `sh_admin` VALUES (1, 'admin', '123456', '超级管理员');
INSERT INTO `sh_admin` VALUES (2, 'admin1', '123456', '超级管理员二号');

-- ----------------------------
-- Table structure for sh_favorite
-- ----------------------------
DROP TABLE IF EXISTS `sh_favorite`;
CREATE TABLE `sh_favorite`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键id',
  `create_time` datetime NOT NULL COMMENT '加入收藏的时间',
  `user_id` bigint NOT NULL COMMENT '用户主键id',
  `idle_id` bigint NOT NULL COMMENT '闲置物主键id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id` ASC, `idle_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收藏信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sh_favorite
-- ----------------------------
INSERT INTO `sh_favorite` VALUES (57, '2022-03-18 08:38:40', 38, 107);
INSERT INTO `sh_favorite` VALUES (60, '2022-04-11 02:54:05', 40, 97);
INSERT INTO `sh_favorite` VALUES (61, '2024-06-17 07:09:01', 37, 184);
INSERT INTO `sh_favorite` VALUES (62, '2024-09-16 06:35:31', 36, 181);
INSERT INTO `sh_favorite` VALUES (63, '2024-09-16 06:36:35', 36, 179);
INSERT INTO `sh_favorite` VALUES (64, '2024-09-16 06:37:00', 36, 178);
INSERT INTO `sh_favorite` VALUES (65, '2024-09-16 06:37:08', 36, 169);
INSERT INTO `sh_favorite` VALUES (66, '2024-09-16 06:42:17', 37, 181);

-- ----------------------------
-- Table structure for sh_idle_item
-- ----------------------------
DROP TABLE IF EXISTS `sh_idle_item`;
CREATE TABLE `sh_idle_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `idle_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '闲置物名称',
  `idle_details` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详情',
  `picture_list` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图集',
  `idle_price` decimal(10, 2) NOT NULL COMMENT '价格',
  `idle_place` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发货地区',
  `idle_label` int NOT NULL COMMENT '分类标签',
  `release_time` datetime NOT NULL COMMENT '发布时间',
  `idle_status` tinyint NOT NULL COMMENT '状态（发布1、下架2、删除0）',
  `user_id` bigint NOT NULL COMMENT '用户主键id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_index`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 189 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '二手商品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sh_idle_item
-- ----------------------------
INSERT INTO `sh_idle_item` VALUES (81, '三星手机', '二手闲置三星手机', '[\"http://localhost:8080/image?imageName=file164569022369110021.jpg\"]', 1000.00, '14号楼', 1, '2022-02-24 08:10:28', 2, 36);
INSERT INTO `sh_idle_item` VALUES (82, '折叠手机', '几个月前买的折叠手机，不想要了', '[\"http://localhost:8080/image?imageName=file164569133572210032.jpg\"]', 2999.00, '14号楼', 1, '2022-02-24 08:28:59', 2, 36);
INSERT INTO `sh_idle_item` VALUES (83, '苹果6', '9成新 好使  需要联系吧  手机都是自己用的 手机很多  都能用 想要哪个都行 图片里选', '[\"http://localhost:8080/image?imageName=file1645691490496100431.jpg\",\"http://localhost:8080/image?imageName=file1645691493727100532.jpg\"]', 2800.00, '14号楼', 1, '2022-02-24 08:31:37', 2, 36);
INSERT INTO `sh_idle_item` VALUES (84, '新国标电动续航50公里到300公里', '新国标电动自行车，外卖电动自行车，库房直发，高配置电动自行车，全部采用钢丝真空轮胎，液晶仪表，汽车盘刹，LED灯光同城免费送货上门，满意后付款。', '[\"http://localhost:8080/image?imageName=file164569163128810064.jpg\"]', 1980.00, '14号楼', 5, '2022-02-24 08:34:05', 2, 36);
INSERT INTO `sh_idle_item` VALUES (85, '二手书直接卖', '毕业了不要了', '[\"http://localhost:8080/image?imageName=file164569183716710075.jpg\"]', 26.00, '14号楼', 4, '2022-02-24 08:37:21', 2, 36);
INSERT INTO `sh_idle_item` VALUES (86, '道德经妙解', '道德经妙解，看了都懂', '[\"http://localhost:8080/image?imageName=file164569192391610086.jpg\"]', 56.00, '14号楼', 4, '2022-02-24 08:38:48', 2, 36);
INSERT INTO `sh_idle_item` VALUES (87, '从0到1', '创业必看', '[\"http://localhost:8080/image?imageName=file164569201071610097.jpg\"]', 66.00, '14号楼', 4, '2022-02-24 08:40:13', 2, 36);
INSERT INTO `sh_idle_item` VALUES (88, '海尔老彩电', '家里换新，想要的联系', '[\"http://localhost:8080/image?imageName=file164569214053010108.jpg\"]', 260.00, '14号楼', 2, '2022-02-24 08:42:24', 2, 36);
INSERT INTO `sh_idle_item` VALUES (89, '伊莱克斯滚筒洗衣机', '伊莱克斯5公斤滚筒洗衣机 二手滚筒洗衣机 二手洗衣机', '[\"http://localhost:8080/image?imageName=file164569235935910119.jpg\"]', 980.00, '3号楼', 2, '2022-02-24 08:46:02', 0, 37);
INSERT INTO `sh_idle_item` VALUES (90, '惠普4530笔记本电脑', '惠普4530二手笔记本电脑', '[\"http://localhost:8080/image?imageName=file1645692446793101210.jpg\"]', 900.00, '3号楼', 1, '2022-02-24 08:47:36', 2, 37);
INSERT INTO `sh_idle_item` VALUES (91, '二手Mac电脑', '换新了，需要的赶紧联系', '[\"http://localhost:8080/image?imageName=file1645692559553101311.jpg\"]', 4500.00, '3号楼', 1, '2022-02-24 08:49:25', 2, 37);
INSERT INTO `sh_idle_item` VALUES (92, '全自动两用帐篷', '全自动两用帐篷，8成新', '[\"http://localhost:8080/image?imageName=file1645692690642101412.jpg\"]', 150.00, '3号楼', 3, '2022-02-24 08:51:34', 2, 37);
INSERT INTO `sh_idle_item` VALUES (93, '考研圣经', '备考没用完，有想要的可以联系', '[\"http://localhost:8080/image?imageName=file16459478577811002成绩.png\",\"http://localhost:8080/image?imageName=file16459478642741003规划.png\"]', 30.00, '3号楼', 4, '2022-02-27 07:44:36', 0, 37);
INSERT INTO `sh_idle_item` VALUES (94, '水壶', '即将毕业，低价出售', '[\"http://localhost:8080/image?imageName=file16468958478231007d0c8a786c9177f3e8f2b07bb76cf3bc79f3d566d.jpg\"]', 10.00, '16号楼', 2, '2022-03-10 07:04:13', 0, 39);
INSERT INTO `sh_idle_item` VALUES (95, '湿巾', '之前买多了，有想要的便宜点卖给你', '[\"http://localhost:8080/image?imageName=file16468959708381008src=http___img.99114.com_group10_M00_46_59_rBADslopuDqAA6FyAAKbYkZTvKI190.jpg&refer=http___img.99114.jfif\"]', 5.00, '16号楼', 2, '2022-03-10 07:06:13', 0, 39);
INSERT INTO `sh_idle_item` VALUES (96, '湿巾', '之前买多了，低价出售', '[\"http://localhost:8080/image?imageName=file164689617136610091.jpg\"]', 5.00, '16号楼', 2, '2022-03-10 07:09:36', 0, 39);
INSERT INTO `sh_idle_item` VALUES (97, '拖把', '非常好用', '[\"http://localhost:8080/image?imageName=file16468962121991011132.jpg\",\"http://localhost:8080/image?imageName=file16468962121981010src.jpg\"]', 10.00, '16号楼', 2, '2022-03-10 07:10:21', 0, 39);
INSERT INTO `sh_idle_item` VALUES (98, '水桶', '打扫宿舍可以用，冲凉水澡可以用', '[\"http://localhost:8080/image?imageName=file1646896286973101223165.jpg\"]', 10.00, '16号楼', 2, '2022-03-10 07:11:32', 0, 39);
INSERT INTO `sh_idle_item` VALUES (99, '篮球', '乔丹的，买的时候二百多', '[\"http://localhost:8080/image?imageName=file16468963766011014165165.jpg\"]', 60.00, '16号楼', 3, '2022-03-10 07:13:05', 0, 39);
INSERT INTO `sh_idle_item` VALUES (100, '羽毛球拍', '九成新，没玩过几次，低价出售', '[\"http://localhost:8080/image?imageName=file16468992372591015f.jpg\"]', 40.00, '16号楼', 3, '2022-03-10 08:00:41', 0, 39);
INSERT INTO `sh_idle_item` VALUES (101, '足球', '最近加了排球队，想买个二手足球，老哥们谁有不想要的足球呀！！', '[\"http://localhost:8080/image?imageName=file16469001406541016123132123231.jpg\"]', -40.00, '16号楼', 5, '2022-03-10 08:15:56', 0, 39);
INSERT INTO `sh_idle_item` VALUES (102, '来本python', '容易入门的那种', '[\"http://localhost:8080/image?imageName=file16469112956741019书.jpg\"]', 0.00, '14号楼', 5, '2022-03-10 11:21:38', 0, 39);
INSERT INTO `sh_idle_item` VALUES (103, '足球', '求一个二手足球', '[]', 0.00, '10号楼', 5, '2022-03-10 12:20:29', 0, 39);
INSERT INTO `sh_idle_item` VALUES (104, '求一副乒乓球拍', '20~30左右', '[]', 0.00, '5号楼', 5, '2022-03-10 13:48:18', 0, 39);
INSERT INTO `sh_idle_item` VALUES (105, '键盘', '手感超好，八成新', '[\"http://localhost:8080/image?imageName=file16469607002831004jlkj.jpg\",\"http://localhost:8080/image?imageName=file16469607146191005adsf.jpg\"]', 120.00, '11号楼', 1, '2022-03-11 01:05:27', 2, 40);
INSERT INTO `sh_idle_item` VALUES (106, '平板电脑', '考研必备，七成新，有需要的联系', '[\"http://localhost:8080/image?imageName=file16469608275821006131232.jpg\"]', 1500.00, '11号楼', 1, '2022-03-11 01:07:12', 0, 40);
INSERT INTO `sh_idle_item` VALUES (107, '速度拳击球', '散打专用，八成新', '[\"http://localhost:8080/image?imageName=file16469610415851007aefsd.jpg\"]', 100.00, '11号楼', 3, '2022-03-11 01:10:44', 0, 40);
INSERT INTO `sh_idle_item` VALUES (108, '想买本机器学习的书', '那种数学公式比较详细的最好，抱拳了老铁们！！', '[\"http://localhost:8080/image?imageName=file16473369568111002132135.jpg\"]', 0.00, '14号楼', 5, '2022-03-15 09:36:01', 0, 38);
INSERT INTO `sh_idle_item` VALUES (109, '历史书，八成新', '刚买了不久，不想用了', '[\"http://localhost:8080/image?imageName=file16475926255961002书234asdf.jfif\"]', 50.00, '14号楼', 4, '2022-03-18 08:38:18', 0, 38);
INSERT INTO `sh_idle_item` VALUES (110, '求一本高等数学的课本', '急求！！！', '[\"http://localhost:8080/image?imageName=file16475929517481003123.jpg\"]', 0.00, '10号楼', 5, '2022-03-18 08:42:47', 1, 38);
INSERT INTO `sh_idle_item` VALUES (111, '书', '很便宜', '[\"http://localhost:8080/image?imageName=file16476083329261004书66.jfif\"]', 40.00, '12号楼', 2, '2022-03-18 12:59:01', 0, 38);
INSERT INTO `sh_idle_item` VALUES (112, '113', '213', '[\"http://localhost:8080/image?imageName=file16476083749971005书234.jfif\"]', 123.23, '11号楼', 3, '2022-03-18 12:59:37', 0, 38);
INSERT INTO `sh_idle_item` VALUES (113, '123', '123456789', '[]', 10.00, '11号楼', 1, '2022-04-11 06:36:47', 0, 40);
INSERT INTO `sh_idle_item` VALUES (114, '4524', '42524', '[]', 60.00, '8号楼', 2, '2022-05-01 08:19:19', 0, 37);
INSERT INTO `sh_idle_item` VALUES (115, '178274', '2782782', '[\"http://localhost:8080/image?imageName=file16513932186671002书53.jpg\"]', 60.00, '8号楼', 1, '2022-05-01 08:20:20', 0, 40);
INSERT INTO `sh_idle_item` VALUES (116, '245', '453', '[\"http://localhost:8080/image?imageName=file16513935068611003T1Jq0gXidvXXXXXXXX.png\"]', 70.00, '8号楼', 2, '2022-05-01 08:25:09', 0, 37);
INSERT INTO `sh_idle_item` VALUES (117, '212', '1212', '[]', 30.00, '11号楼', 1, '2022-05-01 08:27:09', 0, 37);
INSERT INTO `sh_idle_item` VALUES (118, '544', '4854', '[]', 30.00, '10号楼', 1, '2022-05-01 08:28:14', 0, 40);
INSERT INTO `sh_idle_item` VALUES (119, '452', '452', '[\"http://localhost:8080/image?imageName=file16513938440741004T1Jq0gXidvXXXXXXXX.png\"]', 50.00, '7号楼', 4, '2022-05-01 08:30:46', 0, 37);
INSERT INTO `sh_idle_item` VALUES (120, '752', '17', '[]', 40.00, '8号楼', 4, '2022-05-01 08:32:11', 0, 40);
INSERT INTO `sh_idle_item` VALUES (121, '524', '52', '[]', 30.00, '8号楼', 3, '2022-05-01 08:38:54', 0, 37);
INSERT INTO `sh_idle_item` VALUES (122, 'dfas', 'asdf', '[]', 30.00, '13号楼', 3, '2022-05-01 08:39:35', 0, 37);
INSERT INTO `sh_idle_item` VALUES (123, 'ad', 'asdf', '[]', 20.00, '7号楼', 3, '2022-05-01 08:41:31', 0, 37);
INSERT INTO `sh_idle_item` VALUES (124, '4425', '452542', '[]', 10.00, '7号楼', 3, '2022-05-01 08:43:59', 0, 37);
INSERT INTO `sh_idle_item` VALUES (125, 'asdf', 'asdf', '[\"http://localhost:8080/image?imageName=file16513951184911002T1Jq0gXidvXXXXXXXX.png\"]', 100.00, '9号楼', 1, '2022-05-01 08:52:00', 0, 40);
INSERT INTO `sh_idle_item` VALUES (126, '21', '785785', '[]', 5785.00, '9号楼', 2, '2022-05-01 08:54:45', 0, 37);
INSERT INTO `sh_idle_item` VALUES (127, '4521', '4252', '[]', 80.00, '9号楼', 1, '2022-05-01 08:55:33', 0, 37);
INSERT INTO `sh_idle_item` VALUES (128, 'dv', 'dfad', '[]', 20.00, '8号楼', 1, '2022-05-01 08:57:06', 0, 40);
INSERT INTO `sh_idle_item` VALUES (129, '5234', '452', '[]', 40.00, '11号楼', 4, '2022-05-01 08:58:16', 0, 37);
INSERT INTO `sh_idle_item` VALUES (130, 'adsf', 'adf', '[]', 20.00, '9号楼', 1, '2022-05-01 08:59:24', 0, 37);
INSERT INTO `sh_idle_item` VALUES (131, 'asdf', '123', '[]', 20.00, '10号楼', 1, '2022-05-01 09:00:16', 0, 37);
INSERT INTO `sh_idle_item` VALUES (132, '153', '153', '[]', 190.00, '11号楼', 3, '2022-05-01 09:04:42', 0, 40);
INSERT INTO `sh_idle_item` VALUES (133, 'adsf', 'adsf', '[]', 10.00, '10号楼', 1, '2022-05-01 09:08:11', 0, 37);
INSERT INTO `sh_idle_item` VALUES (134, 'dasf', 'asdf', '[]', 20.00, '8号楼', 2, '2022-05-01 09:10:32', 0, 40);
INSERT INTO `sh_idle_item` VALUES (135, 'Python', '入门级书籍', '[\"http://localhost:8080/image?imageName=file16518880948481002书.jpg\"]', 30.00, '11号楼', 4, '2022-05-07 01:48:17', 1, 36);
INSERT INTO `sh_idle_item` VALUES (136, 'Java', '自学java就买到它，很好用，九成新', '[\"http://localhost:8080/image?imageName=file16518881435141003书6.jfif\"]', 50.00, '11号楼', 4, '2022-05-07 01:49:06', 1, 36);
INSERT INTO `sh_idle_item` VALUES (137, '趣学pthon', '有要的老铁联系我，低价出售', '[\"http://localhost:8080/image?imageName=file16518882055951004书1.jfif\"]', 20.00, '11号楼', 4, '2022-05-07 01:50:08', 1, 36);
INSERT INTO `sh_idle_item` VALUES (138, '机械键盘', '超级好用，入手半年左右，八成新', '[\"http://localhost:8080/image?imageName=file16518882692421005jlkj.jpg\"]', 100.00, '11号楼', 1, '2022-05-07 01:51:12', 1, 36);
INSERT INTO `sh_idle_item` VALUES (139, '水壶', '马上毕业，水壶低价出售', '[\"http://localhost:8080/image?imageName=file16518883325891006d0c8a786c9177f3e8f2b07bb76cf3bc79f3d566d.jpg\"]', 10.00, '11号楼', 2, '2022-05-07 01:52:14', 1, 36);
INSERT INTO `sh_idle_item` VALUES (140, '水桶', '有哪位老铁收购，用来洗澡很方便', '[\"http://localhost:8080/image?imageName=file1651888380624100723165.jpg\"]', 10.00, '11号楼', 2, '2022-05-07 01:53:03', 2, 36);
INSERT INTO `sh_idle_item` VALUES (141, '数控系统手动编程', '低价出售，七成新', '[\"http://localhost:8080/image?imageName=file16518884576041008书3.jfif\"]', 20.00, '14号楼', 4, '2022-05-07 01:54:20', 1, 37);
INSERT INTO `sh_idle_item` VALUES (142, 'C语言', '大学教材，有学弟学妹需要吗', '[\"http://localhost:8080/image?imageName=file16518885029431009书2.jfif\"]', 20.00, '14号楼', 4, '2022-05-07 01:55:07', 2, 37);
INSERT INTO `sh_idle_item` VALUES (143, '史记等中国经典书籍', '低价出售，快来抢购把', '[\"http://localhost:8080/image?imageName=file16518885783071010书234asdf.jfif\"]', 30.00, '14号楼', 4, '2022-05-07 01:56:20', 1, 37);
INSERT INTO `sh_idle_item` VALUES (144, '篮球', '九成新', '[\"http://localhost:8080/image?imageName=file16518886363591011165165.jpg\"]', 100.00, '14号楼', 3, '2022-05-07 01:57:18', 1, 37);
INSERT INTO `sh_idle_item` VALUES (145, '排球', '八成新', '[\"http://localhost:8080/image?imageName=file16518886662551012123132123231.jpg\"]', 30.00, '14号楼', 3, '2022-05-07 01:57:48', 0, 37);
INSERT INTO `sh_idle_item` VALUES (146, '乒乓球拍', '外赠两个球，九成新', '[]', 40.00, '14号楼', 3, '2022-05-07 01:58:36', 0, 37);
INSERT INTO `sh_idle_item` VALUES (147, '乒乓球', '外赠两个球，八成新', '[\"http://localhost:8080/image?imageName=file16518887490211013src=http___img2.niutuku.com_desk_1207_0808_ntk11339.jpg&refer=http___img2.niutuku.jfif\"]', 30.00, '14号楼', 3, '2022-05-07 01:59:12', 0, 37);
INSERT INTO `sh_idle_item` VALUES (148, '运动器材找我', '详细了解，加我微信wzh126516854', '[\"http://localhost:8080/image?imageName=file16518891114451014165164.jpg\"]', 0.00, '14号楼', 5, '2022-05-07 02:05:16', 1, 37);
INSERT INTO `sh_idle_item` VALUES (149, '平板电脑', '低价出售，二手平板，用了一年', '[\"http://localhost:8080/image?imageName=file16518892088571015131232.jpg\"]', 2100.00, '2号楼', 1, '2022-05-07 02:06:53', 1, 38);
INSERT INTO `sh_idle_item` VALUES (150, '笔记本电脑', '九成新，', '[\"http://localhost:8080/image?imageName=file16518892482061016image.jpg\"]', 3156.00, '2号楼', 1, '2022-05-07 02:07:30', 1, 38);
INSERT INTO `sh_idle_item` VALUES (151, '平板平板！！', '低价出售，全新', '[\"http://localhost:8080/image?imageName=file16518892997971017src=http___mercrt-fd.zol-img.com.cn_t_s640x2000_g6_M00_01_0B_ChMkKmBkAouIOSndAAS1swJOKIAAAMY9gJk6-gABLXL642.jpg&refer=http___mercrt-fd.zol-img.com.jfif\"]', 2000.00, '2号楼', 1, '2022-05-07 02:08:45', 0, 38);
INSERT INTO `sh_idle_item` VALUES (152, 'wewfa', 'asdfasd', '[]', 20.00, '11号楼', 1, '2022-05-07 02:09:15', 0, 38);
INSERT INTO `sh_idle_item` VALUES (153, 'asdf', 'adf', '[]', 20.00, '10号楼', 1, '2022-05-07 02:16:44', 0, 36);
INSERT INTO `sh_idle_item` VALUES (154, 'dfasdf', 'asdfasdf', '[]', 10.00, '8号楼', 1, '2022-05-07 02:16:54', 0, 36);
INSERT INTO `sh_idle_item` VALUES (155, 'efa', 'asdf', '[]', 20.00, '10号楼', 1, '2022-05-07 02:21:46', 0, 37);
INSERT INTO `sh_idle_item` VALUES (156, 'dawf', '大师傅', '[]', 20.00, '11号楼', 1, '2022-05-07 02:23:14', 0, 40);
INSERT INTO `sh_idle_item` VALUES (157, 'dsf', 'asdf', '[]', 10.00, '8号楼', 1, '2022-05-07 02:28:22', 0, 40);
INSERT INTO `sh_idle_item` VALUES (158, 'dfas', 'adf', '[]', 20.00, '6号楼', 1, '2022-05-07 02:28:31', 0, 40);
INSERT INTO `sh_idle_item` VALUES (159, '4252', '452', '[]', 20.00, '8号楼', 2, '2022-05-12 12:44:44', 0, 40);
INSERT INTO `sh_idle_item` VALUES (160, '417', '14', '[]', 40.00, '10号楼', 2, '2022-05-12 12:44:56', 0, 40);
INSERT INTO `sh_idle_item` VALUES (161, 'adsf', 'adf', '[]', 20.00, '10号楼', 2, '2022-05-12 13:05:40', 0, 37);
INSERT INTO `sh_idle_item` VALUES (162, 'adf', 'adf', '[]', 20.00, '8号楼', 2, '2022-05-12 13:05:50', 0, 37);
INSERT INTO `sh_idle_item` VALUES (163, 'adsf', 'asdf', '[]', 30.00, '10号楼', 2, '2022-05-12 13:08:25', 0, 40);
INSERT INTO `sh_idle_item` VALUES (164, 'asdf', 'adf', '[]', 20.00, '8号楼', 1, '2022-05-12 13:08:36', 0, 40);
INSERT INTO `sh_idle_item` VALUES (165, 'asdf', 'asdf', '[]', 10.00, '11号楼', 2, '2022-05-12 13:08:45', 0, 40);
INSERT INTO `sh_idle_item` VALUES (166, '出售哑铃', '宿舍健身必备，低价出售一对', '[\"http://localhost:8080/image?imageName=file16524424818461002src=http___s.xcditu.com_trash_20190701_20191107102718606.jpg&refer=http___s.xcditu.jfif\"]', 60.00, '7号楼', 3, '2022-05-13 11:48:06', 0, 38);
INSERT INTO `sh_idle_item` VALUES (167, '健身哑铃', '宿舍健身必备！！低价出售！', '[\"http://localhost:8080/image?imageName=file16524425723491004123.png\"]', 50.00, '2号楼', 3, '2022-05-13 11:49:38', 1, 38);
INSERT INTO `sh_idle_item` VALUES (168, '时尚机械键盘', '好看又好用，九成新，用了不到2个月，紧急出售！！', '[]', 128.00, '2号楼', 1, '2022-05-13 11:51:23', 0, 38);
INSERT INTO `sh_idle_item` VALUES (169, '机械键盘', '好看又好用，九成新，用了不到2个月，紧急出售！！', '[\"http://localhost:8080/image?imageName=file16524427230081005adsf.jpg\"]', 128.00, '2号楼', 1, '2022-05-13 11:52:06', 1, 38);
INSERT INTO `sh_idle_item` VALUES (170, '篮球', '5成新，需要的找我', '[\"http://localhost:8080/image?imageName=file16524427826181006165165.jpg\"]', 80.00, '2号楼', 3, '2022-05-13 11:53:07', 1, 38);
INSERT INTO `sh_idle_item` VALUES (171, '乒乓球拍', '低价出售，很好用，红双喜的！！', '[\"http://localhost:8080/image?imageName=file165244286141110081231213.png\"]', 70.00, '2号楼', 3, '2022-05-13 11:54:27', 1, 38);
INSERT INTO `sh_idle_item` VALUES (172, '湿巾', '低价出售，可以团购哦！', '[\"http://localhost:8080/image?imageName=file165244302831110091.jpg\"]', 10.00, '9号楼', 2, '2022-05-13 11:57:11', 1, 39);
INSERT INTO `sh_idle_item` VALUES (173, '拖把', '超级好用，临近毕业低价出售给学弟学妹们^_^', '[\"http://localhost:8080/image?imageName=file16524431015941010132.jpg\",\"http://localhost:8080/image?imageName=file16524431061461011src.jpg\"]', 20.00, '10号楼', 2, '2022-05-13 11:58:30', 1, 39);
INSERT INTO `sh_idle_item` VALUES (174, '学习用品低价出售！！', '笔记本，笔，学习用品十分全面', '[\"http://localhost:8080/image?imageName=file16524434384781012132.jpg\"]', 0.00, '9号楼', 5, '2022-05-13 12:04:03', 2, 39);
INSERT INTO `sh_idle_item` VALUES (175, '剑指offer', '面试必备！！', '[\"http://localhost:8080/image?imageName=file16524435432041013书234.jfif\"]', 50.00, '9号楼', 4, '2022-05-13 12:05:47', 1, 39);
INSERT INTO `sh_idle_item` VALUES (176, 'Java大蓝书', '学Java就用它，低价买给学弟学妹', '[\"http://localhost:8080/image?imageName=file16524436588441014书66.jfif\"]', 20.00, '9号楼', 4, '2022-05-13 12:07:43', 1, 39);
INSERT INTO `sh_idle_item` VALUES (177, '爱华辅导平板电脑', '低价出售，7成新', '[\"http://localhost:8080/image?imageName=file16524438710431016156.jpg\"]', 300.00, '9号楼', 1, '2022-05-13 12:11:14', 1, 39);
INSERT INTO `sh_idle_item` VALUES (178, '华为平板', '考研可以用，16G+128G,全新', '[\"http://localhost:8080/image?imageName=file1652443963449101813.jpg\"]', 3200.00, '9号楼', 1, '2022-05-13 12:12:46', 1, 39);
INSERT INTO `sh_idle_item` VALUES (179, '平板批发价', '买平板找我，靠谱！', '[\"http://localhost:8080/image?imageName=file1652444155511102015.jpg\",\"http://localhost:8080/image?imageName=file165244418977610229256.jpg\"]', 530.00, '12号楼', 1, '2022-05-13 12:16:35', 1, 43);
INSERT INTO `sh_idle_item` VALUES (180, '键盘', '6成新，用了一年多，低价出售', '[\"http://localhost:8080/image?imageName=file16524442654841023jfi.jpg\"]', 60.00, '12号楼', 1, '2022-05-13 12:17:49', 0, 43);
INSERT INTO `sh_idle_item` VALUES (181, '黑色机械键盘', '黑轴，多种光效', '[\"http://localhost:8080/image?imageName=file16524842187971002123.gif\"]', 135.00, '14号楼', 1, '2022-05-13 23:23:42', 2, 40);
INSERT INTO `sh_idle_item` VALUES (182, '水桶', '夏天洗澡可以用', '[\"http://localhost:8080/image?imageName=file1652484350639100323165.jpg\"]', 20.00, '14号楼', 2, '2022-05-13 23:25:55', 2, 40);
INSERT INTO `sh_idle_item` VALUES (183, '排球', '九成新，低价出售', '[\"http://localhost:8080/image?imageName=file16524844444851004123132123231.jpg\"]', 30.00, '14号楼', 3, '2022-05-13 23:27:28', 2, 40);
INSERT INTO `sh_idle_item` VALUES (184, 'C语言经典编程282例', '本科辅助教材，有要的学弟学妹可以抢购！！', '[\"http://localhost:8080/image?imageName=file16524845823371005书2.jfif\"]', 10.00, '12号楼', 4, '2022-05-13 23:30:31', 2, 36);
INSERT INTO `sh_idle_item` VALUES (185, '垃圾桶！！', '低价出售垃圾桶', '[\"http://localhost:8080/image?imageName=file165248474214510061685456.jpg\"]', 5.00, '11号楼', 2, '2022-05-13 23:32:30', 2, 37);
INSERT INTO `sh_idle_item` VALUES (186, '羽毛球拍', '九成新，就玩过几次，毕业了，低价出售', '[\"http://localhost:8080/image?imageName=file16524848854481007f.jpg\"]', 60.00, '9号楼', 3, '2022-05-13 23:34:49', 2, 38);
INSERT INTO `sh_idle_item` VALUES (187, '苹果13', '用了一年了，低价出售', '[\"http://localhost:8080/image?imageName=file16524853302661009adf.png\"]', 3400.00, '9号楼', 1, '2022-05-13 23:42:13', 2, 39);
INSERT INTO `sh_idle_item` VALUES (188, '衣服架', '有需要的没？低价出售！！', '[\"http://localhost:8080/image?imageName=file165248581812010101654856.jpg\"]', 10.00, '12号楼', 2, '2022-05-13 23:50:22', 1, 37);

-- ----------------------------
-- Table structure for sh_message
-- ----------------------------
DROP TABLE IF EXISTS `sh_message`;
CREATE TABLE `sh_message`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` bigint NOT NULL COMMENT '用户主键id',
  `idle_id` bigint NOT NULL COMMENT '闲置主键id',
  `content` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '留言内容',
  `create_time` datetime NOT NULL COMMENT '留言时间',
  `to_user` bigint NOT NULL COMMENT '所回复的用户',
  `to_message` bigint NULL DEFAULT NULL COMMENT '所回复的留言',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_index`(`user_id` ASC) USING BTREE,
  INDEX `idle_id_index`(`idle_id` ASC) USING BTREE,
  INDEX `to_user_index`(`to_user` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '留言表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sh_message
-- ----------------------------
INSERT INTO `sh_message` VALUES (36, 37, 85, '可以便宜吗', '2022-02-24 08:52:50', 36, NULL);
INSERT INTO `sh_message` VALUES (37, 38, 92, '能便宜点吗', '2022-02-27 07:32:09', 37, NULL);
INSERT INTO `sh_message` VALUES (38, 37, 92, '一口价130，再低不卖了', '2022-02-27 07:33:46', 37, NULL);
INSERT INTO `sh_message` VALUES (39, 37, 92, '可笑', '2022-02-27 07:34:34', 37, 38);
INSERT INTO `sh_message` VALUES (40, 37, 92, '那你别买了', '2022-02-27 07:34:49', 37, 39);
INSERT INTO `sh_message` VALUES (41, 37, 92, '不能', '2022-02-27 07:35:03', 38, 37);
INSERT INTO `sh_message` VALUES (42, 38, 92, '咋下架了，150我要了', '2022-02-27 07:36:27', 37, 41);
INSERT INTO `sh_message` VALUES (43, 37, 90, '啥时候买的，老铁', '2022-02-27 07:37:51', 37, NULL);
INSERT INTO `sh_message` VALUES (44, 37, 90, '前年，用着还行', '2022-02-27 07:38:43', 37, 43);
INSERT INTO `sh_message` VALUES (47, 38, 104, '我这有，马上毕业不玩了', '2022-03-10 14:14:00', 39, NULL);
INSERT INTO `sh_message` VALUES (48, 39, 104, '那太好了，你发布一下，我看看', '2022-03-10 14:14:46', 38, 47);
INSERT INTO `sh_message` VALUES (49, 38, 104, '好的，没问题', '2022-03-10 14:15:08', 39, 48);
INSERT INTO `sh_message` VALUES (50, 38, 103, '我这有', '2022-03-15 09:38:32', 39, NULL);
INSERT INTO `sh_message` VALUES (51, 39, 103, '老哥，多少钱好商量', '2022-03-15 09:40:11', 38, 50);
INSERT INTO `sh_message` VALUES (52, 38, 103, '30把，不算贵把，玩了一年左右，还挺新的', '2022-03-15 09:40:49', 39, 51);
INSERT INTO `sh_message` VALUES (53, 38, 107, '能不能便宜点？', '2022-03-18 08:39:26', 40, NULL);
INSERT INTO `sh_message` VALUES (54, 38, 110, '我这有', '2022-03-18 08:43:01', 38, NULL);
INSERT INTO `sh_message` VALUES (55, 39, 81, '再便宜点，老哥', '2022-04-10 12:07:22', 36, NULL);
INSERT INTO `sh_message` VALUES (56, 38, 171, '还送两个球啊，老铁们快来抢购啦！！', '2022-05-13 11:54:53', 38, NULL);

-- ----------------------------
-- Table structure for sh_order
-- ----------------------------
DROP TABLE IF EXISTS `sh_order`;
CREATE TABLE `sh_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `order_number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `user_id` bigint NOT NULL COMMENT '用户主键id',
  `idle_id` bigint NOT NULL COMMENT '闲置物品主键id',
  `order_price` decimal(10, 2) NOT NULL COMMENT '订单总价',
  `payment_status` tinyint NOT NULL COMMENT '支付状态',
  `payment_way` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `payment_time` datetime NULL DEFAULT NULL COMMENT '支付时间',
  `order_status` tinyint NOT NULL COMMENT '订单状态',
  `is_deleted` tinyint NULL DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 144 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sh_order
-- ----------------------------
INSERT INTO `sh_order` VALUES (68, '164689994012510003', 39, 87, 66.00, 0, NULL, '2022-03-10 08:12:20', NULL, 4, NULL);
INSERT INTO `sh_order` VALUES (70, '164691168730110005', 38, 102, 0.00, 0, NULL, '2022-03-10 11:28:07', NULL, 4, NULL);
INSERT INTO `sh_order` VALUES (71, '164759277305710002', 38, 107, 100.00, 1, '支付宝', '2022-03-18 08:39:33', '2022-03-18 08:39:42', 1, NULL);
INSERT INTO `sh_order` VALUES (72, '164761068330710003', 39, 109, 50.00, 1, '支付宝', '2022-03-18 13:38:03', '2022-03-18 13:38:10', 1, NULL);
INSERT INTO `sh_order` VALUES (76, '164775343807010002', 40, 111, 40.00, 1, '支付宝', '2022-03-20 05:17:18', '2022-03-20 05:17:22', 1, NULL);
INSERT INTO `sh_order` VALUES (77, '164775408670810003', 40, 98, 10.00, 1, '支付宝', '2022-03-20 05:28:07', '2022-03-20 05:28:12', 1, NULL);
INSERT INTO `sh_order` VALUES (84, '165128114788910002', 40, 97, 10.00, 1, '支付宝', '2022-04-30 01:12:28', '2022-04-30 01:13:32', 1, NULL);
INSERT INTO `sh_order` VALUES (88, '165137420148510002', 40, 94, 10.00, 1, '支付宝', '2022-05-01 03:03:21', '2022-05-01 03:03:24', 2, NULL);
INSERT INTO `sh_order` VALUES (89, '165137443662610002', 40, 86, 56.00, 1, '支付宝', '2022-05-01 03:07:17', '2022-05-01 03:07:20', 1, NULL);
INSERT INTO `sh_order` VALUES (90, '165139133995610002', 40, 82, 2999.00, 1, '支付宝', '2022-05-01 07:49:00', '2022-05-01 07:49:03', 1, NULL);
INSERT INTO `sh_order` VALUES (91, '165139163036010003', 40, 81, 1000.00, 1, '支付宝', '2022-05-01 07:53:50', '2022-05-01 07:53:54', 1, NULL);
INSERT INTO `sh_order` VALUES (92, '165139167437610004', 40, 87, 66.00, 1, '支付宝', '2022-05-01 07:54:34', '2022-05-01 07:54:44', 1, NULL);
INSERT INTO `sh_order` VALUES (93, '165139272504710005', 40, 91, 4500.00, 1, '支付宝', '2022-05-01 08:12:05', '2022-05-01 08:12:08', 1, NULL);
INSERT INTO `sh_order` VALUES (94, '165139298343010006', 40, 85, 26.00, 1, '支付宝', '2022-05-01 08:16:23', '2022-05-01 08:16:28', 2, NULL);
INSERT INTO `sh_order` VALUES (108, '165139482795710020', 37, 106, 1500.00, 1, '支付宝', '2022-05-01 08:47:08', '2022-05-01 08:47:11', 1, NULL);
INSERT INTO `sh_order` VALUES (126, '165215893712710002', 40, 145, 30.00, 1, '支付宝', '2022-05-10 05:02:17', '2022-05-10 05:02:20', 1, NULL);
INSERT INTO `sh_order` VALUES (127, '165235801234910002', 40, 144, 100.00, 1, '支付宝', '2022-05-12 12:20:12', '2022-05-12 12:20:15', 2, NULL);
INSERT INTO `sh_order` VALUES (128, '165235923022310003', 40, 140, 10.00, 1, '支付宝', '2022-05-12 12:40:30', '2022-05-12 12:40:33', 1, NULL);
INSERT INTO `sh_order` VALUES (129, '165235927244510004', 40, 142, 20.00, 1, '支付宝', '2022-05-12 12:41:12', '2022-05-12 12:42:03', 2, NULL);
INSERT INTO `sh_order` VALUES (137, '165244809903710002', 40, 180, 60.00, 1, '支付宝', '2022-05-13 13:21:39', '2022-05-13 13:21:47', 1, NULL);
INSERT INTO `sh_order` VALUES (138, '165248490209310002', 38, 182, 20.00, 1, '支付宝', '2022-05-13 23:35:02', '2022-05-13 23:36:14', 1, NULL);
INSERT INTO `sh_order` VALUES (139, '165248537276210003', 39, 185, 5.00, 1, '支付宝', '2022-05-13 23:42:53', '2022-05-13 23:47:44', 2, NULL);
INSERT INTO `sh_order` VALUES (140, '165250648676810004', 37, 187, 3400.00, 1, '支付宝', '2022-05-14 05:34:47', '2022-05-14 05:34:50', 1, NULL);
INSERT INTO `sh_order` VALUES (141, '171860639424210002', 37, 186, 60.00, 1, '支付宝', '2024-06-17 06:39:54', '2024-06-17 06:40:05', 1, NULL);
INSERT INTO `sh_order` VALUES (142, '171860760077010002', 37, 183, 30.00, 1, '支付宝', '2024-06-17 07:00:01', '2024-06-17 07:00:06', 1, NULL);
INSERT INTO `sh_order` VALUES (143, '171860815971710002', 37, 184, 10.00, 1, '支付宝', '2024-06-17 07:09:20', '2024-06-17 07:09:26', 2, NULL);
INSERT INTO `sh_order` VALUES (144, '172646853276410002', 36, 181, 135.00, 1, '支付宝', '2024-09-16 06:35:33', '2024-09-16 06:36:02', 1, NULL);
INSERT INTO `sh_order` VALUES (145, '172646893899310003', 37, 181, 135.00, 1, '支付宝', '2024-09-16 06:42:19', '2024-09-16 06:42:22', 1, NULL);

-- ----------------------------
-- Table structure for sh_order_address
-- ----------------------------
DROP TABLE IF EXISTS `sh_order_address`;
CREATE TABLE `sh_order_address`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` bigint NOT NULL COMMENT '订单id',
  `consignee_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人',
  `consignee_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
  `detail_address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货地址',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `orderId`(`order_id` ASC) USING BTREE,
  INDEX `order_id_index`(`order_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 126 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单地址表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sh_order_address
-- ----------------------------
INSERT INTO `sh_order_address` VALUES (55, 68, '王宝来', '12345678910', '男生宿舍14号楼二层205宿舍，在楼道最西侧挨着厕所');
INSERT INTO `sh_order_address` VALUES (56, 69, '哈哈哈', '12345678965', '男生宿舍11号楼一层106号，楼道西侧，靠厕所');
INSERT INTO `sh_order_address` VALUES (57, 70, '哈哈哈', '12345678965', '男生宿舍11号楼一层106号，楼道西侧，靠厕所');
INSERT INTO `sh_order_address` VALUES (58, 71, '哈哈哈', '12345678965', '男生宿舍11号楼一层106号，楼道西侧，靠厕所');
INSERT INTO `sh_order_address` VALUES (59, 72, '王宝来', '12345678910', '男生宿舍14号楼二层205宿舍，在楼道最西侧挨着厕所');
INSERT INTO `sh_order_address` VALUES (60, 76, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (61, 77, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (62, 78, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (63, 81, '李佳伟', '98765432110', '男生宿舍11号楼三层305楼道东侧挨着厕所');
INSERT INTO `sh_order_address` VALUES (64, 82, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (65, 83, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (66, 84, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (67, 85, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (68, 86, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (69, 87, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (70, 88, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (71, 89, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (72, 90, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (73, 91, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (74, 92, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (75, 93, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (76, 94, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (77, 96, '程建国', '18713790195', '男生宿舍11号楼二层205');
INSERT INTO `sh_order_address` VALUES (78, 97, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (79, 98, '程建国', '18713790195', '男生宿舍11号楼二层205');
INSERT INTO `sh_order_address` VALUES (80, 99, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (81, 100, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (82, 101, '程建国', '18713790195', '男生宿舍11号楼二层205');
INSERT INTO `sh_order_address` VALUES (83, 102, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (84, 103, '程建国', '18713790195', '男生宿舍11号楼二层205');
INSERT INTO `sh_order_address` VALUES (85, 104, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (86, 105, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (87, 106, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (88, 107, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (89, 108, '程建国', '18713790195', '男生宿舍11号楼二层205');
INSERT INTO `sh_order_address` VALUES (90, 109, '程建国', '18713790195', '男生宿舍11号楼二层205');
INSERT INTO `sh_order_address` VALUES (91, 110, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (92, 111, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (93, 112, '程建国', '18713790195', '男生宿舍11号楼二层205');
INSERT INTO `sh_order_address` VALUES (94, 113, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (95, 114, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (96, 115, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (97, 116, '程建国', '18713790195', '男生宿舍11号楼二层205');
INSERT INTO `sh_order_address` VALUES (98, 80, '程建国', '18713790195', '男生宿舍11号楼二层205');
INSERT INTO `sh_order_address` VALUES (99, 117, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (100, 118, '程建国', '18713790195', '男生宿舍11号楼二层205');
INSERT INTO `sh_order_address` VALUES (101, 119, '李佳伟', '98765432110', '男生宿舍11号楼三层305楼道东侧挨着厕所');
INSERT INTO `sh_order_address` VALUES (102, 120, '程建国', '18713790195', '男生宿舍11号楼二层205');
INSERT INTO `sh_order_address` VALUES (103, 121, '程建国', '18713790195', '男生宿舍11号楼二层205');
INSERT INTO `sh_order_address` VALUES (104, 122, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (105, 123, '李佳伟', '98765432110', '男生宿舍11号楼三层305楼道东侧挨着厕所');
INSERT INTO `sh_order_address` VALUES (106, 124, '程建国', '18713790195', '男生宿舍11号楼二层205');
INSERT INTO `sh_order_address` VALUES (107, 125, '程建国', '18713790195', '男生宿舍11号楼二层205');
INSERT INTO `sh_order_address` VALUES (108, 126, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (109, 127, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (110, 128, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (111, 129, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (112, 130, '程建国', '18713790195', '男生宿舍11号楼二层205');
INSERT INTO `sh_order_address` VALUES (113, 131, '程建国', '18713790195', '男生宿舍11号楼二层205');
INSERT INTO `sh_order_address` VALUES (114, 132, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (115, 133, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (116, 134, '程建国', '18713790195', '男生宿舍11号楼二层205');
INSERT INTO `sh_order_address` VALUES (117, 135, '程建国', '18713790195', '男生宿舍11号楼二层205');
INSERT INTO `sh_order_address` VALUES (118, 136, '程建国', '18713790195', '男生宿舍11号楼二层205');
INSERT INTO `sh_order_address` VALUES (119, 137, '王国栋', '12345678910', '男生宿舍14号楼二层205，楼道东边，靠着厕所');
INSERT INTO `sh_order_address` VALUES (120, 138, '张莉莉', '15263698569', '女生宿舍9号楼一层103 楼道最东边');
INSERT INTO `sh_order_address` VALUES (121, 139, '李娜', '15896565656', '女生宿舍9号楼四层406 楼道最东边，按着厕所');
INSERT INTO `sh_order_address` VALUES (122, 140, '程建国', '18713790195', '男生宿舍11号楼二层205');
INSERT INTO `sh_order_address` VALUES (123, 141, '程建国', '18713790195', '男生宿舍11号楼二层205');
INSERT INTO `sh_order_address` VALUES (124, 142, '程建国', '18713790195', '男生宿舍11号楼二层205');
INSERT INTO `sh_order_address` VALUES (125, 143, '程建国', '18713790195', '男生宿舍11号楼二层205');
INSERT INTO `sh_order_address` VALUES (126, 144, '李佳伟', '98765432110', '男生宿舍11号楼三层305楼道东侧挨着厕所');
INSERT INTO `sh_order_address` VALUES (127, 145, '程建国', '18713790195', '男生宿舍11号楼二层205');

-- ----------------------------
-- Table structure for sh_user
-- ----------------------------
DROP TABLE IF EXISTS `sh_user`;
CREATE TABLE `sh_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `account_number` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号（手机号）',
  `user_password` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录密码',
  `nickname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像',
  `sign_in_time` datetime NOT NULL COMMENT '注册时间',
  `user_status` tinyint NULL DEFAULT NULL COMMENT '状态（1代表封禁）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account_number`(`account_number` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sh_user
-- ----------------------------
INSERT INTO `sh_user` VALUES (36, '98765432110', '123456', '李佳伟', 'http://localhost:8080/image?imageName=file17264683773801005OIP-C.jpg', '2022-03-11 00:53:55', 0);
INSERT INTO `sh_user` VALUES (37, '18713790195', '123456', '山山', 'http://localhost:8080/image?imageName=file17264682791321002R-C.jpg', '2022-02-25 11:20:58', 0);
INSERT INTO `sh_user` VALUES (38, '15263698569', '123456', '宣化街', 'http://localhost:8080/image?imageName=file1726468351394100420204823154758937.jpg', '2022-02-24 07:39:39', 0);
INSERT INTO `sh_user` VALUES (39, '15896565656', '123456', '娜娜', 'http://localhost:8080/image?imageName=file1726468312095100320230415081411_f2e46.thumb.400_0.jpg', '2022-02-24 08:43:04', 0);
INSERT INTO `sh_user` VALUES (40, '12345678910', '123456', '洪金宝', 'http://localhost:8080/image?imageName=file164689495865510061.png', '2022-03-10 06:23:41', 0);
INSERT INTO `sh_user` VALUES (43, '12312313212', '123456', '张亮', 'http://localhost:8080/image?imageName=file165244405499510191556115156156.jpg', '2022-05-01 10:09:40', 0);

SET FOREIGN_KEY_CHECKS = 1;
