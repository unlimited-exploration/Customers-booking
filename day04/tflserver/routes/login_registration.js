const express = require("express");
const router=express.Router();
const pool=require("../pool")


// 注册请求处理
app.post("/submitRegister", (req, res) => {
    var username = req.body.name;
    var email = req.body.email;
    var password = req.body.password;
    if (users[username]) {
        res.send({ status: 500, msg: '此用户已存在,请更换用户名！' });
    } else {
        res.send({ status: 200, msg: '注册成功' });
        // 向邮箱发送邮件，并储存用户名，密码和邮箱信息
 
    }
})

// 导出路由
module.exports=router;

























