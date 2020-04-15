import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import M from '@/assets/materialize.min.js'





Vue.config.productionTip = false

new Vue({
  M,
  router,
  store,
  render: h => h(App),
}).$mount('#app')
