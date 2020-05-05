import Vue from "vue";
import VueRouter from "vue-router";
import Home from "../views/Home.vue";
import Result from "../views/Result.vue";
import Signup from "../views/Signup.vue";
import HotelVy from "../views/HotelVy.vue";
import Payment from "../views/Payment.vue";
import Order from "../views/Order.vue";
import UserProfile from "../views/UserProfile.vue";
Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home,
  },
  {
    path: "/userprofile",
    name: "UserProfile",
    component: UserProfile,
  },

  {
    path: "/result",
    name: "Result",
    component: Result,
  },

  {
    path: "/signup",
    name: "Signup",
    component: Signup,
  },
  {
    path: "/hotelVy/:hotel",
    name: "HotelVy",
    props: true,
    component: HotelVy,
  },

  {
    path: "/order",
    name: "Order",
    component: Order,
  },

  {
    path: "/payment",
    name: "Payment",
    component: Payment,
  },
  //   ,
  // {
  //   path: '/about',
  //   name: 'About',
  //   // route level code-splitting
  //   // this generates a separate chunk (about.[hash].js) for this route
  //   // which is lazy-loaded when the route is visited.
  //   component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  // }
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
