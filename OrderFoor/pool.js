const mysql=require('mysql');
//创建连接池对象
var pool=mysql.createPool({
  host:'127.0.0.1', //路径
  port:'3306',//端口
  user:'root', //账号
  password:'',//密码
  database:'tfl',//数据库库名
  connectionLimit:20 //连接数
});
//导出连接池对象
module.exports=pool;


