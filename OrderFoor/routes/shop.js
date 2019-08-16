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

router.get('/shop',(req,res)=>{
    var id = req.query.id;
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

//导出路由器
module.exports=router;