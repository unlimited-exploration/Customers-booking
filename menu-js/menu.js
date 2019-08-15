(function(){
    var login = 1;// 判断用户是否登录
    var  count;

    var ul = document.getElementById("ul");
    // 用事件冒泡获取当前点击的是哪个菜系
    ul.onclick=function(e){
        // 如果我当前点击的是a标签
        if(e.target.nodeName=="A"){
            // alert(`${e.target.innerHTML}!`);
            /*
            目标：
                拿当前点击元素的自定义的属性data-id值,按照该值去找页面上对应的div的id属性
                并给其div添加样式active，其他展示的所有兄弟元素的div设置为display-none(隐藏)
            */
            //获取当前点击的父元素li,给父元素设置样式menu_nav_active
            var li = e.target.parentNode;
            // console.log(li)
            var liwei = li.parentNode.children;
            for(var l of liwei){
                l.setAttribute("class","");
            }
            li.setAttribute("class","menu_nav_active");
            //  获取当前点击的a标签中自定义的属性data-id值
            var data = e.target.getAttribute("data-id");
            // console.log(data);
            
            //通过data-id的值获取要向上的div 
            var div = document.getElementById(data);
            // console.log(div);   
            var wei = div.parentNode.children;
            // console.log(wei)
            for(var w of wei){
                w.setAttribute("class","cai display-none");
            }
            div.setAttribute("class","cai  active");
        }
        
    }

    // 功能二：实现点击添加按钮实现span中加1
    // 1.获取所有"+" "-" 按钮的集合
    var btn_jia = document.getElementsByClassName("btn_jia");
    var btn_jian = document.getElementsByClassName("btn_jian");
    // console.log(but_a);
    // 点击加按钮
    for(var item of btn_jia){
        item.onclick = function(e){
            // 要登录才能订购菜品
            if(login==-1){
                alert("请登录!");
                return;
            }
            if(e.target.nodeName=="A"){
               
                // console.log(e.target.innerHTML);
                // 获取当前点击的下一个元素span
                var span = e.target.nextElementSibling;
                var i = span.innerHTML;
                i++;
                count=i;
                span.innerHTML=`${i}` 
            }  
        }
    }
    for(var item of btn_jian){
        item.onclick = function(e){
            if(e.target.nodeName=="A"){
                if(login==-1){
                    alert("请登录!");
                    return;
                }
                // console.log(e.target.innerHTML);
                // 获取当前点击的上一个元素span
                var span = e.target.previousElementSibling;
                var i = span.innerHTML;
                i--;
                if(i>=0){
                    span.innerHTML=`${i}`;
                    count=i;
                }else{
                    alert("不能再减了！");
                    count=i;
                }
            }  
        }
    }
    
    // 功能三 点击确定按钮 修改表 跳转页面至购物车模块 并且在在购物车上添加商品
    var submit = document.getElementsByClassName("submit");
    for(var item of submit){
        item.onclick = function(e){
            if(e.target.nodeName=="A"){
                if(login==-1){
                    // location.href="http://www.baidu.com";
                    alert("请登录!");
                    return;
                }
                // 要跳转的页面-----购物车模块
                // 只有当选中的菜的数量大于0 才进行添加购物车
               if(count>0){ 
                // 点击确定按钮，获取 该图片图片 菜名 多少份 多少元parentNode.children
                var img = e.target.parentNode.previousElementSibling.children[0].src; //图片
                var cname = e.target.parentNode.children[0].innerHTML;//菜名
                var  shu = e.target.parentNode.children[3].innerHTML; //点了多少份
                var price = e.target.parentNode.children[1].innerHTML;//一份多少钱
                price = price.slice(1);
                console.log(price);
                // 获取购物车模块
                var shopp = document.querySelector(".yeslogin>.shopp");
                // console.log(shopp.innerHTML);
                shopp.innerHTML += `
                    <div class="portion">
                        <div>
                            <img src="${img}" alt="">
                        </div>
                        <div><span>${shu}</span>份</div>
                        <div>¥<span>${(shu*price)}</span></div>
                        <div>${cname}</div>
                        <div><a href="javascript:;">×</a></div>
                    </div>
                ` ;
               }else{
                   alert("您还没有添加此菜品哦！");
               }
                // console.log(111)
            }
        }
    }

    // 功能四 根据是否登录，在右侧div区域显示或右侧div
    // 判断是否登录 登录显示 div.yeslogin
    //             未登录时显示：div.notlogin

    // 1.获取登录和未登录时的元素div
    var notlogin = document.querySelector(".show .right_img .notlogin");
    var yeslogin = document.querySelector(".show .right_img .yeslogin");
    console.log(notlogin);
    if(login==-1){
        notlogin.setAttribute("class","notlogin active");
        yeslogin.setAttribute("class","yeslogin display-none");
        return;
    }else{
        notlogin.setAttribute("class","notlogin display-none");
        yeslogin.setAttribute("class","yeslogin active");
    }

})();