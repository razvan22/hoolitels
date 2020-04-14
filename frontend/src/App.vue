<template>
  <div id="app">
    <Header></Header>

    <Footer></Footer>
  </div>
</template>




<script>
import Footer from '@/components/Footer.vue'
import Header from '@/components/Header.vue'

export default {
  components:{
    Footer,
    Header
  },
  data(){
    return{
      users: []
    }
  },

  methods:{
    getUsers: async function(){
      let result = await fetch("http://localhost:8080/rest/user/");
      result = await result.json();
      this.users = result;
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
