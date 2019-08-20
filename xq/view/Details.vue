<style>
  @import "../css/base.css";
  @import "../css/evaluate.css";
  @import "../css/discuss.css";
</style>
<script src="../js/discuss.js"></script>
<template>
  <div>
    <section class="pj_area">
        <div class="pj_img">
            <img src="../img/beef.jpg" alt="">
        </div>
        <div class="pj_shopping">
            <div class="shopping_name">潮汕牛肉丸</div>
            <div class="shopping_price">优惠价99/份</div>
        </div>
        <div class="product_introduction">
            牛肉(肥瘦)：牛肉富含丰富蛋白质，氨基酸组成比猪肉更接近人体需要，能提高机体抗病能力，对生长发育及手术后，病后调养的人在补充失血、修复组织等方面特别适宜，寒冬食牛肉可暖胃，是该季节的补益佳品；牛肉有补中益气，滋养脾胃，强健筋骨，化痰息风，止渴止涎之功效，适宜于中气下隐、气短体虚、筋骨酸软、贫血久病及面黄目眩之人食用。
        </div>
    </section>
    <!-- 评论区内容 -->
    <div class="discuss">网友评论</div>
    <ul id="pn">
    <li class="list0">
        <div class="head"></div>
        <div class="content">
            <p class="text">
                <span class="name">Andy：</span>
            </p>
            <div class="feeling">好吃!</div>
            <div class="pic"></div>
            <div class="good"><span class="date">02-14 23:01</span><a class="dzan" href="javascript:;">赞</a></div>
            <div class="people" total="2980">2980人觉得很赞</div>
            <div class="comment-list">
                <div class="comment" user="self">
                    <div class="comment-left"></div>
                    <div class="comment-right">
                        <div class="comment-text"><span class="user">老王：</span>这道菜绝了</div>
                        <div class="comment-date">02-14 22:00 <a class="comment-zan" href="javascript:;" total="23" my="1">23 取消赞</a> <a class="comment-dele" href="javascript:;">回复</a> </div>
                    </div>
                </div>
                <div class="comment" user="self">
                    <div class="comment-left"></div>
                    <div class="comment-right">
                        <div class="comment-text"><span class="user">我：</span>好吃到哭！</div>
                        <div class="comment-date">02-14 24:00 <a class="comment-zan" href="javascript:;" total="0" my="0">赞</a> <a class="comment-dele" href="javascript:;">删除</a> </div>
                    </div>
                </div>
            </div>
            <div class="hf">
                <textarea type="text" class="hf-text" autocomplete="off" maxlength="100">评论…</textarea>
                <button class="hf-btn">回复</button>
                <span class="hf-nub">0/100</span> </div>
        </div>
    </li>
    <li class="list0">
        <div class="head">
          <div class="content">
            <p class="text"><span class="name">apple：</span></p>
            <div class="feeling">好吃还富有弹性！</div>
            <div class="pic"></div>
            <div class="good"><span class="date">02-14 23:01</span><a class="dzan" href="javascript:;">赞</a></div>
            <div class="people" total="0" style="display: none;"></div>
            <div class="comment-list">
                <div class="comment" user="self">
                    <div class="comment-left"></div>
                    <div class="comment-right">
                        <div class="comment-text"><span class="user">我：</span>材料新鲜，调味精美</div>
                        <div class="comment-date">02-14 24:00 <a class="comment-zan" href="javascript:;" total="286" my="1">286 取消赞</a> <a class="comment-dele" href="javascript:;">删除</a> </div>
                    </div>
                </div>
            </div>
            </div>
            <div class="hf">
                <textarea type="text" class="hf-text" autocomplete="off" maxlength="100">评论…</textarea>
                <button class="hf-btn">回复</button>
                <span class="hf-nub">0/100</span> </div>
        </div>
    </li>
</ul>
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
