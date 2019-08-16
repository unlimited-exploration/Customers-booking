const express = require("express");
const router=express.Router();
const pool=require("../pool")


// 注册请求处理
app.post("/login", (req, res) => {
    // 1:获取网页传递过来的两个数据：uname  upwd
    var uname = req.body.uname;
    var upwd = req.body.upwd;
    // 2:sql：查询sql语句
    var sql = "select id from tfl_login where uname=? and upwd=?";
    // 3:json:{code:1,msg:"登录成功"}
    pool.query(sql,[uname,upwd],(err,result)=>{
        // 执行sql语句回调函数
        console.log(result);
        if(err) throw err;
        if(result.legnth==0){
            res.send({code:-1,msg:"用户名或密码有误！"})
        }else{
            res.send({code:1,msg:"登录成功！"})
        }
    })
})

// 导出路由
module.exports=router;

























