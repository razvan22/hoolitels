<template>
  <div id="header" >
    <div class="container">
      <div class="row row-form">
        <div class="col s3 m2 l2">
          <i
            data-target="slide-out"
            class="large material-icons  sidenav-trigger waves-effect waves-light"
            >account_circle</i>
          <ul id="slide-out" class="sidenav">
            <login-form-component/>
          </ul>
        </div>
      </div>
      <div class="row">
        <div class="col s12 m12 l12">
          <img src="../assets/logo_minimal.gif" class="responsive" />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import M from 'materialize-css/dist/js/materialize.js'
  import LoginFormComponent from '../components/LoginFormComponent.vue'
  export default {
    components:{
      LoginFormComponent
      
    },

 
    mounted() {
      let loginForm = document.querySelectorAll('.sidenav')
      M.Sidenav.init(loginForm, { edge: 'right' })
    },
    methods: {

    }
  }
};
</script>

<style scoped>
#header .container .row .responsive {
    width: 40%;
    height: auto;
  }
 
</style>
