# 竞拍功能并发控制方案设计

## 1. 并发控制方案选择

### 1.1 乐观锁（推荐）
- **实现方式**：使用数据库表中的 `version` 字段，在更新时检查版本号
- **适用场景**：并发量适中，冲突频率较低的场景
- **优点**：实现简单，性能好，不会长时间占用数据库连接
- **缺点**：可能会有失败重试的情况

### 1.2 悲观锁
- **实现方式**：使用数据库的行级锁（`SELECT ... FOR UPDATE`）
- **适用场景**：并发量较高，冲突频率较高的场景
- **优点**：保证数据一致性，不会有失败重试的情况
- **缺点**：性能较差，可能会导致死锁

### 1.3 分布式锁
- **实现方式**：使用 Redis 或 ZooKeeper 实现
- **适用场景**：分布式部署的系统
- **优点**：支持分布式环境
- **缺点**：实现复杂，需要额外的依赖

## 2. 具体实现方案

### 2.1 数据库设计
- 在 `sh_idle_item` 表中添加 `version` 字段，用于乐观锁控制
- 在 `sh_auction_record` 表中记录所有出价记录

### 2.2 竞拍出价流程
1. **获取商品信息**：使用乐观锁获取商品的当前状态
2. **验证出价条件**：
   - 竞拍是否在进行中
   - 出价是否高于当前价格
   - 出价是否在竞拍时间范围内
3. **更新商品信息**：
   - 使用乐观锁更新商品的当前价格、最高出价者和版本号
   - 如果更新失败（版本号不匹配），则重试
4. **记录出价记录**：在 `sh_auction_record` 表中插入出价记录

### 2.3 并发控制代码示例

```java
// 使用乐观锁获取商品信息
IdleItemModel item = idleItemDao.selectByPrimaryKeyForUpdate(itemId);

// 验证出价条件
if (item.getAuctionStatus() != 1) {
    throw new BusinessException("竞拍未开始或已结束");
}

if (bidPrice.compareTo(item.getAuctionCurrentPrice()) <= 0) {
    throw new BusinessException("出价必须高于当前价格");
}

if (new Date().before(item.getAuctionStartTime()) || new Date().after(item.getAuctionEndTime())) {
    throw new BusinessException("竞拍时间已过");
}

// 更新商品信息
item.setAuctionCurrentPrice(bidPrice);
item.setCurrentWinnerId(userId);
item.setVersion(item.getVersion() + 1);

int result = idleItemDao.updateByPrimaryKeySelectiveWithVersion(item);
if (result == 0) {
    // 乐观锁更新失败，重试
    throw new BusinessException("出价失败，请重试");
}

// 记录出价记录
AuctionRecordModel record = new AuctionRecordModel();
record.setItemId(itemId);
record.setUserId(userId);
record.setBidPrice(bidPrice);
record.setBidTime(new Date());
record.setIsCurrentWinner(1);
auctionRecordDao.insert(record);

// 更新之前的最高出价记录
auctionRecordDao.updatePreviousWinner(itemId, record.getId());
```

### 2.4 竞拍结束处理
1. **定时任务**：使用 Spring 的 `@Scheduled` 注解实现定时任务，定期检查竞拍是否结束
2. **结束处理**：
   - 将竞拍状态更新为已结束
   - 通知最高出价者竞拍成功
   - 生成订单或等待用户确认

### 2.5 前端并发控制
1. **实时价格更新**：使用 WebSocket 或轮询实时更新竞拍价格
2. **出价按钮禁用**：在竞拍结束后禁用出价按钮
3. **防重复提交**：使用前端防抖和后端幂等性校验防止重复出价

## 3. 性能优化

### 3.1 数据库优化
- 为 `sh_idle_item` 表的 `auction_status`、`auction_end_time` 等字段添加索引
- 为 `sh_auction_record` 表的 `item_id`、`user_id` 字段添加索引

### 3.2 缓存优化
- 使用 Redis 缓存热门竞拍商品的信息，减少数据库查询
- 使用 Redis 发布订阅功能实现实时价格更新

### 3.3 代码优化
- 使用异步处理记录出价记录，提高响应速度
- 使用批量操作减少数据库交互次数

## 4. 测试方案

### 4.1 并发测试
- 使用 JMeter 模拟多用户同时出价的场景
- 测试不同并发量下的系统性能和数据一致性

### 4.2 边界测试
- 测试竞拍开始和结束时间的边界情况
- 测试同时出价相同金额的情况
- 测试竞拍结束后出价的情况

### 4.3 异常测试
- 测试网络中断情况下的出价处理
- 测试数据库异常情况下的系统恢复能力

## 5. 总结

本方案采用乐观锁作为主要的并发控制机制，结合定时任务和前端控制，确保竞拍过程中的数据一致性和系统性能。同时，方案也考虑了系统未来的扩展性，为分布式部署预留了分布式锁的实现方案。