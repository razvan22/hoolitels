import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import VModal from 'vue-js-modal'
 
Vue.use(VModal)

// import M from 'materialize-css/dist/js/materialize.js'
Vue.config.productionTip = false;

export const bus = new Vue();

new Vue({
  // M,
  router,
  store,
  render: (h) => h(App),
}).$mount("#app");
