//使用express构建web服务器 --11:25
const express = require('express');
var app = express();
const bodyParser = require('body-parser');
const router = require('./router');
// const login_registration=require("./routes/login_registration");
const cors=require("cors");
/*引入路由模块*/

app.use('/api/*', function (req, res, next) {
	// 设置请求头为允许跨域
    res.header("Access-Control-Allow-Origin", "*");
    // 设置服务器支持的所有头信息字段
    res.header("Access-Control-Allow-Headers", "Content-Type,Content-Length, Authorization, Accept,X-Requested-With");
    // 设置服务器支持的所有跨域请求的方法
    res.header("Access-Control-Allow-Methods", "POST,GET");
    // next()方法表示进入下一个路由
    next();
});
app.listen(5050);//部署新浪云，硬性要求必须监听5050端口
app.use(cors({
  origin:"http://localhost:8080"//不能用*
}));//从此所有响应，自动带Access-Control-Allow-Origin:http://127.0.0.1:5500
//万一客户端浏览器地址发生变化，只改这里origin一处即可！
//使用body-parser中间件
app.use(bodyParser.urlencoded({extended:false}));
// 处理json格式的参数
app.use(bodyParser.json())
// 配置路由
app.use(router);




