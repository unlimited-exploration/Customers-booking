const express=require('express');
//引入body-parser中间件  获取post方式提交的数据
const bodyParser=require('body-parser');
//引入连接池模块(自定义连接池模块)
const pool=require('../pool.js');//'../'：上一级目录  '../../'：上两级目录
//创建路由器对象
var router=express.Router();
//使用body-parser中间件
router.use(bodyParser.urlencoded({
   extended:false //不使用第三方的qs模块，而使用querystring模块(因为它效率更快)
}));

// 根据lid来查询所有菜品
router.get('/shop',(req,res)=>{
    var id = req.query.lid;
    console.log(id);
    // 获取id异常
    if(!id){
        res.send({code:401,msg:'id值异常'});
        return;
    }
    var sql;
    if(id==1){
        // id=1 时  查肉菜表
        sql = "SELECT * FROM  cai_show_rou;"
    }
    if(id==2){
        // id=2 时  查素菜表
        sql = "SELECT * FROM  cai_show_su;"
    }
    if(id==3){
        // id=3 时  查甜点表
        sql = "SELECT * FROM  cai_show_td;"
    }
    if(id==4){
        // id=4 时  查酒水表
        sql = "SELECT * FROM  cai_show_js;"
    }
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send({code:200,msg:result});
    })
})

// 修改quantity列中的数据(前台点击"+"和"-"按钮)
router.get("/quantity",(req,res)=>{
    var sid = req.query.sid; //那一份菜
    var quantity = req.query.quantity; //修改后的quantity值
    console.log(sid+" "+quantity);
    if(!sid && !quantity){
        res.send({code:401,msg:'uid或quantity的值异常'});
        return;
    }
    var sql = "UPDATE cai_show_rou SET quantity = ? WHERE sid = ?";
    pool.query(sql,[sid,quantity],(err,result)=>{
        if(err) throw err;
        res.send({code:200,msg:result});
    })
})


//导出路由器
module.exports=router;