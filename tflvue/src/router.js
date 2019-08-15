import Vue from 'vue'
import Router from 'vue-router'
import Index from './views/Index'
import Details from './views/Details'
import NotFound from './views/NotFound'

Vue.use(Router)

export default new Router({
  routes: [
    {path:"/", component:Index},
    {path:"/details/:lid", component: Details, props:true},
    {path:"*", component:NotFound}
  ]
})