<template>
  <div>
    <my-header/>
    <main id="main" class="container">
      <div class="pb-2 text-center">
        <img class="d-block mx-auto mb-4 w-100" src="img/index/index_guild.png">
      </div>
      <div class="row">
        <div class="col-md-9">
          <h5 class="mb-3 p-2 text-muted">笔记本电脑</h5>
          <div id="plist" class="row bg-white ml-1 mr-1 pt-2 pl-2">
            <div v-for="(p,i) of plist" :key="i" class="col-md-4 p-1">
              <div class="card mb-4 box-shadow pr-2 pl-2">
                <router-link :to="`/details/${p.lid}`">
                  <img class="card-img-top" :src="p.md">
                </router-link>
                <div class="card-body p-0">
                  <h5 class="text-primary" v-cloak>￥{{p.price.toFixed(2)}}</h5>
                  <p class="card-text">
                    <router-link :to="`/details/${p.lid}`" class="text-muted small" v-text="p.title"></router-link>
                  </p>
                  <div class="d-flex justify-content-between align-items-center p-2 pt-0">
                    <button class="btn btn-outline-secondary p-0 border-0" type="button">-</button>
                    <input type="text" class="form-control p-1" value="10">
                    <button class="btn btn-outline-secondary p-0 border-0" type="button">+</button>
                    <a class="btn btn-primary float-right ml-1 pl-1 pr-1" href="cart.html">加入购物车</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <h6 class="mb-3 p-2 text-muted small">
            <nav aria-label="Page navigation example">
              <ul class="pagination mb-0 justify-content-end">
                <li class="page-item" :class="{disabled:pno==0}"><a class="page-link bg-transparent" href="javascript:;" @click="goto(-1)">上一页</a></li>
                <li class="page-item" v-for="(n,i) of pcount" :key="i" :class="{active:i==pno}"><a class="page-link" :class="{
                  'bg-transparent':i!=pno
                }" href="javascript:;" @click="load(i)" v-text="n"></a></li>
                <!--<li class="page-item active"><a class="page-link border" href="#">2</a></li>
                <li class="page-item"><a class="page-link bg-transparent" href="#">3</a></li>-->
                <li class="page-item"  :class="{disabled:pno==pcount-1}"><a class="page-link bg-transparent" href="javascript:;" @click="goto(+1)">下一页</a></li>
              </ul>
            </nav>
          </h6>
        </div>
        <div class="col-md-3 pl-0">
          <h5 class="justify-content-between align-items-center mb-1 text-muted p-2">
            <img src="img/foodstore/foodstore_icon2.png" alt=""> 商家公告
          </h5>
          <div class="bg-white small p-4 text-muted mb-3">
            <p>本店推出全网最低价套餐，保证比其他平台的价格要低！</p>
            <p>不要葱、姜、蒜等这些忌口暂时无法坐不了，敬请谅解！</p>
            <p>晚上10点以后订餐需另加送餐费2元！谢谢合作！</p>
          </div>
          <ul id="cart" class="list-group mb-3">
          <!-- <ul id="cart" class="list-group mb-3 position-fixed"> -->
            <li class="p-0 list-group-item d-flex justify-content-between lh-condensed">
              <h6 class="w-100 d-flex justify-content-between align-items-center mb-0 text-muted p-2 "> 购物车<a class="btn btn-link text-muted" href="#">清空</a>
              </h6>
            </li>
            <li class="p-0 list-group-item d-flex justify-content-between lh-condensed">
              <div class="input-group input-group-sm mt-1 mb-1">
                <div class="input-group-prepend">
                  <span class="input-group-text text-truncate bg-white p-1 border-0 d-inline-block" title="戴尔DELL灵越游匣15PR-5645B 15.6英寸游戏笔记本电脑(i5-7300HQ 8G 128GSSD+1T GTX1050 4G独显 FHD)黑">戴尔DELL灵越游匣15PR-5645B 15.6英寸游戏笔记本电脑(i5-7300HQ 8G 128GSSD+1T GTX1050 4G独显 FHD)黑</span>
                  <button class="btn btn-outline-secondary p-0 border-0" type="button">-</button>
                </div>
                <input type="text" class="form-control p-1" aria-label="Small" value="10" aria-describedby="inputGroup-sizing-sm">
                <div class="input-group-append">
                  <button class="btn btn-outline-secondary p-0 border-0" type="button">+</button>
                  <span class="input-group-text bg-white border-0 p-0 pl-1">¥59990.00</span>
                </div>
              </div>
            </li>
            <li class="p-0 list-group-item d-flex justify-content-between lh-condensed">
              <div class="input-group input-group-sm mt-1 mb-1">
                <div class="input-group-prepend">
                  <span class="input-group-text text-truncate bg-white p-1 border-0 d-inline-block" title="Apple MacBook Air 13.3英寸笔记本 银色(Core i5 处理器/8GB内存/256GB SSD闪存 MMGG2CH/A)">Apple MacBook Air 13.3英寸笔记本 银色(Core i5 处理器/8GB内存/256GB SSD闪存 MMGG2CH/A)</span>
                  <button class="btn btn-outline-secondary p-0 border-0" type="button">-</button>
                </div>
                <input type="text" class="form-control p-1" aria-label="Small" value="10" aria-describedby="inputGroup-sizing-sm">
                <div class="input-group-append">
                  <button class="btn btn-outline-secondary p-0 border-0" type="button">+</button>
                  <span class="input-group-text bg-white border-0 p-0 pl-1">¥69880.00</span>
                </div>
              </div>
            </li>
            <li class="p-0 list-group-item bg-secondary text-right">
              <img class="mb-2" src="img/foodstore/foodstore_car_2.png" alt="">
              <h4 class="d-inline-block text-white pt-2 m-0">￥129870.00</h4>
              <a class="btn btn-lg btn-primary float-right ml-1 pl-0 pr-0" href="cart.html">去结算</a>
            </li>
          </ul>
        </div>
      </div>
    </main>
  </div>
</template>
<script>
export default {
  data(){
    return {
      plist:[],
      pcount:0,
      pno:0
    }
  },
  props:["kw"],
  created(){
    this.load();
  },
  methods:{
    goto(i){
      if((i==-1&&this.pno!=0)||(i==+1&&this.pno!=this.pcount-1)){
        this.load(parseInt(this.pno)+parseInt(i));
      }
    },
    load(pno=0){
      this.axios.get(
        "http://localhost:5050/products",
        {
          params:{
            kw:this.kw,
            pno
          }
        }
      ).then(res=>{
        console.log(res.data);
        this.plist=res.data.data;
        this.pcount=res.data.pageCount;
        this.pno=res.data.pno;
      })
    }
  },
  watch:{
    "$route"(){
      this.load();
    }
  }
}
</script>
<style>
@import url("../assets/css/products.css");
</style>
