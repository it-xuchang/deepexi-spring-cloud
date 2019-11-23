-- ----------------------------
-- Table structure for t_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept`  (
  `DEPT_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
`PARENT_ID` bigint(20) NOT NULL COMMENT '上级部门ID',
`DEPT_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门名称',
`ORDER_NUM` double(20, 0) NULL DEFAULT NULL COMMENT '排序',
`CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
`MODIFY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
PRIMARY KEY (`DEPT_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_dept
-- ----------------------------
INSERT INTO `t_dept` VALUES (1, 0, '开发部', 1, '2019-01-04 15:42:26', '2019-01-04 15:42:26');
INSERT INTO `t_dept` VALUES (2, 1, '开发一部', 1, '2019-01-04 15:42:26', '2019-01-04 15:42:26');
INSERT INTO `t_dept` VALUES (3, 1, '开发二部', 2, '2019-01-04 15:42:26', '2019-01-04 15:42:26');
INSERT INTO `t_dept` VALUES (4, 0, '市场部', 2, '2019-01-04 15:42:26', '2019-01-04 15:42:26');
INSERT INTO `t_dept` VALUES (5, 0, '人事部', 3, '2019-01-04 15:42:26', '2019-01-04 15:42:26');
INSERT INTO `t_dept` VALUES (6, 0, '测试部', 4, '2019-01-04 15:42:26', '2019-01-04 15:42:26');

-- ----------------------------
-- Table structure for t_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE `t_dict`  (
  `DICT_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典ID',
`KEYY` bigint(20) NOT NULL COMMENT '键',
`VALUEE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '值',
`FIELD_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段名称',
`TABLE_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表名',
PRIMARY KEY (`DICT_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_dict
-- ----------------------------
INSERT INTO `t_dict` VALUES (1, 0, '男', 'ssex', 't_user');
INSERT INTO `t_dict` VALUES (2, 1, '女', 'ssex', 't_user');
INSERT INTO `t_dict` VALUES (3, 2, '保密', 'ssex', 't_user');
INSERT INTO `t_dict` VALUES (4, 1, '有效', 'status', 't_user');
INSERT INTO `t_dict` VALUES (5, 0, '锁定', 'status', 't_user');
INSERT INTO `t_dict` VALUES (6, 0, '菜单', 'type', 't_menu');
INSERT INTO `t_dict` VALUES (7, 1, '按钮', 'type', 't_menu');
INSERT INTO `t_dict` VALUES (30, 0, '正常', 'status', 't_job');
INSERT INTO `t_dict` VALUES (31, 1, '暂停', 'status', 't_job');
INSERT INTO `t_dict` VALUES (32, 0, '成功', 'status', 't_job_log');
INSERT INTO `t_dict` VALUES (33, 1, '失败', 'status', 't_job_log');

-- ----------------------------
-- Table structure for t_job
-- ----------------------------
DROP TABLE IF EXISTS `t_job`;
CREATE TABLE `t_job`  (
  `JOB_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
`BEAN_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'spring bean名称',
`METHOD_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '方法名',
`PARAMS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
`CRON_EXPRESSION` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
`STATUS` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务状态  0：正常  1：暂停',
`REMARK` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
`CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
PRIMARY KEY (`JOB_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_job_log
-- ----------------------------
DROP TABLE IF EXISTS `t_job_log`;
CREATE TABLE `t_job_log`  (
  `LOG_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
`JOB_ID` bigint(20) NOT NULL COMMENT '任务id',
`BEAN_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'spring bean名称',
`METHOD_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '方法名',
`PARAMS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
`STATUS` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务状态    0：成功    1：失败',
`ERROR` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '失败信息',
`TIMES` decimal(11, 0) NULL DEFAULT NULL COMMENT '耗时(单位：毫秒)',
`CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
PRIMARY KEY (`LOG_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
`USERNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户',
`OPERATION` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作内容',
`TIME` decimal(11, 0) NULL DEFAULT NULL COMMENT '耗时',
`METHOD` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作方法',
`PARAMS` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '方法参数',
`IP` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作者IP',
`CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
`location` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作地点',
PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1853 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES (1852, 'xuchang', '删除系统日志', 24, 'com.gitboy.febs.system.controller.LogController.deleteLogss()', ' ids: \"1850,1849,1848,1847,1846,1845,1851\"', '127.0.0.1', '2019-11-20 13:17:05', '内网IP|0|0|内网IP|内网IP');

-- ----------------------------
-- Table structure for t_login_log
-- ----------------------------
DROP TABLE IF EXISTS `t_login_log`;
CREATE TABLE `t_login_log`  (
`USERNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
`LOGIN_TIME` datetime(0) NOT NULL COMMENT '登录时间',
`LOCATION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录地点',
`IP` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_login_log
-- ----------------------------
INSERT INTO `t_login_log` VALUES ('zhangtao', '2019-11-18 02:32:31', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('xuchang', '2019-11-20 03:00:43', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('xuchang', '2019-11-20 13:02:38', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('xuchang', '2019-11-23 10:47:15', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');
INSERT INTO `t_login_log` VALUES ('xuchang', '2019-11-23 13:23:25', '内网IP|0|0|内网IP|内网IP', '127.0.0.1');

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu`  (
  `MENU_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单/按钮ID',
`PARENT_ID` bigint(20) NOT NULL COMMENT '上级菜单ID',
`MENU_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单/按钮名称',
`PATH` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应路由path',
`COMPONENT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应路由组件component',
`PERMS` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
`ICON` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
`TYPE` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型 0菜单 1按钮',
`ORDER_NUM` double(20, 0) NULL DEFAULT NULL COMMENT '排序',
`CREATE_TIME` datetime(0) NOT NULL COMMENT '创建时间',
`MODIFY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
PRIMARY KEY (`MENU_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 139 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES (1, 0, '系统管理', '/system', 'PageView', NULL, 'appstore-o', '0', 1, '2017-12-27 16:39:07', '2019-01-05 11:13:14');
INSERT INTO `t_menu` VALUES (2, 0, '系统监控', '/monitor', 'PageView', NULL, 'dashboard', '0', 2, '2017-12-27 16:45:51', '2019-01-23 06:27:12');
INSERT INTO `t_menu` VALUES (3, 1, '用户管理', '/system/user', 'system/user/User', 'user:view', '', '0', 1, '2017-12-27 16:47:13', '2019-01-22 06:45:55');
INSERT INTO `t_menu` VALUES (4, 1, '角色管理', '/system/role', 'system/role/Role', 'role:view', '', '0', 2, '2017-12-27 16:48:09', '2018-04-25 09:01:12');
INSERT INTO `t_menu` VALUES (5, 1, '菜单管理', '/system/menu', 'system/menu/Menu', 'menu:view', '', '0', 3, '2017-12-27 16:48:57', '2018-04-25 09:01:30');
INSERT INTO `t_menu` VALUES (6, 1, '部门管理', '/system/dept', 'system/dept/Dept', 'dept:view', '', '0', 4, '2017-12-27 16:57:33', '2018-04-25 09:01:40');
INSERT INTO `t_menu` VALUES (8, 2, '在线用户', '/monitor/online', 'monitor/Online', 'user:online', '', '0', 1, '2017-12-27 16:59:33', '2018-04-25 09:02:04');
INSERT INTO `t_menu` VALUES (10, 2, '系统日志', '/monitor/systemlog', 'monitor/SystemLog', 'log:view', '', '0', 2, '2017-12-27 17:00:50', '2018-04-25 09:02:18');
INSERT INTO `t_menu` VALUES (11, 3, '新增用户', '', '', 'user:add', NULL, '1', NULL, '2017-12-27 17:02:58', NULL);
INSERT INTO `t_menu` VALUES (12, 3, '修改用户', '', '', 'user:update', NULL, '1', NULL, '2017-12-27 17:04:07', NULL);
INSERT INTO `t_menu` VALUES (13, 3, '删除用户', '', '', 'user:delete', NULL, '1', NULL, '2017-12-27 17:04:58', NULL);
INSERT INTO `t_menu` VALUES (14, 4, '新增角色', '', '', 'role:add', NULL, '1', NULL, '2017-12-27 17:06:38', NULL);
INSERT INTO `t_menu` VALUES (15, 4, '修改角色', '', '', 'role:update', NULL, '1', NULL, '2017-12-27 17:06:38', NULL);
INSERT INTO `t_menu` VALUES (16, 4, '删除角色', '', '', 'role:delete', NULL, '1', NULL, '2017-12-27 17:06:38', NULL);
INSERT INTO `t_menu` VALUES (17, 5, '新增菜单', '', '', 'menu:add', NULL, '1', NULL, '2017-12-27 17:08:02', NULL);
INSERT INTO `t_menu` VALUES (18, 5, '修改菜单', '', '', 'menu:update', NULL, '1', NULL, '2017-12-27 17:08:02', NULL);
INSERT INTO `t_menu` VALUES (19, 5, '删除菜单', '', '', 'menu:delete', NULL, '1', NULL, '2017-12-27 17:08:02', NULL);
INSERT INTO `t_menu` VALUES (20, 6, '新增部门', '', '', 'dept:add', NULL, '1', NULL, '2017-12-27 17:09:24', NULL);
INSERT INTO `t_menu` VALUES (21, 6, '修改部门', '', '', 'dept:update', NULL, '1', NULL, '2017-12-27 17:09:24', NULL);
INSERT INTO `t_menu` VALUES (22, 6, '删除部门', '', '', 'dept:delete', NULL, '1', NULL, '2017-12-27 17:09:24', NULL);
INSERT INTO `t_menu` VALUES (23, 8, '踢出用户', '', '', 'user:kickout', NULL, '1', NULL, '2017-12-27 17:11:13', NULL);
INSERT INTO `t_menu` VALUES (24, 10, '删除日志', '', '', 'log:delete', NULL, '1', NULL, '2017-12-27 17:11:45', NULL);
INSERT INTO `t_menu` VALUES (58, 0, '网络资源', '/web', 'PageView', NULL, 'compass', '0', 4, '2018-01-12 15:28:48', '2018-01-22 19:49:26');
INSERT INTO `t_menu` VALUES (59, 58, '天气查询', '/web/weather', 'web/Weather', 'weather:view', '', '0', 1, '2018-01-12 15:40:02', '2019-01-22 05:43:19');
INSERT INTO `t_menu` VALUES (61, 58, '每日一文', '/web/dailyArticle', 'web/DailyArticle', 'article:view', '', '0', 2, '2018-01-15 17:17:14', '2019-01-22 05:43:27');
INSERT INTO `t_menu` VALUES (64, 1, '字典管理', '/system/dict', 'system/dict/Dict', 'dict:view', '', '0', 5, '2018-01-18 10:38:25', '2018-04-25 09:01:50');
INSERT INTO `t_menu` VALUES (65, 64, '新增字典', '', '', 'dict:add', NULL, '1', NULL, '2018-01-18 19:10:08', NULL);
INSERT INTO `t_menu` VALUES (66, 64, '修改字典', '', '', 'dict:update', NULL, '1', NULL, '2018-01-18 19:10:27', NULL);
INSERT INTO `t_menu` VALUES (67, 64, '删除字典', '', '', 'dict:delete', NULL, '1', NULL, '2018-01-18 19:10:47', NULL);
INSERT INTO `t_menu` VALUES (81, 58, '影视资讯', '/web/movie', 'EmptyPageView', NULL, NULL, '0', 3, '2018-01-22 14:12:59', '2019-01-22 05:43:35');
INSERT INTO `t_menu` VALUES (82, 81, '正在热映', '/web/movie/hot', 'web/MovieHot', 'movie:hot', '', '0', 1, '2018-01-22 14:13:47', '2019-01-22 05:43:52');
INSERT INTO `t_menu` VALUES (83, 81, '即将上映', '/web/movie/coming', 'web/MovieComing', 'movie:coming', '', '0', 2, '2018-01-22 14:14:36', '2019-01-22 05:43:58');
INSERT INTO `t_menu` VALUES (101, 0, '任务调度', '/job', 'PageView', NULL, 'clock-circle-o', '0', 3, '2018-01-11 15:52:57', NULL);
INSERT INTO `t_menu` VALUES (102, 101, '定时任务', '/job/job', 'quartz/job/Job', 'job:view', '', '0', 1, '2018-02-24 15:53:53', '2019-01-22 05:42:50');
INSERT INTO `t_menu` VALUES (103, 102, '新增任务', '', '', 'job:add', NULL, '1', NULL, '2018-02-24 15:55:10', NULL);
INSERT INTO `t_menu` VALUES (104, 102, '修改任务', '', '', 'job:update', NULL, '1', NULL, '2018-02-24 15:55:53', NULL);
INSERT INTO `t_menu` VALUES (105, 102, '删除任务', '', '', 'job:delete', NULL, '1', NULL, '2018-02-24 15:56:18', NULL);
INSERT INTO `t_menu` VALUES (106, 102, '暂停任务', '', '', 'job:pause', NULL, '1', NULL, '2018-02-24 15:57:08', NULL);
INSERT INTO `t_menu` VALUES (107, 102, '恢复任务', '', '', 'job:resume', NULL, '1', NULL, '2018-02-24 15:58:21', NULL);
INSERT INTO `t_menu` VALUES (108, 102, '立即执行任务', '', '', 'job:run', NULL, '1', NULL, '2018-02-24 15:59:45', NULL);
INSERT INTO `t_menu` VALUES (109, 101, '调度日志', '/job/log', 'quartz/log/JobLog', 'jobLog:view', '', '0', 2, '2018-02-24 16:00:45', '2019-01-22 05:42:59');
INSERT INTO `t_menu` VALUES (110, 109, '删除日志', '', '', 'jobLog:delete', NULL, '1', NULL, '2018-02-24 16:01:21', NULL);
INSERT INTO `t_menu` VALUES (113, 2, 'Redis监控', '/monitor/redis/info', 'monitor/RedisInfo', 'redis:view', '', '0', 3, '2018-06-28 14:29:42', NULL);
INSERT INTO `t_menu` VALUES (121, 2, '请求追踪', '/monitor/httptrace', 'monitor/Httptrace', NULL, NULL, '0', 4, '2019-01-18 02:30:29', NULL);
INSERT INTO `t_menu` VALUES (122, 2, '系统信息', '/monitor/system', 'EmptyPageView', NULL, NULL, '0', 5, '2019-01-18 02:31:48', '2019-01-18 02:39:46');
INSERT INTO `t_menu` VALUES (123, 122, 'Tomcat信息', '/monitor/system/tomcatinfo', 'monitor/TomcatInfo', NULL, NULL, '0', 2, '2019-01-18 02:32:53', '2019-01-18 02:46:57');
INSERT INTO `t_menu` VALUES (124, 122, 'JVM信息', '/monitor/system/jvminfo', 'monitor/JvmInfo', NULL, NULL, '0', 1, '2019-01-18 02:33:30', '2019-01-18 02:46:51');
INSERT INTO `t_menu` VALUES (127, 122, '服务器信息', '/monitor/system/info', 'monitor/SystemInfo', NULL, NULL, '0', 3, '2019-01-21 07:53:43', '2019-01-21 07:57:00');
INSERT INTO `t_menu` VALUES (128, 0, '其他模块', '/others', 'PageView', NULL, 'coffee', '0', 5, '2019-01-22 06:49:59', '2019-01-22 06:50:13');
INSERT INTO `t_menu` VALUES (129, 128, '导入导出', '/others/excel', 'others/Excel', NULL, NULL, '0', 1, '2019-01-22 06:51:36', '2019-01-22 07:06:45');
INSERT INTO `t_menu` VALUES (130, 3, '导出Excel', NULL, NULL, 'user:export', NULL, '1', NULL, '2019-01-23 06:35:16', NULL);
INSERT INTO `t_menu` VALUES (131, 4, '导出Excel', NULL, NULL, 'role:export', NULL, '1', NULL, '2019-01-23 06:35:36', NULL);
INSERT INTO `t_menu` VALUES (132, 5, '导出Excel', NULL, NULL, 'menu:export', NULL, '1', NULL, '2019-01-23 06:36:05', NULL);
INSERT INTO `t_menu` VALUES (133, 6, '导出Excel', NULL, NULL, 'dept:export', NULL, '1', NULL, '2019-01-23 06:36:25', NULL);
INSERT INTO `t_menu` VALUES (134, 64, '导出Excel', NULL, NULL, 'dict:export', NULL, '1', NULL, '2019-01-23 06:36:43', NULL);
INSERT INTO `t_menu` VALUES (135, 3, '密码重置', NULL, NULL, 'user:reset', NULL, '1', NULL, '2019-01-23 06:37:00', NULL);
INSERT INTO `t_menu` VALUES (136, 10, '导出Excel', NULL, NULL, 'log:export', NULL, '1', NULL, '2019-01-23 06:37:27', NULL);
INSERT INTO `t_menu` VALUES (137, 102, '导出Excel', NULL, NULL, 'job:export', NULL, '1', NULL, '2019-01-23 06:37:59', NULL);
INSERT INTO `t_menu` VALUES (138, 109, '导出Excel', NULL, NULL, 'jobLog:export', NULL, '1', NULL, '2019-01-23 06:38:32', NULL);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `ROLE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
`ROLE_NAME` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
`REMARK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
`CREATE_TIME` datetime(0) NOT NULL COMMENT '创建时间',
`MODIFY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
PRIMARY KEY (`ROLE_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '管理员', '管理员', '2017-12-27 16:23:11', '2019-01-23 06:45:29');
INSERT INTO `t_role` VALUES (2, '注册用户', '可查看，新增，导出', '2019-01-04 14:11:28', '2019-01-23 07:37:08');
INSERT INTO `t_role` VALUES (72, '普通用户', '只可查看', '2019-01-23 07:33:20', NULL);
INSERT INTO `t_role` VALUES (74, '测试角色', '测试角色', '2019-11-15 09:58:47', NULL);

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu`  (
  `ROLE_ID` bigint(20) NOT NULL,
`MENU_ID` bigint(20) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES (1, 1);
INSERT INTO `t_role_menu` VALUES (1, 3);
INSERT INTO `t_role_menu` VALUES (1, 11);
INSERT INTO `t_role_menu` VALUES (1, 12);
INSERT INTO `t_role_menu` VALUES (1, 13);
INSERT INTO `t_role_menu` VALUES (1, 4);
INSERT INTO `t_role_menu` VALUES (1, 14);
INSERT INTO `t_role_menu` VALUES (1, 15);
INSERT INTO `t_role_menu` VALUES (1, 16);
INSERT INTO `t_role_menu` VALUES (1, 5);
INSERT INTO `t_role_menu` VALUES (1, 17);
INSERT INTO `t_role_menu` VALUES (1, 18);
INSERT INTO `t_role_menu` VALUES (1, 19);
INSERT INTO `t_role_menu` VALUES (1, 6);
INSERT INTO `t_role_menu` VALUES (1, 20);
INSERT INTO `t_role_menu` VALUES (1, 21);
INSERT INTO `t_role_menu` VALUES (1, 22);
INSERT INTO `t_role_menu` VALUES (1, 64);
INSERT INTO `t_role_menu` VALUES (1, 65);
INSERT INTO `t_role_menu` VALUES (1, 66);
INSERT INTO `t_role_menu` VALUES (1, 67);
INSERT INTO `t_role_menu` VALUES (1, 2);
INSERT INTO `t_role_menu` VALUES (1, 8);
INSERT INTO `t_role_menu` VALUES (1, 23);
INSERT INTO `t_role_menu` VALUES (1, 10);
INSERT INTO `t_role_menu` VALUES (1, 24);
INSERT INTO `t_role_menu` VALUES (1, 113);
INSERT INTO `t_role_menu` VALUES (1, 121);
INSERT INTO `t_role_menu` VALUES (1, 122);
INSERT INTO `t_role_menu` VALUES (1, 124);
INSERT INTO `t_role_menu` VALUES (1, 123);
INSERT INTO `t_role_menu` VALUES (1, 125);
INSERT INTO `t_role_menu` VALUES (1, 101);
INSERT INTO `t_role_menu` VALUES (1, 102);
INSERT INTO `t_role_menu` VALUES (1, 103);
INSERT INTO `t_role_menu` VALUES (1, 104);
INSERT INTO `t_role_menu` VALUES (1, 105);
INSERT INTO `t_role_menu` VALUES (1, 106);
INSERT INTO `t_role_menu` VALUES (1, 107);
INSERT INTO `t_role_menu` VALUES (1, 108);
INSERT INTO `t_role_menu` VALUES (1, 109);
INSERT INTO `t_role_menu` VALUES (1, 110);
INSERT INTO `t_role_menu` VALUES (1, 58);
INSERT INTO `t_role_menu` VALUES (1, 59);
INSERT INTO `t_role_menu` VALUES (1, 61);
INSERT INTO `t_role_menu` VALUES (1, 81);
INSERT INTO `t_role_menu` VALUES (1, 82);
INSERT INTO `t_role_menu` VALUES (1, 83);
INSERT INTO `t_role_menu` VALUES (1, 127);
INSERT INTO `t_role_menu` VALUES (1, 128);
INSERT INTO `t_role_menu` VALUES (1, 129);
INSERT INTO `t_role_menu` VALUES (1, 130);
INSERT INTO `t_role_menu` VALUES (1, 135);
INSERT INTO `t_role_menu` VALUES (1, 131);
INSERT INTO `t_role_menu` VALUES (1, 132);
INSERT INTO `t_role_menu` VALUES (1, 133);
INSERT INTO `t_role_menu` VALUES (1, 134);
INSERT INTO `t_role_menu` VALUES (1, 136);
INSERT INTO `t_role_menu` VALUES (1, 137);
INSERT INTO `t_role_menu` VALUES (1, 138);
INSERT INTO `t_role_menu` VALUES (72, 1);
INSERT INTO `t_role_menu` VALUES (72, 3);
INSERT INTO `t_role_menu` VALUES (72, 4);
INSERT INTO `t_role_menu` VALUES (72, 5);
INSERT INTO `t_role_menu` VALUES (72, 6);
INSERT INTO `t_role_menu` VALUES (72, 64);
INSERT INTO `t_role_menu` VALUES (72, 2);
INSERT INTO `t_role_menu` VALUES (72, 8);
INSERT INTO `t_role_menu` VALUES (72, 10);
INSERT INTO `t_role_menu` VALUES (72, 113);
INSERT INTO `t_role_menu` VALUES (72, 121);
INSERT INTO `t_role_menu` VALUES (72, 122);
INSERT INTO `t_role_menu` VALUES (72, 124);
INSERT INTO `t_role_menu` VALUES (72, 123);
INSERT INTO `t_role_menu` VALUES (72, 127);
INSERT INTO `t_role_menu` VALUES (72, 101);
INSERT INTO `t_role_menu` VALUES (72, 102);
INSERT INTO `t_role_menu` VALUES (72, 109);
INSERT INTO `t_role_menu` VALUES (72, 58);
INSERT INTO `t_role_menu` VALUES (72, 59);
INSERT INTO `t_role_menu` VALUES (72, 61);
INSERT INTO `t_role_menu` VALUES (72, 81);
INSERT INTO `t_role_menu` VALUES (72, 82);
INSERT INTO `t_role_menu` VALUES (72, 83);
INSERT INTO `t_role_menu` VALUES (72, 128);
INSERT INTO `t_role_menu` VALUES (72, 129);
INSERT INTO `t_role_menu` VALUES (2, 3);
INSERT INTO `t_role_menu` VALUES (2, 1);
INSERT INTO `t_role_menu` VALUES (2, 4);
INSERT INTO `t_role_menu` VALUES (2, 5);
INSERT INTO `t_role_menu` VALUES (2, 6);
INSERT INTO `t_role_menu` VALUES (2, 64);
INSERT INTO `t_role_menu` VALUES (2, 2);
INSERT INTO `t_role_menu` VALUES (2, 8);
INSERT INTO `t_role_menu` VALUES (2, 10);
INSERT INTO `t_role_menu` VALUES (2, 113);
INSERT INTO `t_role_menu` VALUES (2, 121);
INSERT INTO `t_role_menu` VALUES (2, 122);
INSERT INTO `t_role_menu` VALUES (2, 124);
INSERT INTO `t_role_menu` VALUES (2, 123);
INSERT INTO `t_role_menu` VALUES (2, 125);
INSERT INTO `t_role_menu` VALUES (2, 101);
INSERT INTO `t_role_menu` VALUES (2, 102);
INSERT INTO `t_role_menu` VALUES (2, 109);
INSERT INTO `t_role_menu` VALUES (2, 58);
INSERT INTO `t_role_menu` VALUES (2, 59);
INSERT INTO `t_role_menu` VALUES (2, 61);
INSERT INTO `t_role_menu` VALUES (2, 81);
INSERT INTO `t_role_menu` VALUES (2, 82);
INSERT INTO `t_role_menu` VALUES (2, 83);
INSERT INTO `t_role_menu` VALUES (2, 127);
INSERT INTO `t_role_menu` VALUES (2, 128);
INSERT INTO `t_role_menu` VALUES (2, 129);
INSERT INTO `t_role_menu` VALUES (2, 130);
INSERT INTO `t_role_menu` VALUES (2, 14);
INSERT INTO `t_role_menu` VALUES (2, 17);
INSERT INTO `t_role_menu` VALUES (2, 132);
INSERT INTO `t_role_menu` VALUES (2, 20);
INSERT INTO `t_role_menu` VALUES (2, 133);
INSERT INTO `t_role_menu` VALUES (2, 65);
INSERT INTO `t_role_menu` VALUES (2, 134);
INSERT INTO `t_role_menu` VALUES (2, 136);
INSERT INTO `t_role_menu` VALUES (2, 103);
INSERT INTO `t_role_menu` VALUES (2, 137);
INSERT INTO `t_role_menu` VALUES (2, 138);
INSERT INTO `t_role_menu` VALUES (2, 131);
INSERT INTO `t_role_menu` VALUES (74, 1);
INSERT INTO `t_role_menu` VALUES (74, 3);
INSERT INTO `t_role_menu` VALUES (74, 11);
INSERT INTO `t_role_menu` VALUES (74, 12);
INSERT INTO `t_role_menu` VALUES (74, 13);
INSERT INTO `t_role_menu` VALUES (74, 130);
INSERT INTO `t_role_menu` VALUES (74, 135);
INSERT INTO `t_role_menu` VALUES (74, 4);
INSERT INTO `t_role_menu` VALUES (74, 14);
INSERT INTO `t_role_menu` VALUES (74, 15);
INSERT INTO `t_role_menu` VALUES (74, 16);
INSERT INTO `t_role_menu` VALUES (74, 131);
INSERT INTO `t_role_menu` VALUES (74, 5);
INSERT INTO `t_role_menu` VALUES (74, 17);
INSERT INTO `t_role_menu` VALUES (74, 18);
INSERT INTO `t_role_menu` VALUES (74, 19);
INSERT INTO `t_role_menu` VALUES (74, 132);
INSERT INTO `t_role_menu` VALUES (74, 6);
INSERT INTO `t_role_menu` VALUES (74, 20);
INSERT INTO `t_role_menu` VALUES (74, 21);
INSERT INTO `t_role_menu` VALUES (74, 22);
INSERT INTO `t_role_menu` VALUES (74, 133);
INSERT INTO `t_role_menu` VALUES (74, 64);
INSERT INTO `t_role_menu` VALUES (74, 65);
INSERT INTO `t_role_menu` VALUES (74, 66);
INSERT INTO `t_role_menu` VALUES (74, 67);
INSERT INTO `t_role_menu` VALUES (74, 134);
INSERT INTO `t_role_menu` VALUES (74, 2);
INSERT INTO `t_role_menu` VALUES (74, 8);
INSERT INTO `t_role_menu` VALUES (74, 23);
INSERT INTO `t_role_menu` VALUES (74, 10);
INSERT INTO `t_role_menu` VALUES (74, 24);
INSERT INTO `t_role_menu` VALUES (74, 136);
INSERT INTO `t_role_menu` VALUES (74, 113);
INSERT INTO `t_role_menu` VALUES (74, 121);
INSERT INTO `t_role_menu` VALUES (74, 122);
INSERT INTO `t_role_menu` VALUES (74, 123);
INSERT INTO `t_role_menu` VALUES (74, 124);
INSERT INTO `t_role_menu` VALUES (74, 127);
INSERT INTO `t_role_menu` VALUES (74, 58);
INSERT INTO `t_role_menu` VALUES (74, 59);
INSERT INTO `t_role_menu` VALUES (74, 61);
INSERT INTO `t_role_menu` VALUES (74, 81);
INSERT INTO `t_role_menu` VALUES (74, 82);
INSERT INTO `t_role_menu` VALUES (74, 83);
INSERT INTO `t_role_menu` VALUES (74, 101);
INSERT INTO `t_role_menu` VALUES (74, 102);
INSERT INTO `t_role_menu` VALUES (74, 103);
INSERT INTO `t_role_menu` VALUES (74, 104);
INSERT INTO `t_role_menu` VALUES (74, 105);
INSERT INTO `t_role_menu` VALUES (74, 106);
INSERT INTO `t_role_menu` VALUES (74, 107);
INSERT INTO `t_role_menu` VALUES (74, 108);
INSERT INTO `t_role_menu` VALUES (74, 137);
INSERT INTO `t_role_menu` VALUES (74, 109);
INSERT INTO `t_role_menu` VALUES (74, 110);
INSERT INTO `t_role_menu` VALUES (74, 138);
INSERT INTO `t_role_menu` VALUES (74, 128);
INSERT INTO `t_role_menu` VALUES (74, 129);

-- ----------------------------
-- Table structure for t_test
-- ----------------------------
DROP TABLE IF EXISTS `t_test`;
CREATE TABLE `t_test`  (
  `ID` bigint(11) NOT NULL AUTO_INCREMENT,
`FIELD1` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`FIELD2` int(11) NOT NULL,
`FIELD3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`CREATE_TIME` datetime(0) NULL,
PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;



-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `USER_ID` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
`USERNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
`PASSWORD` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
`DEPT_ID` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
`EMAIL` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
`MOBILE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
`STATUS` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态 0锁定 1有效',
`CREATE_TIME` datetime(0) NOT NULL COMMENT '创建时间',
`MODIFY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
`LAST_LOGIN_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最近访问时间',
`SSEX` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别 0男 1女 2保密',
`DESCRIPTION` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
`AVATAR` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
PRIMARY KEY (`USER_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'xuchang', 'e76fb5a1b5637b17390536d34a0a4601', 1, 'xuchang@qq.com', '15813058131', '1', '2017-12-27 15:47:19', '2019-11-15 12:54:55', '2019-11-23 13:23:25', '2', '我是xuchang', 'ubnKSIfAJTxIgXOKlciN.png');
INSERT INTO `t_user` VALUES (13, 'superadmin', 'bdcf85e054e2dcbfdb4d8797198cafd3', 1, '574616156@qq.com', '15813058131', '1', '2019-11-18 02:06:21', NULL, '2019-11-18 02:07:15', '2', NULL, 'default.jpg');
INSERT INTO `t_user` VALUES (14, 'zhangtao', 'e83000e62215f1630921a111b9d6d008', 1, 'xuchang@hashvictor.com', '13800138000', '1', '2019-11-18 02:10:16', NULL, '2019-11-18 02:32:31', '2', NULL, 'default.jpg');

-- ----------------------------
-- Table structure for t_user_config
-- ----------------------------
DROP TABLE IF EXISTS `t_user_config`;
CREATE TABLE `t_user_config`  (
  `USER_ID` bigint(20) NOT NULL COMMENT '用户ID',
`THEME` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统主题 dark暗色风格，light明亮风格',
`LAYOUT` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统布局 side侧边栏，head顶部栏',
`MULTI_PAGE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '页面风格 1多标签页 0单页',
`FIX_SIDERBAR` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '页面滚动是否固定侧边栏 1固定 0不固定',
`FIX_HEADER` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '页面滚动是否固定顶栏 1固定 0不固定',
`COLOR` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主题颜色 RGB值',
PRIMARY KEY (`USER_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_config
-- ----------------------------
INSERT INTO `t_user_config` VALUES (1, 'light', 'side', '1', '1', '1', 'rgb(24, 144, 255)');
INSERT INTO `t_user_config` VALUES (2, 'light', 'side', '0', '1', '1', 'rgb(114, 46, 209)');
INSERT INTO `t_user_config` VALUES (13, 'dark', 'side', '0', '1', '1', 'rgb(66, 185, 131)');
INSERT INTO `t_user_config` VALUES (14, 'dark', 'side', '0', '1', '1', 'rgb(66, 185, 131)');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `USER_ID` bigint(20) NOT NULL COMMENT '用户ID',
`ROLE_ID` bigint(20) NOT NULL COMMENT '角色ID'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES (1, 1);
INSERT INTO `t_user_role` VALUES (2, 1);
INSERT INTO `t_user_role` VALUES (13, 1);
INSERT INTO `t_user_role` VALUES (14, 1);

SET FOREIGN_KEY_CHECKS = 1;
