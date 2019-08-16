const express=require("express");
const router=express.Router();
const pool=require("../pool");

router.get("/",(req,res)=>{
  var sql=`SELECT * FROM xz_index_product where seq_recommended!=0 order by seq_recommended`;
  pool.query(sql,[],(err,result)=>{
    if(err){
      res.send(err);
      console.log(err);
    }else{
      //setTimeout(function(){
        res.send(result);
      //},2000)
      
      /*res.writeHead(200,{
        "Access-Control-Allow-Origin":
          "*"
      });
      res.write(JSON.stringify(result));
      res.end();*/
    }
  })
})

module.exports=router;