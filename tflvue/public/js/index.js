new Vue({
  el:"#f1",
  data:{
    p1:{price:0},
    p2:{price:0},
    p3:{price:0},
    arr:[]//不需要初始化？
          //v-for，发现是空数组时，就一次都不执行！自然发现不了p.price.toFixed(2)
  },
  created(){
    axios.get(//异步: mounted才不会等ajax请求回来！
      "http://localhost:3000/index"
    ).then(result=>{
      var [p1, p2, p3]=result.data;
      this.p1=p1;
      this.p2=p2;
      this.p3=p3;
      this.arr=result.data.slice(3);
    })
  },
  mounted(){
    //首次要执行p1.price.toFixed(2)
    //很可能ajax响应还没回来呢！
    //导致: p1.price是undefined
    //       .toFixed(2)报错
    //       不能调用Undefined的toFixed(2)
  },
  //当ajax请求回来，执行this.p1=p1，试图修改data中的p1，从而触发了updated()!
  updated(){
    //只要变量更新，页面会重新加载！
    //此次加载时，data中的p1已经有price了！p1.price.toFixed(2)就正常了。
  }
})
