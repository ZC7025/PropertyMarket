CREATE DATABASE IF NOT EXISTS d_pm DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

use d_pm;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_agency
-- ----------------------------
DROP TABLE IF EXISTS t_agency;
CREATE TABLE t_agency (
  id varchar(36) NOT NULL,
  name varchar(50) NOT NULL,
  spell varchar(200) DEFAULT NULL,
  email varchar(50) NOT NULL,
  pwd varchar(100) NOT NULL,
  leader varchar(20) NOT NULL,
  phone varchar(11) NOT NULL,
  tel varchar(11) DEFAULT NULL,
  address varchar(100) NOT NULL,
  logo varchar(500) DEFAULT '',
  intro varchar(500) DEFAULT NULL COMMENT '简介',
  created_time datetime DEFAULT NULL,
  checked_status tinyint(4) DEFAULT '0',
  status tinyint(4) DEFAULT '0',
  PRIMARY KEY (id),
  UNIQUE KEY phone (phone),
  UNIQUE KEY email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_agency
-- ----------------------------

-- ----------------------------
-- Table structure for t_buildings
-- ----------------------------
DROP TABLE IF EXISTS t_buildings;
CREATE TABLE t_buildings (
  id varchar(36) NOT NULL,
  name varchar(50) NOT NULL,
  spell varchar(200) DEFAULT NULL COMMENT '拼音',
  area varchar(50) NOT NULL COMMENT '所属区域',
  address varchar(100) NOT NULL,
  floor_area double NOT NULL COMMENT '占地面积',
  building_area double NOT NULL COMMENT '建筑面积',
  house_type varchar(20) NOT NULL COMMENT '房源类型',
  building_type varchar(20) NOT NULL COMMENT '建筑类型',
  longitude double DEFAULT NULL COMMENT '经度',
  latitude double DEFAULT NULL COMMENT '纬度',
  avg_price double NOT NULL COMMENT '楼盘均价',
  company varchar(100) NOT NULL COMMENT '开发公司',
  open_date datetime DEFAULT NULL COMMENT '开盘时间',
  total_rooms int(11) NOT NULL COMMENT '总套数',
  reception_address varchar(100) DEFAULT NULL COMMENT '接待地址',
  tel varchar(11) DEFAULT NULL COMMENT '售楼部电话',
  green_ratio double DEFAULT NULL COMMENT '绿化率',
  plot_ratio double DEFAULT NULL COMMENT '容积率',
  property_company varchar(100) DEFAULT NULL COMMENT '物业公司',
  property_fee double DEFAULT NULL COMMENT '物业费',
  car_station int(11) DEFAULT NULL COMMENT '车位数',
  traffic text COMMENT '交通状况',
  equipments text COMMENT '周边配套',
  logo varchar(500) DEFAULT NULL,
  intro varchar(500) DEFAULT NULL COMMENT '简介',
  created_time datetime DEFAULT NULL,
  status tinyint(4) DEFAULT '0',
  agency_id varchar(36) NOT NULL COMMENT '经销商编号',
  PRIMARY KEY (id),
  KEY fk_angency_buildings (agency_id),
  CONSTRAINT fk_angency_buildings FOREIGN KEY (agency_id) REFERENCES t_agency (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_buildings
-- ----------------------------

-- ----------------------------
-- Table structure for t_buildings_img
-- ----------------------------
DROP TABLE IF EXISTS t_buildings_img;
CREATE TABLE t_buildings_img (
  id varchar(36) NOT NULL,
  img_path varchar(500) NOT NULL,
  img_des varchar(50) DEFAULT NULL,
  buildings_id varchar(36) NOT NULL COMMENT '楼盘编号',
  created_time datetime DEFAULT NULL,
  PRIMARY KEY (id),
  KEY fk_buildings_img (buildings_id),
  CONSTRAINT fk_buildings_img FOREIGN KEY (buildings_id) REFERENCES t_buildings (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_buildings_img
-- ----------------------------

-- ----------------------------
-- Table structure for t_building
-- ----------------------------
DROP TABLE IF EXISTS t_building;
CREATE TABLE t_building (
  id varchar(36) NOT NULL,
  name varchar(50) NOT NULL COMMENT '楼栋名',
  total_floor int(11) NOT NULL COMMENT '总层数',
  total_lift int(11) NOT NULL COMMENT '电梯数',
  floor_rooms int(11) NOT NULL COMMENT '每层户数',
  total_room int(11) NOT NULL COMMENT '总户数',
  buildings_id varchar(36) NOT NULL COMMENT '楼盘编号',
  created_time datetime DEFAULT NULL,
  status tinyint(4) DEFAULT '0',
  PRIMARY KEY (id),
  KEY fk_buildings_building (buildings_id),
  CONSTRAINT fk_buildings_building FOREIGN KEY (buildings_id) REFERENCES t_buildings (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_building
-- ----------------------------

-- ----------------------------
-- Table structure for t_house
-- ----------------------------
DROP TABLE IF EXISTS t_house;
CREATE TABLE t_house (
  id varchar(36) NOT NULL,
  name varchar(50) NOT NULL,
  logo varchar(500) DEFAULT NULL COMMENT '户型图',
  intro varchar(500) DEFAULT NULL COMMENT '简介',
  area double NOT NULL COMMENT '面积',
  unit_price double NOT NULL COMMENT '参考单价',
  buildings_id varchar(36) DEFAULT NULL COMMENT '楼盘编号',
  created_time datetime DEFAULT NULL,
  status tinyint(11) DEFAULT '0',
  PRIMARY KEY (id),
  KEY buildings_id (buildings_id),
  CONSTRAINT t_house_ibfk_1 FOREIGN KEY (buildings_id) REFERENCES t_buildings (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_house
-- ----------------------------

-- ----------------------------
-- Table structure for t_room
-- ----------------------------
DROP TABLE IF EXISTS t_room;
CREATE TABLE t_room (
  id varchar(36) NOT NULL,
  house_id varchar(36) NOT NULL COMMENT '户型id',
  building_id varchar(36) NOT NULL COMMENT '楼栋名',
  name varchar(50) NOT NULL DEFAULT '' COMMENT '房号',
  sale_status tinyint(4) DEFAULT '0' COMMENT '销售状态',
  PRIMARY KEY (id),
  KEY house_id (house_id),
  KEY building_id (building_id),
  CONSTRAINT t_room_ibfk_1 FOREIGN KEY (house_id) REFERENCES t_house (id),
  CONSTRAINT t_room_ibfk_2 FOREIGN KEY (building_id) REFERENCES t_building (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_room
-- ----------------------------

-- ----------------------------
-- Table structure for t_employee
-- ----------------------------
DROP TABLE IF EXISTS t_employee;
CREATE TABLE t_employee (
  id varchar(36) NOT NULL,
  name varchar(50) NOT NULL,
  email varchar(50) DEFAULT NULL,
  pwd varchar(50) NOT NULL,
  phone varchar(11) NOT NULL,
  qq varchar(20) DEFAULT NULL,
  wechat varchar(50) DEFAULT NULL,
  gender varchar(2) DEFAULT NULL,
  exp varchar(50) DEFAULT NULL COMMENT '工作经验',
  des varchar(100) DEFAULT NULL COMMENT '个人说明',
  address varchar(100) DEFAULT NULL,
  basic_salary double NOT NULL COMMENT '基本工资',
  headicon varchar(500) DEFAULT NULL,
  intro varchar(500) DEFAULT NULL COMMENT '简介',
  angency_id varchar(36) DEFAULT NULL COMMENT '所属经销商',
  buildings_id varchar(36) DEFAULT NULL COMMENT '负责的楼盘',
  created_time datetime DEFAULT NULL,
  status tinyint(4) DEFAULT '0',
  PRIMARY KEY (id),
  UNIQUE KEY phone (phone),
  KEY angency_id (angency_id),
  KEY buildings_id (buildings_id),
  CONSTRAINT t_employee_ibfk_1 FOREIGN KEY (angency_id) REFERENCES t_agency (id),
  CONSTRAINT t_employee_ibfk_2 FOREIGN KEY (buildings_id) REFERENCES t_buildings (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_employee
-- ----------------------------

-- ----------------------------
-- Table structure for t_mission
-- ----------------------------
DROP TABLE IF EXISTS t_mission;
CREATE TABLE t_mission (
  id varchar(36) NOT NULL,
  quantity int(11) NOT NULL COMMENT '任务量',
  monthes int(11) NOT NULL COMMENT '月份',
  emp_id varchar(36) NOT NULL,
  bonus_percent double NOT NULL COMMENT '提成百分比',
  PRIMARY KEY (id),
  KEY emp_id (emp_id),
  CONSTRAINT t_mission_ibfk_1 FOREIGN KEY (emp_id) REFERENCES t_employee (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_mission
-- ----------------------------

-- ----------------------------
-- Table structure for t_activity
-- ----------------------------
DROP TABLE IF EXISTS t_activity;
CREATE TABLE t_activity (
  id varchar(36) NOT NULL,
  title varchar(50) NOT NULL COMMENT '活动标题',
  spell varchar(200) DEFAULT NULL COMMENT '拼音',
  start_time datetime NOT NULL COMMENT '开始时间',
  end_time datetime NOT NULL COMMENT '结束时间',
  address varchar(100) NOT NULL,
  content text NOT NULL COMMENT '活动内容',
  logo varchar(500) DEFAULT NULL,
  buildings_id varchar(36) NOT NULL,
  agency_id varchar(36) NOT NULL,
  PRIMARY KEY (id),
  KEY buildings_id (buildings_id),
  KEY agency_id (agency_id),
  CONSTRAINT t_activity_ibfk_1 FOREIGN KEY (buildings_id) REFERENCES t_buildings (id),
  CONSTRAINT t_activity_ibfk_2 FOREIGN KEY (agency_id) REFERENCES t_agency (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_activity
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS t_user;
CREATE TABLE t_user (
  id varchar(36) NOT NULL,
  nickname varchar(50) NOT NULL COMMENT '昵称',
  name varchar(20) DEFAULT NULL COMMENT '真实姓名',
  email varchar(50) DEFAULT NULL,
  phone varchar(11) NOT NULL,
  pwd varchar(100) NOT NULL,
  qq varchar(20) DEFAULT NULL,
  wechat varchar(50) DEFAULT NULL,
  gender varchar(2) DEFAULT '男',
  birthday datetime DEFAULT NULL,
  headicon varchar(500) DEFAULT '',
  PRIMARY KEY (id),
  UNIQUE KEY phone (phone)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------

-- ----------------------------
-- Table structure for t_appointment
-- ----------------------------
DROP TABLE IF EXISTS t_appointment;
CREATE TABLE t_appointment (
  id varchar(36) NOT NULL,
  emp_id varchar(36) NOT NULL,
  user_id varchar(36) NOT NULL,
  app_arrive_time datetime NOT NULL COMMENT '预约时间',
  arrive_time datetime DEFAULT NULL COMMENT '真实看房时间',
  house_id varchar(36) NOT NULL,
  app_status varchar(20) DEFAULT NULL COMMENT '预约状态',
  created_time datetime DEFAULT NULL,
  status tinyint(4) DEFAULT '0' COMMENT '状态',
  agency_id varchar(36) DEFAULT NULL COMMENT '经销商编号',
  PRIMARY KEY (id),
  KEY emp_id (emp_id),
  KEY user_id (user_id),
  KEY house_id (house_id),
  KEY agency_id (agency_id),
  CONSTRAINT t_appointment_ibfk_1 FOREIGN KEY (emp_id) REFERENCES t_employee (id),
  CONSTRAINT t_appointment_ibfk_2 FOREIGN KEY (user_id) REFERENCES t_user (id),
  CONSTRAINT t_appointment_ibfk_3 FOREIGN KEY (house_id) REFERENCES t_house (id),
  CONSTRAINT t_appointment_ibfk_4 FOREIGN KEY (agency_id) REFERENCES t_agency (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_appointment
-- ----------------------------

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS t_message;
CREATE TABLE t_message (
  id varchar(36) NOT NULL,
  content text NOT NULL COMMENT '留言内容',
  buildings_id varchar(36) DEFAULT NULL COMMENT '楼盘编号',
  reply text COMMENT '回复内容',
  leave_time datetime NOT NULL COMMENT '留言时间',
  reply_time datetime DEFAULT NULL COMMENT '回复时间',
  user_id varchar(36) NOT NULL,
  status tinyint(4) DEFAULT '0',
  agency_id varchar(36) NOT NULL COMMENT '经销商id',
  PRIMARY KEY (id),
  KEY buildings_id (buildings_id),
  KEY user_id (user_id),
  KEY agency_id (agency_id),
  CONSTRAINT t_message_ibfk_1 FOREIGN KEY (buildings_id) REFERENCES t_buildings (id),
  CONSTRAINT t_message_ibfk_2 FOREIGN KEY (user_id) REFERENCES t_user (id),
  CONSTRAINT t_message_ibfk_3 FOREIGN KEY (agency_id) REFERENCES t_agency (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_message
-- ----------------------------

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS t_comment;
CREATE TABLE t_comment (
  id varchar(36) NOT NULL,
  content text NOT NULL COMMENT '评价内容',
  buildings_id varchar(36) NOT NULL COMMENT '楼盘编号',
  comment_time datetime NOT NULL COMMENT '评价时间',
  user_id varchar(36) NOT NULL,
  status tinyint(4) DEFAULT '0',
  agency_id varchar(36) NOT NULL,
  PRIMARY KEY (id),
  KEY buildings_id (buildings_id),
  KEY user_id (user_id),
  KEY agency_id (agency_id),
  CONSTRAINT t_comment_ibfk_1 FOREIGN KEY (buildings_id) REFERENCES t_buildings (id),
  CONSTRAINT t_comment_ibfk_2 FOREIGN KEY (user_id) REFERENCES t_user (id),
  CONSTRAINT t_comment_ibfk_3 FOREIGN KEY (agency_id) REFERENCES t_agency (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------

-- ----------------------------
-- Table structure for t_customer
-- ----------------------------
DROP TABLE IF EXISTS t_customer;
CREATE TABLE t_customer (
  id varchar(36) NOT NULL,
  name varchar(50) NOT NULL,
  gender varchar(2) DEFAULT NULL,
  birthday datetime DEFAULT NULL,
  identity_id varchar(18) NOT NULL COMMENT '身份证号',
  email varchar(50) DEFAULT NULL,
  phone varchar(11) NOT NULL,
  address varchar(100) DEFAULT NULL,
  customer_type varchar(20) NOT NULL COMMENT '客户类型',
  together varchar(100) DEFAULT NULL COMMENT '共同购房人',
  contract varchar(500) DEFAULT NULL COMMENT '购房合同路径',
  archives varchar(500) DEFAULT NULL COMMENT '电子档案路径',
  created_time datetime DEFAULT NULL,
  status tinyint(4) DEFAULT '0',
  emp_id varchar(36) DEFAULT NULL COMMENT '员工编号',
  PRIMARY KEY (id),
  UNIQUE KEY phone (phone),
  KEY emp_id (emp_id),
  CONSTRAINT t_customer_ibfk_1 FOREIGN KEY (emp_id) REFERENCES t_employee (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_customer
-- ----------------------------

-- ----------------------------
-- Table structure for t_sale
-- ----------------------------
DROP TABLE IF EXISTS t_sale;
CREATE TABLE t_sale (
  id varchar(36) NOT NULL,
  customer_id varchar(36) NOT NULL COMMENT '客户编号',
  sale_time datetime NOT NULL COMMENT '销售时间',
  unit_price double NOT NULL COMMENT '单价',
  room_id varchar(36) NOT NULL COMMENT '房号',
  discount double NOT NULL DEFAULT '0' COMMENT '折扣',
  total_cost double NOT NULL COMMENT '总价',
  emp_id varchar(36) NOT NULL COMMENT '员工编号',
  created_time datetime DEFAULT NULL,
  status tinyint(4) DEFAULT '0',
  PRIMARY KEY (id),
  KEY customer_id (customer_id),
  KEY room_id (room_id),
  KEY emp_id (emp_id),
  CONSTRAINT t_sale_ibfk_1 FOREIGN KEY (customer_id) REFERENCES t_customer (id),
  CONSTRAINT t_sale_ibfk_2 FOREIGN KEY (room_id) REFERENCES t_room (id),
  CONSTRAINT t_sale_ibfk_3 FOREIGN KEY (emp_id) REFERENCES t_employee (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sale
-- ----------------------------

-- ----------------------------
-- Table structure for t_like
-- ----------------------------
DROP TABLE IF EXISTS t_like;
CREATE TABLE t_like (
  id varchar(36) NOT NULL,
  user_id varchar(36) NOT NULL,
  buildings_id varchar(36) NOT NULL COMMENT '楼盘编号',
  created_time datetime DEFAULT NULL COMMENT '点赞时间',
  PRIMARY KEY (id),
  KEY user_id (user_id),
  KEY buildings_id (buildings_id),
  CONSTRAINT t_like_ibfk_1 FOREIGN KEY (user_id) REFERENCES t_user (id),
  CONSTRAINT t_like_ibfk_2 FOREIGN KEY (buildings_id) REFERENCES t_buildings (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_like
-- ----------------------------

-- ----------------------------
-- Table structure for t_history
-- ----------------------------
DROP TABLE IF EXISTS t_history;
CREATE TABLE t_history (
  id varchar(36) NOT NULL,
  user_id varchar(36) NOT NULL,
  buildings_id varchar(36) NOT NULL COMMENT '楼盘编号',
  created_time datetime DEFAULT NULL COMMENT '浏览时间',
  PRIMARY KEY (id),
  KEY user_id (user_id),
  KEY buildings_id (buildings_id),
  CONSTRAINT t_history_ibfk_1 FOREIGN KEY (user_id) REFERENCES t_user (id),
  CONSTRAINT t_history_ibfk_2 FOREIGN KEY (buildings_id) REFERENCES t_buildings (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_history
-- ----------------------------

-- ----------------------------
-- Table structure for t_article_type
-- ----------------------------
DROP TABLE IF EXISTS t_article_type;
CREATE TABLE t_article_type (
  id varchar(36) NOT NULL,
  name varchar(50) NOT NULL COMMENT '文章类别名',
  des varchar(500) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY name (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_article_type
-- ----------------------------

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS t_article;
CREATE TABLE t_article (
  id varchar(36) NOT NULL,
  title varchar(50) NOT NULL,
  spell varchar(200) DEFAULT NULL,
  abstracts varchar(100) NOT NULL COMMENT '文章摘要',
  content text NOT NULL COMMENT '文章内容',
  logo varchar(500) DEFAULT NULL,
  created_time datetime DEFAULT NULL,
  status tinyint(4) DEFAULT '0',
  type_id varchar(36) NOT NULL COMMENT '类型编号',
  PRIMARY KEY (id),
  KEY type_id (type_id),
  CONSTRAINT t_article_ibfk_1 FOREIGN KEY (type_id) REFERENCES t_article_type (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_article
-- ----------------------------

-- ----------------------------
-- Table structure for t_ads
-- ----------------------------
DROP TABLE IF EXISTS t_ads;
CREATE TABLE t_ads (
  id varchar(36) NOT NULL,
  title varchar(50) NOT NULL,
  content varchar(50) NOT NULL,
  logo varchar(500) DEFAULT NULL,
  ad_url varchar(500) DEFAULT '',
  show_status tinyint(4) DEFAULT '0',
  show_order int(11) DEFAULT NULL COMMENT '显示顺序',
  created_time datetime DEFAULT NULL,
  status tinyint(4) DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_ads
-- ----------------------------

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS t_role;
CREATE TABLE t_role (
  id varchar(36) NOT NULL,
  name varchar(50) NOT NULL,
  des varchar(50) NOT NULL,
  created_time datetime DEFAULT NULL,
  status tinyint(4) DEFAULT '0',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS t_permission;
CREATE TABLE t_permission (
  id varchar(36) NOT NULL,
  name varchar(500) NOT NULL,
  des varchar(50) NOT NULL,
  created_time datetime DEFAULT NULL,
  status tinyint(4) DEFAULT '0',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_permission
-- ----------------------------

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS t_role_permission;
CREATE TABLE t_role_permission (
  id varchar(36) NOT NULL,
  role_id varchar(500) NOT NULL COMMENT '角色编号',
  permission_id varchar(50) NOT NULL COMMENT '权限编号',
  created_time datetime DEFAULT NULL,
  PRIMARY KEY (id),
  KEY role_id (role_id),
  KEY permission_id (permission_id),
  CONSTRAINT t_role_permission_ibfk_1 FOREIGN KEY (role_id) REFERENCES t_role (id),
  CONSTRAINT t_role_permission_ibfk_2 FOREIGN KEY (permission_id) REFERENCES t_permission (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS t_admin;
CREATE TABLE t_admin (
  id varchar(36) NOT NULL,
  name varchar(50) NOT NULL,
  pwd varchar(50) NOT NULL,
  phone varchar(11) NOT NULL,
  email varchar(50) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY phone (phone)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO t_admin VALUES ('03251ac0-60af-4f1f-b7bd-6a24364d548e', 'admin', '4QrcOUm6Wau+VuBX8g+IPg==', '13666666666', '123@123.com');


use d_pm
insert into t_employee (name, email, pwd, phone, basic_salary, agency_id, buildings_id, id) values
('Icon Man','12311@qq.com','123456','1233345','2000','402880d55e18930f015e1894502c0000','fb0fc9ccc86a47bba6719ee06cfd7363','31fb92b6d4654c0d9d60d16c4f88fc75');
INSERT INTO `t_employee` VALUES ('31fb92b6d4654c0d9d60d16c4f88fc75', 'Icon Man', '123123@qq.com', '123456', '123123123', null, null, null, null, null, null, '2000', null, null, '402880d55e18930f015e1894502c0000', 'fb0fc9ccc86a47bba6719ee06cfd7363', null, '0');

