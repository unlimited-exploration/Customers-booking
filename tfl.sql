SET NAMES UTF8;
DROP DATABASE IF EXISTS tfl;
CREATE DATABASE tfl CHARSET=UTF8;
USE tfl;


/**菜品类型**/
CREATE TABLE tfl_laptop_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(32)
);

-- #创建表(菜的种类)cai_class#外键
CREATE TABLE cai_class(
    cid BIGINT PRIMARY KEY AUTO_INCREMENT,#主键
    class_id INT,
    cname VARCHAR(5) NOT NULL
);

/**菜品**/
CREATE TABLE tfl_laptop(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  family_id INT,              #所属菜品家族编号
  title VARCHAR(128),         #菜品标题
  price DECIMAL(10,2),        #价格

  lname VARCHAR(32),          #菜品名称

  is_onsale BOOLEAN           #是否促销中
);

-- #创建表 每样菜的信息 cai_show_rou表 肉菜表
CREATE TABLE cai_show_rou(
    sid INT PRIMARY KEY AUTO_INCREMENT,
    sname VARCHAR(50) NOT NULL,#菜名
    price DOUBLE NOT NULL, #价格
    quantity INT NOT NULL, #数量(点了多少份)
    simg VARCHAR(50) #菜的图片路径(src)
);

#创建表 每样菜的信息 cai_show_su表 素菜表
CREATE TABLE cai_show_su(
    sid INT PRIMARY KEY AUTO_INCREMENT,
    sname VARCHAR(50) NOT NULL,#菜名
    price DOUBLE NOT NULL, #价格
    quantity INT NOT NULL, #数量(点了多少份)
    simg VARCHAR(50) #菜的图片路径(src)
);

-- #创建表 每样菜的信息 cai_show_td表 甜点表
CREATE TABLE cai_show_td(
    sid INT PRIMARY KEY AUTO_INCREMENT,
    sname VARCHAR(50) NOT NULL,#菜名
    price DOUBLE NOT NULL, #价格
    quantity INT NOT NULL, #数量(点了多少份)
    simg VARCHAR(50) #菜的图片路径(src)
);

#创建表 每样菜的信息 cai_show_js表 酒水表
CREATE TABLE cai_show_js(
    sid INT PRIMARY KEY AUTO_INCREMENT,
    sname VARCHAR(50) NOT NULL,#菜名
    price DOUBLE NOT NULL, #价格
    quantity INT NOT NULL, #数量(点了多少份)
    simg VARCHAR(50) #菜的图片路径(src)
);

/**菜品图片**/
CREATE TABLE tfl_laptop_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  laptop_id INT,              #菜品编号
  sm VARCHAR(128),            #小图片路径
  md VARCHAR(128),            #中图片路径
  lg VARCHAR(128)             #大图片路径
);

/**用户信息**/
CREATE TABLE tfl_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32) NOT NULL,        #用户名
  upwd VARCHAR(32) NOT NULL,         #用户密码
  phone VARCHAR(16) NOT NULL,        #用户手机

  avatar VARCHAR(128) NOT NULL,        #头像图片路径
  user_name VARCHAR(32) NOT NULL,      #用户名，如王小明
  gender INT                  #性别  0-女  1-男
);

/**购物车条目**/
CREATE TABLE tfl_shoppingcart_item(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,      #用户编号
  product_id INT,   #菜品编号
  count INT,        #购买数量
  is_checked BOOLEAN #是否已勾选，确定购买
);

/**用户订单**/
CREATE TABLE tfl_order(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  address_id INT,
  status INT,             #订单状态  1-等待付款  2-等待发货  3-运输中  4-已签收  5-已取消
  order_time BIGINT,      #下单时间
  pay_time BIGINT,        #付款时间
  deliver_time BIGINT,    #发货时间
  received_time BIGINT    #签收时间
)AUTO_INCREMENT=10000000;

/**用户订单**/
CREATE TABLE tfl_order_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,           #订单编号
  product_id INT,         #产品编号
  count INT               #购买数量
);

/****首页轮播广告商品****/
CREATE TABLE tfl_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),               #首页图片
  title VARCHAR(64),              #图片标题
  href VARCHAR(128)               #跳转链接
);

/****首页菜品****/
CREATE TABLE tfl_index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),                #商品标题
  href VARCHAR(128),                #跳转链接
  pic VARCHAR(128)             #菜品图片
);


/*******菜单菜品*******/
CREATE TABLE tfl_index_menu(
  mid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),                #商品标题
  pic VARCHAR(128),                 #商品图片
  price DECIMAL(10,2),              #商品价格
  href VARCHAR(128)                #跳转链接
);

-- #购物车表

-- #购物车零时表  如果在该表中
CREATE TABLE user_shopping(
    sid INT PRIMARY KEY AUTO_INCREMENT, #ID
    uid INT NOT NULL,                   #是谁点的菜    id/登录表中的id
    sname VARCHAR(50) NOT NULL,         #菜的名称      菜名
    quantity VARCHAR(50) NOT NULL,      #某种菜的数量  数量
    price DOUBLE NOT NULL               #菜的价格      价格
);

#(2)创建表 tfl_login
CREATE TABLE tfl_login(
id INT PRIMARY KEY AUTO_INCREMENT,
uname VARCHAR(50),
upwd VARCHAR(32)
);
/*******************/
/******数据导入******/
/*******************/
/**菜品家族**/
INSERT INTO tfl_laptop_family VALUES
(NULL,'肉菜'),
(NULL,'素菜'),
(NULL,'甜点'),
(NULL,'酒水'),
(NULL,'主食');

-- #输入菜的数据
INSERT INTO cai_class VALUES
(null,1,'肉菜'),
(null,2,'素菜'),
(null,3,'甜点'),
(null,4,'酒水');
-- 肉菜
INSERT INTO cai_show_rou VALUES
(null,"酱油鱼",49.0,0,"http://localhost:3000/img/rou/r_1.jpg"),
(null,"干煸小鱿鱼",68.0,0,"http://localhost:3000/img/rou/r_2.jpg"),
(null,"蒜蓉扇贝",78.0,0,"http://localhost:3000/img/rou/r_3.jpg"),
(null,"蚝油鱿鱼圈",69.0,0,"http://localhost:3000/img/rou/r_4.jpg"),
(null,'红烧肉',78.0,0," http://localhost:3000/img/rou/r_5.jpg"),
(null,'清蒸鲈鱼',85.0,0," http://localhost:3000/img/rou/r_6.jpg"),
(null,'蜜汁叉烧',68.0,0," http://localhost:3000/img/rou/r_7.jpg"),
(null,'兔肉煲',99.0,0," http://localhost:3000/img/rou/r_8.jpg"),
(null,'酱油鸡',56.0,0," http://localhost:3000/img/rou/r_9.jpg"),
(null,'脆皮烧猪',68.0,0," http://localhost:3000/img/rou/r_10.jpg"),
(null,'咕咕咕',58.0,0," http://localhost:3000/img/rou/r_11.jpg");
--素菜
INSERT INTO cai_show_su VALUES
(null,"炒鲜蔬",32.0,0,"http://localhost:3000/img/sucai/s_1.jpg"),
(null,"上汤木耳",33.0,0,"http://localhost:3000/img/sucai/s_2.jpg"),
(null,"白灼菜心",35.0,0,"http://localhost:3000/img/sucai/s_3.jpg"),
(null,"水瓜咸蛋黄",45.0,0,"http://localhost:3000/img/sucai/s_4.jpg"),
(null,"蚝油鸡腿菇",35.0,0,"http://localhost:3000/img/sucai/s_5.jpg"),
(null,"油焖茄子",39.0,0,"http://localhost:3000/img/sucai/s_6.jpg"),
(null,"孔雀开屏",52.0,0,"http://localhost:3000/img/sucai/s_7.jpg"),
(null,"茄子炒豆角",36.0,0,"http://localhost:3000/img/sucai/s_8.jpg"),
(null,"烧烤茄子",35.0,0,"http://localhost:3000/img/sucai/s_9.jpg");

-- #甜点
INSERT INTO cai_show_td VALUES
(null,"和风抹茶麻薯",20.0,0,"http://localhost:3000/img/tiandian/t_1.jpg"),
(null,"马卡龙",21.0,0,"http://localhost:3000/img/tiandian/t_2.jpg"),
(null,"哈密瓜红豆刨冰",38.0,0,"http://localhost:3000/img/tiandian/t_3.jpg"),
(null,"爆浆抹茶蛋糕",42.0,0,"http://localhost:3000/img/tiandian/t_4.jpg"),
(null,"巧克力草莓蛋糕",32.0,0,"http://localhost:3000/img/tiandian/t_5.jpg"),
(null,"巧克力慕斯",45.0,0,"http://localhost:3000/img/tiandian/t_6.jpg");
-- 酒水
INSERT INTO cai_show_js VALUES
(null,"百威",8.0,0,"http://localhost:3000/img/yinliao/j_1.jpg"),
(null,"茅台",588.0,0,"http://localhost:3000/img/yinliao/j_2.jpg"),
(null,"82年拉菲",1098.0,0,"http://localhost:3000/img/yinliao/j_3.jpg"),
(null,"鲜榨橙汁",12.0,0,"http://localhost:3000/img/yinliao/j_4.jpg"),
(null,"港式丝袜奶茶",19.0,0,"http://localhost:3000/img/yinliao/j_5.jpg"),
(null,"焦糖玛奇朵",20.0,0,"http://localhost:3000/img/yinliao/j_6.jpg"),
(null,"卡布奇诺",22.0,0,"http://localhost:3000/img/yinliao/j_7.jpg"),
(null,"波霸珍珠奶茶",18.0,0,"http://localhost:3000/img/yinliao/j_8.jpg"),
(null,"布蕾奥利奥",22.0,0,"http://localhost:3000/img/yinliao/j_9.jpg"),
(null,"抹茶冰沙",23.0,0,"http://localhost:3000/img/yinliao/j_10.jpg"),
(null,"奶盖火龙果冰沙",25.0,0,"http://localhost:3000/img/yinliao/j_11.jpg"),
(null,"维他柠檬茶",5.0,0,"http://localhost:3000/img/yinliao/j_12.jpg"),
(null,"维他奶",4.0,0,"http://localhost:3000/img/yinliao/j_13.jpg"),
(null,"可口可乐",4.0,0,"http://localhost:3000/img/yinliao/j_14.jpg"),
(null,"雪碧",4.0,0,"http://localhost:3000/img/yinliao/j_15.jpg");

/**菜品**/
INSERT INTO tfl_laptop VALUES
/***肉菜***/
(1,1,'酱香味，鱼鲜味',49,'酱油鱼',true),
(2,1,'鱿鱼原本的香味',68,'干煸小鱿鱼',false),
(3,1,'蒜蓉遇上扇贝，鲜美翻倍',78,'蒜蓉扇贝',false),
(4,1,'浓油赤酱，带出大海的味道',69,'蚝油鱿鱼圈',false),
(5,1,'慢炖6小时，肥而不腻，瘦而不柴',78,'红烧肉',false),
(6,1,'清蒸，带出鱼的鲜味',85,'清蒸鲈鱼',false),
(7,1,'咸甜味，带着叉烧独有的魅力',68,'蜜汁叉烧',false),
(8,1,'神仙肉，兔子窝',99,'兔肉煲',false),
(9,1,'简单的美味',56,'酱油鸡',false),
(10,1,'精选乳猪，脆皮带着鲜嫩的猪肉',68,'脆皮烧猪',false),
(11,1,'鸽子，烧死',58,'咕咕咕',false),
/***素菜***/
(31,2,'时令蔬菜交互碰撞，迸发出美味的火花',32,'炒鲜蔬',false),
(32,2,'八小时慢熬的上汤，煨出木耳的鲜美',33,'上汤木耳',false),
(33,2,'简单，而不简陋，做出蔬菜本身的美味',35,'白灼菜心',false),
(34,2,'咸蛋黄的香醇，带着水瓜的清新，skr~',45,'水瓜咸蛋黄',false),
(35,2,'浓油赤酱，勾兑出鸡腿菇的鲜美',35,'蚝油鸡腿菇',false),
(36,2,'宽油，也是一种爱',39,'油焖茄子',false),
(37,2,'华丽，但不只华丽',52,'孔雀开屏',false),
(38,2,'经典的小清新搭配',36,'茄子炒豆角',false),
(39,2,'街头必点',35,'烧烤茄子',false),
/***甜点***/
(51,3,'小清新的颜值，Q弹的口感',20,'和风抹茶麻薯',false),
(52,3,'爱她，就请她吃马卡龙',21,'马卡龙',false),
(53,3,'祖传刨冰手法',38,'哈密瓜红豆刨冰',false),
(54,3,'爆炸的美味',42,'爆浆抹茶蛋糕',false),
(55,3,'酸与甜的融合，造就出幸福快乐的味道。',32,'巧克力草莓蛋糕',false),
(56,3,'巧克力的是爱情的守护者，那醇香浓厚的口感总是带有不离不弃的情感，传统的巧克力加上甜蜜的慕斯就像是一对热恋的情人，可以无条件的为对方付出但是又含蓄的隐藏自己的一片深情！正是这款款深情才创造出这难以忘怀的滋味！',45,'巧克力慕斯',false),
/***酒水饮料***/
(71,4,'百威，敬真我',8,'百威',false),
(72,4,'相逢，人生的机缘；相识，人生的财富；相知，人生的感动。茅台迎宾酒，迎宾迎天下',588,'茅台',false),
(73,4,'拉菲诶',1098,'82年拉菲',false),
(74,4,'橙汁不是诚挚~ 诚挚不是橙汁~ 不过很可能诚挚变成汁',12,'鲜榨橙汁',false),
(75,4,'冷冷冬日季，暖暖奶茶情',19,'港式丝袜奶茶',false),
(76,4,'甜蜜的印记',20,'焦糖玛奇朵',false),
(77,4,'爱在唇齿间 卡布奇诺的暗语就是：I LOVE YOU',22,'卡布奇诺',false),
(78,4,'大杯畅饮',18,'波霸珍珠奶茶',false),
(79,4,'幸福的味道',22,'布蕾奥利奥',false),
(80,4,'生活的味道',23,'抹茶冰沙',false),
(81,4,'健康的味道',25,'奶盖火龙果冰沙',false),
(82,4,'维他柠檬茶，爽过吸大麻',5,'维他柠檬茶',false),
(83,4,'你可以搭车,搭台,搭棚.搭船,但千奇5好搭讪...',4,'维他奶',false),
(84,4,'美味畅爽',4,'可口可乐',false),
(85,4,'透心凉，心飞扬',4,'雪碧',false)
;

/**菜品图片**/
INSERT INTO tfl_laptop_pic VALUES
(NULL, 1, 'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/57b12a31N8f4f75a3.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 1, 'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/57ad359dNd4a6f130.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 1, 'img/product/sm/57ad8846N64ac3c79.jpg','img/product/md/57ad8846N64ac3c79.jpg','img/product/lg/57ad8846N64ac3c79.jpg')
;

/**用户信息**/
INSERT INTO tfl_user VALUES
(NULL, 'dingding', '123456', '13501234567', 'img/avatar/default.png', '丁伟', '1'),
(NULL, 'dangdang', '123456', '13501234568', 'img/avatar/default.png', '林当', '1'),
(NULL, 'doudou', '123456', '13501234569', 'img/avatar/default.png', '窦志强', '1'),
(NULL, 'yaya', '123456', '13501234560', 'img/avatar/default.png', '秦小雅', '0');

/****首页轮播广告商品****/
INSERT INTO tfl_index_carousel VALUES
(NULL, 'img/index/r_15','轮播广告商品1','product_details.html?lid=28'),
(NULL, 'img/index/r_23','轮播广告商品2','product_details.html?lid=19'),
(NULL, 'img/index/r_24.jpg','轮播广告商品3','lookforward.html');

/****首页菜品****/
INSERT INTO tfl_index_product VALUES
(NULL, '首页商品标题1', 'product_details.html?lid=101','img/index/r_15.jpg'),
(NULL, '首页商品标题2', 'product_details.html?lid=102','img/index/r_23.jpg'),
(NULL, '首页商品标题3', 'product_details.html?lid=103','img/index/r_24.jpg');

/****菜单菜品****/
INSERT INTO tfl_index_menu VALUES
/***肉菜****/
(NULL, '菜单商品标题1', 'product_details.html?lid=1',49,'img/menu/meat/r_1.jpg'),
(NULL, '菜单商品标题2', 'product_details.html?lid=2',68,'img/menu/meat/r_2.jpg'),
(NULL, '菜单商品标题3', 'product_details.html?lid=3',78,'img/menu/meat/r_3.jpg'),
(NULL, '菜单商品标题4', 'product_details.html?lid=4',69,'img/menu/meat/r_4.jpg'),
(NULL, '菜单商品标题5', 'product_details.html?lid=5',78,'img/menu/meat/r_5.jpg'),
(NULL, '菜单商品标题6', 'product_details.html?lid=6',85,'img/menu/meat/r_6.jpg'),
(NULL, '菜单商品标题7', 'product_details.html?lid=7',68,'img/menu/meat/r_7.jpg'),
(NULL, '菜单商品标题8', 'product_details.html?lid=8',99,'img/menu/meat/r_8.jpg'),
(NULL, '菜单商品标题9', 'product_details.html?lid=9',56,'img/menu/meat/r_9.jpg'),
(NULL, '菜单商品标题10', 'product_details.html?lid=10',68,'img/menu/meat/r_10.jpg'),
(NULL, '菜单商品标题11', 'product_details.html?lid=11',58,'img/menu/meat/r_11.jpg'),
/***素菜****/
(NULL, '菜单商品标题31', 'product_details.html?lid=31',32,'img/menu/vegetable plate/s_1.jpg'),
(NULL, '菜单商品标题32', 'product_details.html?lid=32',33,'img/menu/vegetable plate/s_2.jpg'),
(NULL, '菜单商品标题33', 'product_details.html?lid=33',35,'img/menu/vegetable plate/s_3.jpg'),
(NULL, '菜单商品标题34', 'product_details.html?lid=34',45,'img/menu/vegetable plate/s_4.jpg'),
(NULL, '菜单商品标题35', 'product_details.html?lid=35',35,'img/menu/vegetable plate/s_5.jpg'),
(NULL, '菜单商品标题36', 'product_details.html?lid=36',39,'img/menu/vegetable plate/s_6.jpg'),
(NULL, '菜单商品标题37', 'product_details.html?lid=37',52,'img/menu/vegetable plate/s_7.jpg'),
(NULL, '菜单商品标题38', 'product_details.html?lid=38',36,'img/menu/vegetable plate/s_8.jpg'),
(NULL, '菜单商品标题39', 'product_details.html?lid=39',35,'img/menu/vegetable plate/s_9.jpg'),
/***甜点***/
(NULL, '菜单商品标题51', 'product_details.html?lid=51',20,'img/menu/Dessert/t_1.jpg'),
(NULL, '菜单商品标题52', 'product_details.html?lid=52',21,'img/menu/Dessert/t_2.jpg'),
(NULL, '菜单商品标题53', 'product_details.html?lid=53',38,'img/menu/Dessert/t_3.jpg'),
(NULL, '菜单商品标题54', 'product_details.html?lid=54',42,'img/menu/Dessert/t_4.jpg'),
(NULL, '菜单商品标题55', 'product_details.html?lid=55',32,'img/menu/Dessert/t_5.jpg'),
(NULL, '菜单商品标题56', 'product_details.html?lid=56',45,'img/menu/Dessert/t_6.jpg'),
/***酒水****/
(NULL, '菜单商品标题71', 'product_details.html?lid=71',8,'img/img/menu/soft drink/j_1.jpg'),
(NULL, '菜单商品标题72', 'product_details.html?lid=72',588,'img/img/menu/soft drink/j_2.jpg'),
(NULL, '菜单商品标题73', 'product_details.html?lid=73',1098,'img/img/menu/soft drink/j_3.jpg'),
(NULL, '菜单商品标题74', 'product_details.html?lid=74',12,'img/img/menu/soft drink/j_4.jpg'),
(NULL, '菜单商品标题75', 'product_details.html?lid=75',19,'img/img/menu/soft drink/j_5.jpg'),
(NULL, '菜单商品标题76', 'product_details.html?lid=76',20,'img/img/menu/soft drink/j_6.jpg'),
(NULL, '菜单商品标题77', 'product_details.html?lid=77',22,'img/img/menu/soft drink/j_7.jpg'),
(NULL, '菜单商品标题78', 'product_details.html?lid=78',18,'img/img/menu/soft drink/j_8.jpg'),
(NULL, '菜单商品标题79', 'product_details.html?lid=79',22,'img/img/menu/soft drink/j_9.jpg'),
(NULL, '菜单商品标题80', 'product_details.html?lid=80',23,'img/img/menu/soft drink/j_10.jpg'),
(NULL, '菜单商品标题81', 'product_details.html?lid=81',25,'img/img/menu/soft drink/j_11.jpg'),
(NULL, '菜单商品标题82', 'product_details.html?lid=82',5,'img/img/menu/soft drink/j_12.jpg'),
(NULL, '菜单商品标题83', 'product_details.html?lid=83',4,'img/img/menu/soft drink/j_13.jpg'),
(NULL, '菜单商品标题84', 'product_details.html?lid=84',4,'img/img/menu/soft drink/j_14.jpg'),
(NULL, '菜单商品标题85', 'product_details.html?lid=85',4,'img/img/menu/soft drink/j_15.jpg')
;
CREATE TABLE comments_info (
  id VARCHAR(32) NOT NULL COMMENT '评论主键id',
  owner_id VARCHAR(32) NOT NULL COMMENT '被评论者id，可以是人、项目、资源',
  from_id VARCHAR(32) NOT NULL COMMENT '评论者id',
  from_name VARCHAR(32) NOT NULL COMMENT '评论者名字',
  from_avatar VARCHAR(512) DEFAULT '' COMMENT '评论者头像',
  like_num int(11) DEFAULT '0' COMMENT '点赞的数量',
  content VARCHAR(512) DEFAULT NULL COMMENT '评论内容',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (id),
KEY owner_id (owner_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='评论主表';

CREATE TABLE comments_reply (
  id int(11) NOT NULL AUTO_INCREMENT,
  comment_id VARCHAR(32) NOT NULL COMMENT '评论主表id',
  from_id VARCHAR(32) NOT NULL COMMENT '评论者id',
  from_name VARCHAR(32) NOT NULL COMMENT '评论者名字',
  from_avatar VARCHAR(512) DEFAULT '' COMMENT '评论者头像',
  to_id VARCHAR(32) NOT NULL COMMENT '被评论者id',
  to_name VARCHAR(32) NOT NULL COMMENT '被评论者名字',
  to_avatar VARCHAR(512) DEFAULT '' COMMENT '被评论者头像',
  content VARCHAR(512) DEFAULT NULL COMMENT '评论内容',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY comment_id (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='评论回复表';

