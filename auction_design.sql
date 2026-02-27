-- ----------------------------
-- Table structure for sh_idle_item (扩展)
-- ----------------------------
ALTER TABLE `sh_idle_item` ADD COLUMN `auction_type` tinyint NOT NULL DEFAULT 0 COMMENT '是否为竞拍商品（0-普通商品，1-竞拍商品）' AFTER `idle_status`;
ALTER TABLE `sh_idle_item` ADD COLUMN `auction_start_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '竞拍起始价格' AFTER `auction_type`;
ALTER TABLE `sh_idle_item` ADD COLUMN `auction_current_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '当前竞拍价格' AFTER `auction_start_price`;
ALTER TABLE `sh_idle_item` ADD COLUMN `auction_start_time` datetime NULL DEFAULT NULL COMMENT '竞拍开始时间' AFTER `auction_current_price`;
ALTER TABLE `sh_idle_item` ADD COLUMN `auction_end_time` datetime NULL DEFAULT NULL COMMENT '竞拍结束时间' AFTER `auction_start_time`;
ALTER TABLE `sh_idle_item` ADD COLUMN `auction_status` tinyint NOT NULL DEFAULT 0 COMMENT '竞拍状态（0-未开始，1-进行中，2-已结束）' AFTER `auction_end_time`;
ALTER TABLE `sh_idle_item` ADD COLUMN `current_winner_id` bigint NULL DEFAULT NULL COMMENT '当前最高出价者ID' AFTER `auction_status`;
ALTER TABLE `sh_idle_item` ADD COLUMN `version` int NOT NULL DEFAULT 0 COMMENT '乐观锁版本号' AFTER `current_winner_id`;

-- ----------------------------
-- Table structure for sh_auction_record
-- ----------------------------
DROP TABLE IF EXISTS `sh_auction_record`;
CREATE TABLE `sh_auction_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `item_id` bigint NOT NULL COMMENT '商品ID',
  `user_id` bigint NOT NULL COMMENT '出价用户ID',
  `bid_price` decimal(10, 2) NOT NULL COMMENT '出价金额',
  `bid_time` datetime NOT NULL COMMENT '出价时间',
  `is_current_winner` tinyint NOT NULL DEFAULT 0 COMMENT '是否为当前最高出价（0-否，1-是）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `item_id_index`(`item_id` ASC) USING BTREE,
  INDEX `user_id_index`(`user_id` ASC) USING BTREE,
  CONSTRAINT `fk_auction_item` FOREIGN KEY (`item_id`) REFERENCES `sh_idle_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_auction_user` FOREIGN KEY (`user_id`) REFERENCES `sh_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '竞拍记录表' ROW_FORMAT = DYNAMIC;