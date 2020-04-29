<template>
  <div id="header">
    <div class="row row1">
      <div class="col m3 no-pad"></div>
      <div class="col s12 m6">
        <div class="col s2 smallogo hide-on-med-and-up">          
        <router-link to="/">
        <img src="../assets/logo_minimal.gif" class="logo" /></router-link></div>
        <div class="col m6 l4 hide-on-small-only">          
        <router-link to="/">
        <img src="../assets/logo_minimal.gif" class="logo" /></router-link></div>
        <div class="col s1"></div>

        <i
          data-target="slide-out"
          class="white-text medium material-icons sidenav-trigger waves-effect waves-light col s3"
        >account_circle</i>
      </div>
      <div class="col m3 no-pad"></div>
    </div>
    <ul id="slide-out" class="sidenav">
        <login-form-component v-if="!userLogged" />
        <logged-form-component v-if="userLogged"/>
    </ul>
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
#header .logo {

  margin-top: 10px;
  width: 100%;
}

#header .row .smallogo {

  margin-left: 0px;
  margin-right: 40px;
  width: 32%;
}

#header .row1 .no-pad {
  padding: 0px;
}

#header .sidenav-trigger {
  margin: 10px;
}

#header .row1 {
  display: flex;
  align-content: flex-end;
  justify-content: flex-end;
}

/* #header >>> .row {
  display: inline;
} */

#header .row .col {
  /* justify-content: center; */
  display: flex;
  padding-right: 0px;
}
#header .row .responsive {
  width: 70%;
  height: auto;
}
</style>
