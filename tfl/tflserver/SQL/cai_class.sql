#菜的种类
SET NAMES UTF8;
# 如果有就删除tfl数据库
DROP DATABASE IF EXISTS tfl;
#创建数据库并设置格式为utf8
CREATE DATABASE tfl CHARSET=UTF8;
USE tfl;

#创建表(菜的种类)cai_class#外键
CREATE TABLE cai_class(
    cid BIGINT PRIMARY KEY AUTO_INCREMENT,#主键
    class_id INT,
    cname VARCHAR(5) NOT NULL
);
INSERT INTO cai_class VALUES(null,1,'肉菜');
INSERT INTO cai_class VALUES(null,2,'素菜');
INSERT INTO cai_class VALUES(null,3,'甜点');
INSERT INTO cai_class VALUES(null,4,'酒水');


#创建表 每样菜的信息 cai_show_rou表 肉菜表
CREATE TABLE cai_show_rou(
    sid INT PRIMARY KEY AUTO_INCREMENT,
    sname VARCHAR(50) NOT NULL,#菜名
    price DOUBLE NOT NULL, #价格
    quantity INT NOT NULL, #数量(点了多少份)
    simg VARCHAR(50) #菜的图片路径(src)
);
INSERT INTO cai_show_rou VALUES(null,"酸辣藕丁",78.0,0,"rou1.jpg");
INSERT INTO cai_show_rou VALUES(null,"回锅肉",88.0,0,"rou2.jpg");
INSERT INTO cai_show_rou VALUES(null,"酸辣藕丁",78.0,0,"rou3.jpg");
INSERT INTO cai_show_rou VALUES(null,"回锅肉",98.0,0,"rou4.jpg");


#创建表 每样菜的信息 cai_show_su表 素菜表
CREATE TABLE cai_show_su(
    sid INT PRIMARY KEY AUTO_INCREMENT,
    sname VARCHAR(50) NOT NULL,#菜名
    price DOUBLE NOT NULL, #价格
    quantity INT NOT NULL, #数量(点了多少份)
    simg VARCHAR(50) #菜的图片路径(src)
);

INSERT INTO cai_show_su VALUES(null,"酸辣藕丁",78.0,0,"rou1.jpg");
INSERT INTO cai_show_su VALUES(null,"回锅肉",88.0,0,"rou2.jpg");
INSERT INTO cai_show_su VALUES(null,"酸辣藕丁",78.0,0,"rou3.jpg");
INSERT INTO cai_show_su VALUES(null,"回锅肉",98.0,0,"rou4.jpg");

#创建表 每样菜的信息 cai_show_td表 甜点表
CREATE TABLE cai_show_td(
    sid INT PRIMARY KEY AUTO_INCREMENT,
    sname VARCHAR(50) NOT NULL,#菜名
    price DOUBLE NOT NULL, #价格
    quantity INT NOT NULL, #数量(点了多少份)
    simg VARCHAR(50) #菜的图片路径(src)
);

INSERT INTO cai_show_td VALUES(null,"酸辣藕丁",78.0,0,"rou1.jpg");
INSERT INTO cai_show_td VALUES(null,"回锅肉",88.0,0,"rou2.jpg");
INSERT INTO cai_show_td VALUES(null,"酸辣藕丁",78.0,0,"rou3.jpg");
INSERT INTO cai_show_td VALUES(null,"回锅肉",98.0,0,"rou4.jpg");

#创建表 每样菜的信息 cai_show_js表 酒水表
CREATE TABLE cai_show_js(
    sid INT PRIMARY KEY AUTO_INCREMENT,
    sname VARCHAR(50) NOT NULL,#菜名
    price DOUBLE NOT NULL, #价格
    quantity INT NOT NULL, #数量(点了多少份)
    simg VARCHAR(50) #菜的图片路径(src)
);

INSERT INTO cai_show_js VALUES(null,"酸辣藕丁",78.0,0,"rou1.jpg");
INSERT INTO cai_show_js VALUES(null,"回锅肉",88.0,0,"rou2.jpg");
INSERT INTO cai_show_js VALUES(null,"酸辣藕丁",78.0,0,"rou3.jpg");
INSERT INTO cai_show_js VALUES(null,"回锅肉",98.0,0,"rou4.jpg");

#购物车表
#用户表
CREATE TABLE user(
    uid INT PRIMARY KEY AUTO_INCREMENT, #用户编号
    uname VARCHAR(50) NOT NULL,         #账号名
    upassword VARCHAR(50) NOT NULL,     #密码
)

INSERT INTO user VALUES(null,"天上飞的是什么","123456","张振荣");
INSERT INTO user VALUES(null,"地上跑的是什么","123456","凌中大");
INSERT INTO user VALUES(null,"水里游的的是什么","123456","叶晓蓉");

#购物车零时表  如果在该表中
CREATE TABLE user_shopping(
    sid INT PRIMARY KEY AUTO_INCREMENT, #ID
    uid INT NOT NULL,                   #是谁点的菜    id/登录表中的id
    sname VARCHAR(50) NOT NULL,         #菜的名称      菜名
    quantity VARCHAR(50) NOT NULL,      #某种菜的数量  数量
    price DOUBLE NOT NULL               #菜的价格      价格
)
