<template>
    <div id="menu">
          <!-- 二级导航栏区域 -->
            <div class="menu_nav">
                <ul class="padding-left" id="ul" @click="menu">
                    <li class="menu_nav_active"><a href="javascript:;" id="rou" data-id="roucai" data-cid="1">肉菜</a></li>
                    <li><a href="javascript:;" id="su" data-id="sucai" data-cid="2">素菜</a></li>
                    <li><a href="javascript:;" id="tian" data-id="tiandian" data-cid="3">甜点</a></li>
                    <li><a href="javascript:;" id="yin"  data-id="yinliao" data-cid="4">饮料</a></li>
                </ul>
            </div> 
            <div class="show">
                <!-- 食品图片内容区域 -->
                <div class="menu_mian">
                    <!-- 肉菜 -->
                    <div id="roucai" class="cai active">
                        <ul>
                            <li v-for="(item,i) of msg" :key="i">
                                <a href="javascript:;">
                                    <!-- 图片 -->
                                     <img src="../../public/img/rou/rou2.jpg" alt="">
                                </a>
                                <!-- <span>{{item.sid}}</span> -->
                                <div class="explain">
                                    <!-- 菜名 -->
                                    <span v-text="item.sname"></span>
                                   <!--  价格 -->
                                    <span>￥{{item.price}}</span>
                                    <a class="button_a btn_jia" @click="add(+1)" :data-id=item.sid :data-quantity=item.quantity>+</a>
                                   <!-- 多少份 -->
                                    <span>{{item.quantity}}</span>
                                    <a class="button_a btn_jian" @click="add(-1)">-</a>
                                    <a class="button_a submit" href="javascript:;">确定</a>
                                </div>
                            </li>
                            <!-- <li>
                                <a href="javascript:;">
                                     <img src="../../public/img/rou/rou2.jpg" alt="">
                                </a>
                                <div class="explain">
                                    <span>酸辣藕丁</span>
                                    <span>¥79.00</span>
                                    <a class="button_a btn_jia">+</a>
                                    <span>0</span>
                                    <a class="button_a btn_jian">-</a>
                                    <a class="button_a submit" href="javascript:;">确定</a>
                                </div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                     <img src="../../public/img/rou/rou1.jpg" alt="">
                                </a>
                                <div class="explain">
                                    <span>回锅肉</span>
                                    <span>¥79.00</span>
                                    <a class="button_a btn_jia">+</a>
                                    <span>0</span>
                                    <a class="button_a btn_jian">-</a>
                                    <a class="button_a button" href="javascript:;">确定</a>
                                </div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                     <img src="../../public/img/rou/rou2.jpg" alt="">
                                </a>
                                <div class="explain">
                                    <span>酸辣藕丁</span>
                                    <span>¥79.00</span>
                                    <a class="button_a btn_jia">+</a>
                                    <span>0</span>
                                    <a class="button_a btn_jian">-</a>
                                    <a class="button_a button" href="javascript:;">确定</a>
                                </div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                     <img src="../../public/img/rou/rou2.jpg" alt="">
                                </a>
                                <div class="explain">
                                    <span>酸辣藕丁</span>
                                    <span>¥79.00</span>
                                    <a class="button_a btn_jia">+</a>
                                    <span>0</span>
                                    <a class="button_a btn_jian">-</a>
                                    <a class="button_a submit" href="javascript:;">确定</a>
                                </div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                     <img src="../../public/img/rou/rou2.jpg" alt="">
                                </a>
                                <div class="explain">
                                    <span>酸辣藕丁</span>
                                    <span>¥79.00</span>
                                    <a class="button_a btn_jia">+</a>
                                    <span>0</span>
                                    <a class="button_a btn_jian">-</a>
                                    <a class="button_a submit" href="javascript:;">确定</a>
                                </div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                     <img src="../../public/img/rou/rou1.jpg" alt="">
                                </a>
                                <div class="explain">
                                    <span>回锅肉</span>
                                    <span>¥79.00</span>
                                    <a class="button_a btn_jia">+</a>
                                    <span>0</span>
                                    <a class="button_a btn_jian">-</a>
                                    <a class="button_a button" href="javascript:;">确定</a>
                                </div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                     <img src="../../public/img/rou/rou2.jpg" alt="">
                                </a>
                                <div class="explain">
                                    <span>酸辣藕丁</span>
                                    <span>¥79.00</span>
                                    <a class="button_a btn_jia">+</a>
                                    <span>0</span>
                                    <a class="button_a btn_jian">-</a>
                                    <a class="button_a button" href="javascript:;">确定</a>
                                </div>
                            </li> -->
                        </ul> 
                    </div>
                    <!-- 素菜 -->
                    <div id="sucai" class="cai display-none">
                        <ul>
                            <li>
                               <a href="javascript:;">
                                    <img src="../../public/img/sucai/s1.jpg" alt="">
                               </a>
                               <div class="explain">
                                   <span>回锅肉</span>
                                   <span>¥79.00</span>
                                   <a class="button_a btn_jia" @click="add(+1)">+</a>
                                   <span>{{quantity}}</span>
                                   <a class="button_a btn_jian" @click="add(-1)">-</a>
                                   <a class="button_a submit" href="javascript:;">确定</a>
                               </div>
                            </li>
                            <!-- <li>
                               <a href="javascript:;">
                                   <img src="../../public/img/sucai/s2.jpg" alt="">
                                </a>
                               <div class="explain">
                                    <span>酸辣藕丁</span>
                                    <span>¥53.00</span>
                                    <a class="button_a btn_jia">+</a>
                                    <span>0</span>
                                    <a class="button_a btn_jian">-</a>
                                    <a class="button_a submit" href="javascript:;">确定</a>
                               </div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../../public/img/sucai/s3.jpg" alt="">
                                </a>
                               <div class="explain">
                                       <span>烟笋烧肉</span>
                                       <span>¥39.00</span>
                                       <a class="button_a btn_jia">+</a>
                                       <span>0</span>
                                       <a class="button_a btn_jian">-</a>
                                       <a class="button_a submit" href="javascript:;">确定</a>
                               </div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                     <img src="../../public/img/sucai/s1.jpg" alt="">
                                </a>
                                <div class="explain">
                                    <span>回锅肉</span>
                                    <span>¥79.00</span>
                                    <a class="button_a btn_jia">+</a>
                                     <span>0</span>
                                     <a class="button_a btn_jian">-</a>
                                    <a class="button_a submit" href="javascript:;">确定</a>
                                </div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../../public/img/sucai/s2.jpg" alt="">
                                 </a>
                                <div class="explain">
                                     <span>酸辣藕丁</span>
                                     <span>¥53.00</span>
                                     <a class="button_a btn_jia">+</a>
                                     <span>0</span>
                                     <a class="button_a btn_jian">-</a>
                                     <a class="button_a submit" href="javascript:;">确定</a>
                                </div>
                            </li>
                            <li>
                                 <a href="javascript:;">
                                     <img src="../../public/img/sucai/s3.jpg" alt="">
                                 </a>
                                <div class="explain">
                                        <span>烟笋烧肉</span>
                                        <span>¥39.00</span>
                                        <a class="button_a btn_jia">+</a>
                                        <span>0</span>
                                        <a class="button_a btn_jian">-</a>
                                        <a class="button_a" href="javascript:;">确定</a>
                                </div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../../public/img/sucai/s3.jpg" alt="">
                                </a>
                               <div class="explain">
                                       <span>烟笋烧肉</span>
                                       <span>¥39.00</span>
                                       <a class="button_a btn_jia">+</a>
                                       <span>0</span>
                                       <a class="button_a btn_jian">-</a>
                                       <a class="button_a" href="javascript:;">确定</a>
                               </div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../../public/img/sucai/s3.jpg" alt="">
                                </a>
                                <div class="explain">
                                       <span>烟笋烧肉</span>
                                       <span>¥39.00</span>
                                       <a class="button_a btn_jia">+</a>
                                       <span>0</span>
                                       <a class="button_a btn_jian">-</a>
                                       <a class="button_a" href="javascript:;">确定</a>
                                </div>
                            </li> -->
                        </ul>                  
                    </div>       
                    <!-- 甜点 -->
                    <div id="tiandian" class="cai display-none">
                        <ul>
                            <li>
                                <a href="javascript:;">
                                     <img src="../../public/img/tiandian/t_1.jpg" alt="">
                                </a>
                                <div class="explain">
                                    <span>回锅肉</span>
                                    <span>¥79.00</span>
                                    <a class="button_a btn_jia" @click="add(+1)">+</a>
                                    <span>{{quantity}}</span>
                                    <a class="button_a btn_jian" @click="add(-1)">-</a>
                                    <a class="button_a submit" href="javascript:;">确定</a>
                                </div>
                            </li>
                            <!-- <li>
                                <a href="javascript:;">
                                    <img src="../../public/img/tiandian/t_2.jpg" alt="">
                                </a>
                                <div class="explain">
                                    <span>酸辣藕丁</span>
                                    <span>¥53.00</span>
                                    <a class="button_a btn_jia">+</a>
                                    <span>0</span>
                                    <a class="button_a btn_jian">-</a>
                                    <a class="button_a submit" href="javascript:;">确定</a>
                                </div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../../public/img/tiandian/t_3.jpg" alt="">
                                </a>
                                <div class="explain">
                                    <span>烟笋烧肉</span>
                                    <span>¥39.00</span>
                                    <a class="button_a btn_jia">+</a>
                                    <span>0</span>
                                    <a class="button_a btn_jian">-</a>
                                    <a class="button_a" href="javascript:;">确定</a>
                                </div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                     <img src="../../public/img/tiandian/t_1.jpg" alt="">
                                </a>
                                <div class="explain">
                                    <span>回锅肉</span>
                                    <span>¥79.00</span>
                                    <a class="button_a btn_jia">+</a>
                                    <span>0</span>
                                    <a class="button_a btn_jian">-</a>
                                    <a class="button_a" href="javascript:;">确定</a>
                                </div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../../public/img/tiandian/t_2.jpg" alt="">
                                </a>
                                <div class="explain">
                                    <span>酸辣藕丁</span>
                                    <span>¥53.00</span>
                                    <a class="button_a btn_jia">+</a>
                                    <span>0</span>
                                    <a class="button_a btn_jian">-</a>
                                    <a class="button_a" href="javascript:;">确定</a>
                                </div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../../public/img/tiandian/t_3.jpg" alt="">
                                </a>
                                <div class="explain">
                                    <span>烟笋烧肉</span>
                                    <span>¥39.00</span>
                                    <a class="button_a btn_jia">+</a>
                                    <span>0</span>
                                    <a class="button_a btn_jian">-</a>
                                    <a class="button_a" href="javascript:;">确定</a>
                                </div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../../public/img/tiandian/t_2.jpg" alt="">
                                </a>
                                <div class="explain">
                                    <span>酸辣藕丁</span>
                                    <span>¥53.00</span>
                                    <a class="button_a btn_jia">+</a>
                                    <span>0</span>
                                    <a class="button_a btn_jian">-</a>
                                    <a class="button_a" href="javascript:;">确定</a>
                                </div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../../public/img/tiandian/t_3.jpg" alt="">
                                </a>
                                <div class="explain">
                                    <span>烟笋烧肉</span>
                                    <span>¥39.00</span>
                                    <a class="button_a btn_jia">+</a>
                                    <span>0</span>
                                    <a class="button_a btn_jian">-</a>
                                    <a class="button_a" href="javascript:;">确定</a>
                                </div>
                            </li> -->
                        </ul>
                    </div>   
                    <!-- 酒水 -->
                    <!-- <div id="yinliao" class="cai display-none">
                        <ul>
                            <li>
                                <a href="javascript:;">
                                     <img src="../../public/img/yinliao/j_1.jpg" alt="">
                                </a>
                                <div class="explain">
                                    <span>回锅肉</span>
                                    <span>¥79.00</span>
                                    <a class="button_a btn_jia" @click="jia">+</a>
                                    <span>{{quantity}}</span>
                                    <a class="button_a btn_jian" @click="jian">-</a>
                                    <a class="button_a submit" href="javascript:;">确定</a>
                                </div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../../public/img/yinliao/j_2.jpg" alt="">
                                </a>
                                <div class="explain">
                                    <span>酸辣藕丁</span>
                                    <span>¥53.00</span>
                                    <a class="button_a btn_jia">+</a>
                                    <span>0</span>
                                    <a class="button_a btn_jian">-</a>
                                    <a class="button_a submit" href="javascript:;">确定</a>
                                </div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../../public/img/yinliao/j_3.jpg" alt="">
                                </a>
                                <div class="explain">
                                    <span>烟笋烧肉</span>
                                    <span>¥39.00</span>
                                    <a class="button_a btn_jia">+</a>
                                    <span>0</span>
                                    <a class="button_a btn_jian">-</a>
                                    <a class="button_a" href="javascript:;">确定</a>
                                </div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                     <img src="../../public/img/yinliao/j_1.jpg" alt="">
                                </a>
                                <div class="explain">
                                    <span>回锅肉</span>
                                    <span>¥79.00</span>
                                    <a class="button_a btn_jia">+</a>
                                    <span>0</span>
                                    <a class="button_a btn_jian">-</a>
                                    <a class="button_a" href="javascript:;">确定</a>
                                </div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../../public/img/yinliao/j_2.jpg" alt="">
                                </a>
                                <div class="explain">
                                    <span>酸辣藕丁</span>
                                    <span>¥53.00</span>
                                    <a class="button_a btn_jia">+</a>
                                    <span>0</span>
                                    <a class="button_a btn_jian">-</a>
                                    <a class="button_a" href="javascript:;">确定</a>
                                </div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../../public/img/yinliao/j_3.jpg" alt="">
                                </a>
                                <div class="explain">
                                    <span>烟笋烧肉</span>
                                    <span>¥39.00</span>
                                    <a class="button_a btn_jia">+</a>
                                    <span>0</span>
                                    <a class="button_a btn_jian">-</a>
                                    <a class="button_a" href="javascript:;">确定</a>
                                </div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../../public/img/yinliao/j_2.jpg" alt="">
                                </a>
                                <div class="explain">
                                    <span>酸辣藕丁</span>
                                    <span>¥53.00</span>
                                    <a class="button_a btn_jia">+</a>
                                    <span>0</span>
                                    <a class="button_a btn_jian">-</a>
                                    <a class="button_a" href="javascript:;">确定</a>
                                </div>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <img src="../../public/img/yinliao/j_3.jpg" alt="">
                                </a>
                                <div class="explain">
                                    <span>烟笋烧肉</span>
                                    <span>¥39.00</span>
                                    <a class="button_a btn_jia">+</a>
                                    <span>0</span>
                                    <a class="button_a btn_jian">-</a>
                                    <a class="button_a" href="javascript:;">确定</a>
                                </div>
                            </li>
                         </ul>
                    </div> -->
                </div>
            </div>
    </div>
</template>
<script >
export default {
    data() {
        return {
            quantity:0,
            cid:1,
            msg:[],
        }
    },
    methods: {
        menu(e){
            // 目的：点击导航栏的每一按钮，实现页面的切换
      
            if(e.target.nodeName=="A"){//如果点击的是a标签
                // 1.获取自定义的id  data-id
                var did = e.target.dataset.id;
                var cid = e.target.dataset.cid; //发送axios时，要有一个id(根据id值查询)
                this.cid = cid;
                var li = e.target.parentNode;
                var ul = li.parentNode.children;
                //切换按钮实现点击后按钮样式改变  
                for(var item of ul){
                    item.setAttribute("class","")
                }
                li.setAttribute("class","menu_nav_active");
                // 2. 通过jquery获取show模块中对应的div
                var $div = $(`#${did}`);
                console.log($div)
                // 3.把除自己外的兄弟div的样式设置隐藏
                $div.siblings().attr("class","cai display-none")
                // 4.自己设置显示
                $div.attr("class",'cai active');

                // 5.点击切换就发送axios请求
                this.selectcai();
            }
        },
        add(i){//点击加按钮
           //目的:点击 "+" 按钮 实现数量+1
           this.quantity+=i;
           if(this.quantity<0){
               alert("不能再减了！");
               this.quantity=0;
               return;
           }
        },
        upquantity(sid,quantity){//修改quantity
            // if(sid && quantity){
            //     console.log(sid+" : "+quantity);
            //     this.axios.get("http://127.0.0.1:3000/user/quantity",
            //         {
            //             params:{sid:sid,quantity:quantity}
            //         }
            //     ).then(result=>{
            //         console.log(result);
            //     })
            //     this.selectcai();
            // }
            
        } ,
        selectcai(){//查询菜单
            if(this.cid){
                console.log(this.cid)
            this.axios.get("http://127.0.0.1:3000/user/shop",
             {
                 params:{
                     lid:this.cid
                 }
             }
            ).then(result=>{
                // console.log(result);
                // console.log(result.data.msg);
                this.msg=result.data.msg;
            })
        }
        }
    },
    created(){
       this.selectcai();
    }
}
</script>
<style>
@import url("../assets/css/menu.css");
@import url("../assets/css/pubmenu.css");
</style>


     
