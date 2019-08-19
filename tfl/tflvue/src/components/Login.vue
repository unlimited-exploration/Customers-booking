<template>
    <form>
        <label for="uname">用户名:</label>
        <input type="text" v-model="uname" id="uname">
        <br>
        <label for="upwd">密码:</label>
        <input type="password" v-model="upwd" id="upwd">
        <br>
        <button @click.prevent="login">登录</button>
        <div>{{msg}}</div>
    </form>
</template>
<script>
export default {
    data(){
        return {
            uname:'',
            upwd:'',
            msg:''//接收数据
        }
    },
    methods:{
        login(){
          // 使用ajax发送请求
          console.log(this.uname,this.upwd,this.HOST);
            this.$axios.post(this.HOST+'/api/login',{uname:this.uname,upwd:this.upwd})
            
            .then(result=>{
                console.log(result.data)
                this.msg = result.data.msg
            })
            .catch(err=>{
                console.log(err)
            })
        }
    }
}
</script>