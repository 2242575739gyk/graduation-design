# 以下是使用视图代替 Activiti 默认的身份信息表 ACT_ID_XXX
-- ----------------------------
-- View structure for act_id_group
-- ----------------------------
DROP VIEW IF EXISTS `ACT_ID_GROUP`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ACT_ID_GROUP` AS select `r`.`role_key` AS `ID_`,NULL AS `REV_`,`r`.`role_name` AS `NAME_`,'assignment' AS `TYPE_` from `sys_role` `r` ;

-- ----------------------------
-- View structure for act_id_membership
-- ----------------------------
DROP VIEW IF EXISTS `ACT_ID_MEMBERSHIP`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ACT_ID_MEMBERSHIP` AS select (select `u`.`login_name` from `sys_user` `u` where (`u`.`user_id` = `ur`.`user_id`)) AS `USER_ID_`,(select `r`.`role_key` from `sys_role` `r` where (`r`.`role_id` = `ur`.`role_id`)) AS `GROUP_ID_` from `sys_user_role` `ur` ;

-- ----------------------------
-- View structure for act_id_user
-- ----------------------------
DROP VIEW IF EXISTS `ACT_ID_USER`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ACT_ID_USER` AS select `u`.`login_name` AS `ID_`,0 AS `REV_`,`u`.`user_name` AS `FIRST_`,'' AS `LAST_`,`u`.`email` AS `EMAIL_`,`u`.`password` AS `PWD_`,'' AS `PICTURE_ID_` from `sys_user` `u` ;

# 以下是业务表
-- ----------------------------
-- Table structure for biz_leave
-- ----------------------------
DROP TABLE IF EXISTS `biz_leave`;
CREATE TABLE `biz_leave` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `type` char(20) DEFAULT NULL COMMENT '请假类型',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `reason` varchar(500) DEFAULT NULL COMMENT '原因',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `total_time` bigint(11) DEFAULT NULL COMMENT '请假时长，单位秒',
  `instance_id` varchar(32) DEFAULT NULL COMMENT '流程实例ID',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `apply_user` varchar(64) DEFAULT NULL COMMENT '申请人',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `reality_start_time` datetime DEFAULT NULL COMMENT '实际开始时间',
  `reality_end_time` datetime DEFAULT NULL COMMENT '实际结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of biz_leave
-- ----------------------------

-- ----------------------------
-- Table structure for biz_todo_item
-- ----------------------------
DROP TABLE IF EXISTS `biz_todo_item`;
CREATE TABLE `biz_todo_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `item_name` varchar(100) DEFAULT NULL COMMENT '事项标题',
  `item_content` varchar(500) DEFAULT NULL COMMENT '事项内容',
  `module` varchar(50) DEFAULT NULL COMMENT '模块名称 (必须以 uri 一致)',
  `task_id` varchar(64) DEFAULT NULL COMMENT '任务 ID',
  `instance_id` varchar(32) DEFAULT NULL COMMENT '流程实例 ID',
  `task_name` varchar(50) DEFAULT NULL COMMENT '任务名称 (必须以表单页面名称一致)',
  `node_name` varchar(50) DEFAULT NULL COMMENT '节点名称',
  `is_view` char(1) DEFAULT '0' COMMENT '是否查看 default 0 (0 否 1 是)',
  `is_handle` char(1) DEFAULT '0' COMMENT '是否处理 default 0 (0 否 1 是)',
  `todo_user_id` varchar(20) DEFAULT NULL COMMENT '待办人 ID',
  `todo_user_name` varchar(30) DEFAULT NULL COMMENT '待办人名称',
  `handle_user_id` varchar(20) DEFAULT NULL COMMENT '处理人 ID',
  `handle_user_name` varchar(30) DEFAULT NULL COMMENT '处理人名称',
  `todo_time` datetime DEFAULT NULL COMMENT '通知时间',
  `handle_time` datetime DEFAULT NULL COMMENT '处理时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='待办事项表';

-- ----------------------------
-- Records of biz_todo_item
-- ----------------------------
