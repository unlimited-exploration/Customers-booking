const express=require("express");
const router=express.Router();
const pool=require("../pool");

// 登录组件
router.get("/login",function(req,res){
  var uname = req.query.uname;
  var upwd = req.query.upwd;
  var sql = 'select * from tfl_login where uname = ? and upwd = ?'
  // console.log(sql);
  pool.query(sql,[uname,upwd],(err,result)=>{
    if(err) throw err;
    console.log(result);
    // 判断数据长度是否大于0
    if(result.length>0){
      res.send({status:1,msg:"登录成功"});
    }else{
      res.send({status:1,msg:"登录失败！"})
    }
  })
})

// 注册组件
router.post('/reg',(req,res)=>{
    // 获取post请求的数据
    var uname = req.body.uname;
    var upwd = req.body.upwd;
    // 查询语句
    var sql = 'select * from tfl_login where uname = ? and upwd = ?'
    // 插入语句
    var insert = 'insert into tfl_login set ?'
    pool.query(sql,[uname,upwd],(err,result)=>{
      if(err) throw err;
      if(result.length==0){
        res.send({status:1,msg:'该用户名已经存在！'})
      }else{
        pool.query(insert,[uname,upwd],(err,result)=>{
            if(err) throw err;
            if(result.affectedRows==1){
              res.send({status:1,msg:'注册成功'})
            }
        })
      }
    })
})
module.exports=router;