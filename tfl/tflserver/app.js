//使用express构建web服务器 --11:25
const express = require('express');
var app = express();
const bodyParser = require('body-parser');
const loginRouter=require("./routes/login.js");
const cors=require("cors");
// 设置跨域请求
app.use('/', function (req, res, next) {
	// 设置请求头为允许跨域
    res.header("Access-Control-Allow-Origin", "*");
    // 设置服务器支持的所有头信息字段
    res.header("Access-Control-Allow-Headers", "Content-Type,Content-Length, Authorization, Accept,X-Requested-With");
    // 设置服务器支持的所有跨域请求的方
    res.header("Access-Control-Allow-Methods", "POST");
    // next()方法表示进入下一个路由
    next();
});
// 监听3000端口
app.listen(3000);
//使用body-parser中间件
app.use(bodyParser.urlencoded({extended:false}));
//托管静态资源到public目录下
app.use(express.static('public'));
/*使用路由器来管理路由*/
app.use("/",loginRouter);



