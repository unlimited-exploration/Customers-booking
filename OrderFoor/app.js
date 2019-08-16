const express = require("express");
//引入用户路由器
const userRouter=require('./routes/shop.js');
// 引入中间件
const bodyParser = require("body-parser");
// 创建服务器
var app = express();
// 监听端口
app.listen(3000);

// 使用body-parser中间件
app.use( bodyParser.urlencoded({
    extended:false  //不是第三方的qs模块，而是使用querystring模块
  })
 );

//使用路由器,
// /user/reg
app.use( '/user',userRouter);