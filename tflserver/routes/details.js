const express=require("express")
const router=express.Router();
const pool=require("../pool")

router.get("/",(req,res)=>{
    var lid=req.query.lid;
    var output={
      product:{},
      specs:[],
      pics:[]
    }
    if(lid!==undefined){
      var sql1=`select * from tfl_laptop where lid=?`;
      pool.query(sql1,[lid],(err,result)=>{
        if(err) console.log(err);
        output.product=result[0];
        var family_id=output.product["family_id"];
        var sql2=`select spec,lid from tfl_laptop where family_id=?`;
        pool.query(sql2,[family_id],(err,result)=>{
          if(err) console.log(err);
          output.specs=result;
          var sql3=`select * from tfl_laptop_pic where laptop_id=?`
          pool.query(sql3,[lid],(err,result)=>{
            if(err) console.log(err);
            output.pics=result;
            res.send(output);
          })
        })
      })
    }else{
      res.send(output);
    }
  })
  
  module.exports=router;