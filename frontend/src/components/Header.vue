<template>
  <div id="header" >
    <div class="container">
      <div class="row row-form">
        <div class="col s8">
          <img src="../assets/logo_minimal.gif" class="responsive" />
        </div>
        <div class="col s3 m2 l2">
          <i
            data-target="slide-out"
            class="cyan-text text-darken-2 medium material-icons sidenav-trigger waves-effect waves-light"
          >account_circle</i>
          <ul id="slide-out" class="sidenav">
            <login-form-component v-if="!userLogged" />
            <logged-form-component v-if="userLogged"/>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import M from 'materialize-css/dist/js/materialize.js'
  import LoginFormComponent from '../components/LoginFormComponent.vue'
  import LoggedFormComponent from '../components/LoggedFormComponent.vue'
  export default {
    components:{
      LoginFormComponent,
      LoggedFormComponent
      
    },
    computed:{
      userLogged(){
        return this.$store.state.userLogged
      }
      
    },
 
    mounted() {
      let loginForm = document.querySelectorAll('.sidenav')
      M.Sidenav.init(loginForm, { edge: 'right' })
    },
    methods: {

    }
  }

</script>

<style scoped>
#header .container .row-form {
  display: flex;
  align-content: flex-end;
  justify-content: end;
}

#header .container .row .col {
  justify-content: center;
  display: flex;
}
#header .container .row .responsive {
  width: 70%;
  height: auto;
}

#header .container .row i {
  /* font-size: 2em; */
  /* color: #006064; */
}
</style>
