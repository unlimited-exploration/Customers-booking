<template>
    <form>
        <label for="username">用户名:</label>
        <input type="text" v-model="username" id="username">
        <br>
        <label for="pwd">密码:</label>
        <input type="password" v-model="pwd" id="pwd">
        <br>
        <label for="again">密码:</label>
        <input type="password" v-model="again" id="again" @blur="verify">
        <br>
        <button @click.prevent="register">注册</button>
        <div>{{msg}}</div>
    </form>
</template>
<script>
export default {
    data(){
        return {
            username:'',
            pwd:'',
            again:'',
            msg:''//接收数据
        }
    },
    methods:{
        verify(){
            if(this.pwd!==this.again){
                this.msg = '两次密码不一致'
                return;
            }
        },
        register(){
            this.verify()
            this.$axios.post(this.HOST+'/api/register',{username:this.username,password:this.pwd})
            .then(result=>{
                this.msg = result.data.msg
            })
            .catch(err=>{
                
            })
        }
    }
}
</script>
