<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Page Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="../lib/vue.js"></script>
    <link rel="stylesheet" href="../lib/bootstrap.css">
    <style>
    li{
        list-style:none;
    }
    </style>
</head>
<body>
    <div id="app">
        <com @func="loadComments"></com>
        <ul class="list-group">
            <li class="list-group-item" v-for="item in list">
                {{item.content}}<span class="badge">{{item.user}}</span>
            </li>
        </ul>
    </div>
        <!-- 评论区组件 -->
    <template id="tmp">
        <div>
            <div class="form-group"><label>评论人</label><input class="form-control" id="user" v-model:value="user"/></div>
             <div class="form-group"><label>评论内容</label><input class="form-control" id="content" v-model:value="content"/></div>   
                <div><input type="button" class="btn btn-primary" value="发表评论" @click="postComments"/></div>
        </div>
    </template>
    <script>
    var tmp={
        template:"#tmp",
        data:function(){
            return {
                user:'',
                content:''
            }
        },
        methods:{
            postComments(){
                var comment={user:this.user,content:this.content};
                var list=JSON.parse(localStorage.getItem('cmts')||'[]');
                list.unshift(comment);
                localStorage.setItem('cmts',JSON.stringify(list));//数组对象和字符串相互转换的过程
                this.user='';
                this.content='';
                this.$emit('func');
            }
        }
    }
    var vm=new Vue({
        el:"#app",
        data:{
            list:[]
        },
        created(){
           this.loadComments();
        },
        methods:{
            loadComments(){
                this.list=JSON.parse(localStorage.getItem('cmts')||'[]');
            }
        },
        components:{
            'com':tmp
        }
        
    });
    </script>
</body>
</html>