CREATE DATABASE push DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CREATE TABLE t_user (
--   id int AUTO_INCREMENT PRIMARY KEY ,
--   name VARCHAR(30) NOT NULL COMMENT '名字',
--   password VARCHAR(60) NOT NULL COMMENT '密码',
--   email VARCHAR(30) COMMENT '邮箱',
--   phone VARCHAR(30) COMMENT '电话',
--   remark VARCHAR(30) COMMENT '备注'
-- ) COMMENT '用户表';
--
-- INSERT INTO t_user (name, password, email, phone, remark) VALUES ('jack', '123456', 'jack@163.com', '18911331234', 'test');
-- INSERT INTO t_user (name, password, email, phone, remark) VALUES ('rose', 'abced', 'rose@yahoo.com', '13711338884', 'test');
-- INSERT INTO t_user (name, password, email, phone, remark) VALUES ('bob', 'qwerdf', 'bob@gmail.com', '18911330987', 'test');

-- 用户表
DROP TABLE IF EXISTS t_user;
CREATE TABLE t_user (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
  login_name VARCHAR(30) NOT NULL COMMENT '登陆名',
  password VARCHAR(100) NOT NULL COMMENT '密码',
  name VARCHAR(30) NOT NULL COMMENT '用户真名',
  email VARCHAR(60) COMMENT '邮箱',
  mobile VARCHAR(30) COMMENT '手机号',
  status tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 1.启用中 2.已停用',
  wx_open_id VARCHAR(60) COMMENT '微信open id',
  wx_union_id VARCHAR(60) COMMENT '微信union id',
  nick_name VARCHAR(30) COMMENT '用户昵称',
  avatar_url VARCHAR(300) COMMENT '用户头像URL',
  gender TINYINT(1) COMMENT '性别1.男 2女 0未知',
  country VARCHAR(30) COMMENT '用户所在国家',
  province VARCHAR(30) COMMENT '用户所在省份',
  city VARCHAR(30) COMMENT '用户所在城市',
  language VARCHAR(30) COMMENT '所用的语言',

  remark VARCHAR(100) COMMENT '备注',
  create_by int(11) COMMENT '创建人ID',
  create_at datetime COMMENT '创建时间',
  update_by int(11) COMMENT '更新人ID',
  update_at datetime COMMENT '更新时间',
  delete_flag tinyint(1) DEFAULT 0 COMMENT '删除标志1.是 0否'

)COMMENT '用户';
CREATE INDEX idx_user_login_name ON t_user(login_name) ;
CREATE INDEX idx_user_email ON t_user(email);
CREATE INDEX idx_user_mobile ON t_user(mobile);
CREATE INDEX idx_user_wx_union_id ON t_user(wx_union_id);

-- init user
INSERT INTO t_user (id, login_name, password, name, email, mobile, status, wx_open_id, wx_union_id, nick_name, avatar_url, gender, country, province, city, language, remark, create_by, create_at, update_by, update_at, delete_flag) VALUES (1, 'admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', 'admin', 'wangwei_omg@163.com', '18911580722', 1, null, null, '取个好名字', null, 1, null, null, null, null, null, 1, now(), 1, now(), 0);

DROP TABLE IF EXISTS sys_dict;
CREATE TABLE sys_dict (
  id INT(11) AUTO_INCREMENT PRIMARY KEY COMMENT 'id',
  type VARCHAR(100) COMMENT '类型',
  label VARCHAR(100) COMMENT '标签',
  value VARCHAR(100) COMMENT '值',
  description VARCHAR(100) COMMENT '描述',
  sort INT(11) COMMENT '排序',
  remark VARCHAR(100) COMMENT '备注',
  create_by INT(11) COMMENT '创建人',
  create_at DATETIME COMMENT '创建时间',
  update_by INT(11) COMMENT '更新人',
  update_at DATETIME COMMENT '更新时间',
  delete_flag TINYINT(1) COMMENT '1 删除 0正常'

) COMMENT '字典';
