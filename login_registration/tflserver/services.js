// 处理登陆注册功能
const db = require('./db.js')
exports.start = (req,res)=>{
}
// 登录处理
exports.login = (req,res)=>{
    let uname = req.body.uname
    let upwd = req.body.upwd
    // 查询语句
    let sql = 'select * from tfl_login where uname = ? and upwd = ?'
    db.base(sql,uname,(result)=>{
        if(!result.length){
            return res.json({ status: 1, msg: '登录失败' })
        }else{
            // [ RowDataPacket { password: '123', username: 'admin', id: 1 } ]
            if(result[0].upwd==upwd){
                return res.json({ status: 1, msg: '登录成功' })
            }
            return res.json({ status: 1, msg: '密码错误' })
        }
    })
}

// 注册处理
exports.register = (req,res)=>{
    let uname = req.body.uname
    let upwd = req.body.upwd
    // 查询语句
    let sql = 'select * from tfl_login where uname = ? and upwd = ?'
    // 插入语句
    let insert = 'insert into tfl_login set ?'
    db.base(sql,uname,(result)=>{
        console.log(result.length)
        if(result.length!==0){
            return res.json({ status: 1, msg: '该用户名已经存在' })
        }else{
            db.base(insert,{uname,upwd},(result)=>{
                console.log(result)
                if(result.affectedRows==1){
                    return res.json({ status: 1, msg: '注册成功' })
                }
                return res.json({ status: 1, msg: '注册失败' })
            })
        }
    })
}
