<template>
  <div>
    <my-header/>
    <main id="main" class="container">
      <nav aria-label="breadcrumb">
        <ol class="breadcrumb small bg-transparent">
          <li class="breadcrumb-item"><a class="text-dark font-weight-bold small" href="#">首页</a></li>
          <li class="breadcrumb-item"><a class="text-dark font-weight-bold small" href="#">学习用品</a></li>
          <li class="breadcrumb-item text-dark font-weight-bold small active" aria-current="page">笔记本电脑</li>
        </ol>
      </nav>
      <div class="container mb-5">
        <div class="row pr-3" id="parent">
          <div id="preview" class="col pr-0">
            <div class="card bg-transparent mr-5 position-absolute">
              <img class="card-img-top" :src="pics[i].md" alt="Card image cap" id="mImg">
              <div id="mask" class="position-absolute" :class="{'d-none':!maskShow}" :style="maskStyle"></div>
              <div id="super-mask" class="position-absolute" @mouseover="toggle" @mouseout="toggle"
              @mousemove="maskMove"></div>
              <div id="div-lg" class="position-absolute" :class="{'d-none':!maskShow}" :style="{
                'background-image':`url(${pics[i].lg})`,'background-position':bgPosition
              }"></div>
              <div class="card-body p-0 text-center">
                <img src="img/product_detail/hover-prev.png" class="btn float-left btn-light border-0 p-1 pt-4 pb-4" :class="{disabled:leftDisabled}" @click="move(-1)" id="btnLeft">
                <div class="d-inline-block pt-2 mx-0 m-auto">
                  <!-- <ul class="list-unstyled mb-0"> -->
                  <ul class="list-unstyled mb-0" id="ulImgs" :style="ulStyle">
                    <li v-for="(p,i) of pics" :key="i" class="float-left p-1" @mouseover="changei(i)">
                      <img :src="p.sm">
                    </li>
                  </ul>
                </div>
                <img src="img/product_detail/hover-next.png" class="btn float-right btn-light border-0 p-1 pt-4 pb-4 " :class="{disabled:rightDisabled}" id="btnRight"  @click="move(+1)">
              </div>
            </div>
          </div>
          <div id="details" class="col pl-0">
            <h6 id="ptitle" class="font-weight-bold" v-text="product.title">
            </h6>
            <h6>
              <a class="small text-dark font-weight-bold" href="javascript:;"  id="p_sub_title" v-text="product.subtitle"></a>
            </h6>
            <div class="alert alert-secondary small" role="alert">
              <div>
                <span>学员售价：</span>
                <h2 class="d-inline text-primary font-weight-bold"  id="pprice" v-cloak>¥{{product.price.toFixed(2)}}</h2>
              </div>
              <div>
                <span>服务承诺：</span>
                <span  id="ppromise" v-text="product.promise"></span>
              </div>
            </div>
            <!-- 客服 -->
            <p class="mb-1">
              <span class="small">客服：</span>
              <span class="small">联系客服</span>
              <img class="mb-3" src="img/product_detail/kefuf.gif">
            </p>
            <!-- 规格 -->
            <div>
              <div class="float-left small">规格：</div>
              <div class="float-left w-75" id="specs">
                <router-link v-for="(sp,i) of specs" :key="i" class="btn btn-sm btn-outline-secondary" :class="{ active: sp.lid==lid}" :to="`/details/${sp.lid}`" v-text="sp.spec"></router-link>
                <!--删除73，74，75三行-->
              </div>
              <div class="clearfix"></div>
            </div>
            <!-- 数量 -->
            <div class="mt-2">
              <div class="float-left small">数量：</div>
              <div class="input-group mb-3 w-25">
                <div class="input-group-prepend">
                  <button class="btn btn-outline-secondary p-1" type="button">-</button>
                </div>
                <input type="text" value="1" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
                <div class="input-group-append">
                  <button class="btn btn-outline-secondary p-1" type="button">+</button>
                </div>
              </div>
              <div class="clearfix"></div>
            </div>
            <!-- 购买部分 -->
            <div>
              <a class="btn pt-3 pb-2 pl-5 pr-5" href="javascript:;"><h5>立即购买</h5></a>
              <a class="btn btn-primary pt-3" href="javascript:;">
                <h5><img src="img/product_detail/product_detail_img7.png" alt=""> 加入购物车</h5>
              </a>
              <a class="btn btn-primary pt-1 pb-1 collection" href="javascript:;">
                <img src="img/product_detail/product_detail_img6.png">
                <br>
                收藏
              </a>
            </div>
          </div>
        </div>
      </div>
      <div class="container mb-5">
        <h4 class="d-inline-block ml-3">为你推荐</h4>
        <h6 class="d-inline-block bg-dark text-white ml-2">大家都在看</h6>
        <div id="recommend" class="border pl-3">
          <ul class="list-unstyled" style="width: 1100px; margin-left:-220px;">
            <li class="float-left">
              <div class="card mb-1 p-4 border-0 bg-transparent box-shadow">
                <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail" alt="Thumbnail [100%x225]" src="img/product_detail/product_detail_1.png" data-holder-rendered="true">
                <div class="card-body p-0">
                  <p class="card-text text-center small">ThinkPad New S2 (20GUA00QCD)13.3英寸超霸</p>
                </div>
              </div>
            </li>
            <li class="float-left">
              <div class="card mb-1 p-4 border-0 bg-transparent box-shadow">
                <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail" alt="Thumbnail [100%x225]" src="img/product_detail/product_detail_2.png" data-holder-rendered="true" >
                <div class="card-body p-0">
                  <p class="card-text text-center small">戴尔 DELL燃7000 R1605S 超霸</p>
                </div>
              </div>
            </li>
            <li class="float-left">
              <div class="card mb-1 p-4 border-0 bg-transparent box-shadow">
                <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail" alt="Thumbnail [100%x225]" src="img/product_detail/product_detail_3.png" data-holder-rendered="true" >
                <div class="card-body p-0">
                  <p class="card-text text-center small">戴尔(DELL)魔方15MF Pro-R2505TSS灵</p>
                </div>
              </div>
            </li>
            <li class="float-left">
              <div class="card mb-1 p-4 border-0 bg-transparent box-shadow">
                <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail" alt="Thumbnail [100%x225]" src="img/product_detail/product_detail_4.png" data-holder-rendered="true" >
                <div class="card-body p-0">
                  <p class="card-text text-center small">联想(Lenovo) YOGA900 (YOGA4 PRO)多彩版</p>
                </div>
              </div>
            </li>
            <li class="float-left">
              <div class="card mb-1 p-4 border-0 bg-transparent box-shadow">
                <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail" alt="Thumbnail [100%x225]" src="img/product_detail/product_detail_1.png" data-holder-rendered="true">
                <div class="card-body p-0">
                  <p class="card-text text-center small">ThinkPad New S2 (20GUA00QCD)13.3英寸超霸</p>
                </div>
              </div>
            </li>
          </ul>
        </div>
      </div>
      <nav class="navbar flex-md-nowrap p-0 ml-3">
        <form class="form-inline pl-2">
          <button class="btn bg-transparent rounded-0 pt-3 pb-2 active" type="button"><h5>商品详情</h5></button>
          <button class="btn bg-transparent rounded-0 pt-3 pb-2" type="button"><h5>商品评价</h5></button>
        </form>
        <ul class="navbar-nav">
          <li class="nav-item text-nowrap">
            <a class="btn btn-primary p-3 border-bottom" href="javascript:;">
              <h5><img src="img/product_detail/product_detail_img7.png" alt=""> 加入购物车</h5>
            </a>
          </li>
        </ul>
      </nav>
      <div id="params" class="container">
        <div class="row mr-1">
          <div class="col-md-10 pt-5">
            <a name="规格参数"></a>
            <h6 class="d-inline-block ml-3">规格参数 <img src="img/product_detail/product_detail_icon_1.png" alt=""></h6>
            <div class="pl-3">
              <ul class="list-unstyled">
                <li class="float-left mb-2"><a class="text-muted small" href="#">商品名称：AppleMacBook Air</a></li>
                <li class="float-left mb-2"><a class="text-muted small" href="#">系统：MacOS</a></li>
                <li class="float-left mb-2"><a class="text-muted small" href="#">内存容量：8G</a></li>
                <li class="float-left mb-2"><a class="text-muted small" href="#">分辨率：1920*1080</a></li>
                <li class="float-left mb-2"><a class="text-muted small" href="#">显卡型号：集成显卡</a></li>
                <li class="float-left mb-2"><a class="text-muted small" href="#">处理器：Intel i5低功耗版</a></li>
                <li class="float-left mb-2"><a class="text-muted small" href="#">显存容量：其它</a></li>
                <li class="float-left mb-2"><a class="text-muted small" href="#">分类：轻薄本</a></li>
                <li class="float-left mb-2"><a class="text-muted small" href="#">硬盘容量:128G固态</a></li>
              </ul>
            </div>
            <a name="商品介绍"></a>
            <h6 class="d-inline-block mt-4 mb-3 ml-3">商品介绍 <img src="img/product_detail/product_detail_icon_4.png" alt=""></h6>
            <div> 
              <div>   
                <div>
                  <img alt="" class="" src="img/product/detail/57b15612N81dc489d.jpg">   
                </div>  
              </div>
              <div>   
                <div>    
                  <img alt="" class="" src="img/product/detail/57b15616N1e285f09.jpg">   
                </div>  
              </div>
              <div>   
                <div class="pl-3 small">技术规格请前往 www.apple.com/cn/macbook-air/specs.html 查看完整内容。</div>
              </div>
            </div>
            <a name="售后保障"></a>
            <h6 class="d-inline-block mt-4 mb-3 ml-3">售后保障 <img src="img/product_detail/product_detail_icon_3.png" alt=""></h6>
            <div class="pl-3"> 
              <div>
                <p class="text-primary font-weight-bold">
                  <img src="img/product_detail/product_detail_img16.png" alt="">
                  正品保障
                </p>
                <p class="small">
                  达内学子商城向您保证所售商品均为正品行货，达内自营商品开具机打发票或电子发票。
                </p>
                <p class="text-primary font-weight-bold">
                  <img src="img/product_detail/product_detail_img16.png" alt="">
                  全国联保
                </p>
                <p class="small">
                  凭质保证书及达内商城发票，可享受全国联保服务，与您亲临商场选购的商品享受相同的质量保证。达内商城还为您提供具有竞争力的商品价格和运费政策，请您放心购买！
                  注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！
                </p>
              </div>
            </div>
            <a name="包装清单"></a>
            <h6 class="d-inline-block mt-4 mb-3 ml-3">包装清单 <img src="img/product_detail/product_detail_icon_2.png" alt=""></h6>
            <div class="pl-3">
              <p class="small">笔记本 x1 适配器 x1 电源线 x1 电池 x1 说明书（电子版）x1 备注：笔记本电脑的背面只会标注此电脑的系列，例如： XPS 13-9360 ，如果您需要核实此电脑的具体配置型号是否与达内页面相符，可电话咨询达内厂商：800-858-2969</p>
            </div>
          </div>
          <div class="col-md-2 mb-4 pt-5 pl-2">
            <a class="btn p-3 pl-4 pr-4 mb-2" href="#规格参数">
              <h5 class="text-dark mb-0"><img src="img/product_detail/product_detail_icon_g_1.png" alt=""> 规格参数</h5>
            </a>
            <a class="btn p-3 pl-4 pr-4 mb-2" href="#商品介绍">
              <h5 class="text-dark mb-0k"><img src="img/product_detail/product_detail_icon_t_1.png" alt=""> 商品介绍</h5>
            </a>
            <a class="btn p-3 pl-4 pr-4 mb-2" href="#售后保障">
              <h5 class="text-dark mb-0"><img src="img/product_detail/product_detail_icon_d_1.png" alt=""> 售后保障</h5>
            </a>
            <a class="btn p-3 pl-4 pr-4 mb-2" href="#包装清单">
              <h5 class="text-dark mb-0"><img src="img/product_detail/product_detail_icon_bao_1.png" alt=""> 包装清单</h5>
            </a>
            <a class="btn p-3 pl-4 pr-4 mb-2" href="#header">
              <h5 class="text-dark mb-0"><img src="img/product_detail/product_detail_icon_up_1.png" alt=""> 回到顶部</h5>
            </a>
          </div>
        </div>
      </div>
    </main>
  </div>
</template>
<script>
export default {
  data(){
    return {
      product:{price:0},//防止首次加载时product.price.toFixed(2)报错
      pics:[{md:""}],//防止首次加载时pics[0].md报错
      specs:[],
      i:0,//记录当前正在显示第几张图片

      ulStyle:{//控制ul的样式
        width:0,
        "margin-left":0, //绑定margin-left
        transition:""
      },
      times:0,//记录左移的次数
      //ulStyle的margin-left=-times*62

      maskShow:false,
      maskStyle:{
        left:0,
        top:0
      }
    }
  },
  props:["lid"],
  computed:{
    bgPosition(){
      var left=parseInt(this.maskStyle.left);
      var top=parseInt(this.maskStyle.top);
      return `-${left*16/7}px -${top*16/7}px`
    },
    leftDisabled(){//左边按钮的禁用状态
      return this.times==0;
    },
    rightDisabled(){//右边按钮的禁用状态
      return this.pics.length<=4||this.times==this.pics.length-4;
    }
  },
  created(){
    //在页面加载时，发送一次请求，初始化data中的数据
    this.load();
  },
  watch:{//监控
    times(){
      this.ulStyle["margin-left"]=-this.times*62+"px";
    },
    pics(){
      this.ulStyle.width=this.pics.length*62+'px';
    },
    lid(){//lid变量的变化
      //只要lid发生变化
      //就重新请求服务端数据
      //更换data中的变量
      this.load();
    }
  },
  methods:{
    maskMove(e){
      var left=e.offsetX-88;
      var top=e.offsetY-88;
      if(left<0){left=0}
      else if(left>176){left=176}
      if(top<0){top=0}
      else if(top>176){top=176}
      top+="px";
      left+="px";
      this.maskStyle={left,top}
    },
    toggle(){
      this.maskShow=!this.maskShow;
    },
    move(i){
      //如果点的是左边按钮，且左边按钮没有禁用时
      //或
      //如果点的是右边按钮，且右边按钮没有禁用
      if((i==-1&&this.leftDisabled==false)||(i==1&&this.rightDisabled==false)){
        this.times+=i;
        if(this.times<0){ this.times=0}
        else if(this.times>this.pics.length-4){
          this.times=this.pics.length-4
        }
      }
    },
    load(){//封装发送ajax请求和初始化数据的方法，用于反复调用
      if(this.lid){
        //在发请求之前就清除transition
        this.ulStyle.transition="";
        this.axios.get(
          "http://localhost:5050/details",
          {
            params:{
              lid:this.lid
            }
          }
        ).then(result=>{
          console.log(result.data);
          var {product, pics, specs}=result.data;
          this.product=product;
          this.pics=pics;
          this.specs=specs;
          //每次重新加载页面后，都要把移动次数归零
          this.times=0;
          this.i=0;//先前显示的图片下标也归0
          //删除src/assets/css/details.css中35~37行
          //一切都初始化完之后，最后再设置ul的transition
          setTimeout(()=>{
            this.ulStyle.transition=
              "margin-left .5s linear";
          },50)
        })
      }
    },
    //当鼠标进入每个li时，修改data中i变量的值，为当前li的下标。
    changei(i){
      this.i=i;
      //data中i改变，导致中图片的src和大图片的background-image自动同时变化。
    }
  }
}
</script>
<style>
@import url("../assets/css/details.css");
</style>
