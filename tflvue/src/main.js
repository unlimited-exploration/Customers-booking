import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios'
// import MyHeader from './components/MyHeader'
Vue.prototype.HOST = 'http://localhost:4000'
// Vue.component("my-header",MyHeader);

Vue.prototype.axios=axios;
Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
