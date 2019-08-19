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