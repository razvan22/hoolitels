import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Result from '../views/Result.vue'
import Signup from '../views/Signup.vue'
import UserProfile from '../views/UserProfile.vue'
import UserInformationForm from '../components/UserInformationForm.vue'


Vue.use(VueRouter)

  const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/user/form',
    name: 'UserInformationForm',
    component: UserInformationForm 
  },
  {
    path: '/userprofile',
    name: 'UserProfile',
    component: UserProfile 
  },

  {
    path: '/result',
    name: 'Result',
    component: Result 
  },

  {
    path: '/signup',
    name: 'Signup',
    component: Signup
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  }

]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
