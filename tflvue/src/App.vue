<template>
  <div>
    <ul>
      <li @click="changeType(0)">
        Login
      </li>
      <li @click="changeType(1)">
        register
      </li>
    </ul>
    <component :is="componentType" />
  </div>
</template>

<script>
import Login from "./components/Login.vue";
import Register from "./components/Register.vue";
export default {
  name: 'app',
  components:{
    Login, Register
  },
  data(){
    return {
      componentType: "Login"
    }
  },
  methods: {
    changeType(type){
      if (!!type){
        this.componentType = "Register"
      } else {
        this.componentType = "Login"
      }
    }
  }
}
</script>

<style>

</style>
 ———————————————— 
版权声明：本文为CSDN博主「ErnestToBeBetter」的原创文章，遵循CC 4.0 by-sa版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/ErnestToBeBetter/article/details/84304778