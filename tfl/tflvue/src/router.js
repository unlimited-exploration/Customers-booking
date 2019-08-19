import Vue from 'vue'
import Router from 'vue-router'
// import Index from './views/Index'
// import Details from './views/Details'
// import NotFound from './views/NotFound'
import Login from './components/Login.vue'
import Register from './components/Register.vue'

Vue.use(Router)

export default new Router({
  routes: [
    {path:"/login", component:Login},
    {path:"/register", component:Register}
  ]
})
