//使用express构建web服务器 --11:25
const express = require('express');
const bodyParser = require('body-parser');
const index=require("./routes/index");
const details=require("./routes/details");
const products=require("./routes/products");
const cors=require("cors");
/*引入路由模块*/


var app = express();
var server = app.listen(5050);//部署新浪云，硬性要求必须监听5050端口
app.use(cors({
  origin:"http://localhost:8080"//不能用*
}));//从此所有响应，自动带Access-Control-Allow-Origin:http://127.0.0.1:5500
//万一客户端浏览器地址发生变化，只改这里origin一处即可！
//使用body-parser中间件
app.use(bodyParser.urlencoded({extended:false}));
//托管静态资源到public目录下
app.use(express.static('public'));
/*使用路由器来管理路由*/
app.use("/index",index);
app.use("/details",details);
app.use("/products",products);


